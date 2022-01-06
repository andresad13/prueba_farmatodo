//
//  HomeRemoteDataManager.swift
//  prueba farmatodo
//
//  Created by Leonel Alfonso on 5/01/22.
//  
//

import Foundation

class HomeRemoteDataManager:HomeRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol?
    var remoteRequestHandlerSeason: HomeRemoteDataManagerOutputProtocol?
    
    
    func externalGetDataTop() {
        let session = URLSession.shared
        var request = URLRequest(url: URL(string: "https://api.jikan.moe/v3/top/anime/1?order_by=score")!)
        request.httpMethod = "GET"
        request.setValue("application/json; charset=utf8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/x-www-fprm-urlencoded; charset=utf8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("no-cache", forHTTPHeaderField: "cache-control")
        
        session.dataTask(with: request){(data, response, error) in
        
        guard let data = data, error == nil, let respuesta = response as? HTTPURLResponse else {
            print("error en llamado \(error!)")
            return
        }
        if respuesta.statusCode == 200 {
            do{
                let decoder = JSONDecoder()
                let getURL = try decoder.decode(DatoURL.self, from: data)
                print(getURL)
                self.remoteRequestHandler?.RemoteDataManagerCallbackData(with: getURL.self)
            }catch{
                print("nose logro parsear")
            }
            
        }else{
            print("ocurio un error")
        }
        
        
    }.resume()
    }
    
    
    
    func externalGetDataSeason() {
        let session = URLSession.shared
        var request = URLRequest(url: URL(string: "https://api.jikan.moe/v3/top/anime/1?order_by=score")!)
        request.httpMethod = "GET"
        request.setValue("application/json; charset=utf8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/x-www-fprm-urlencoded; charset=utf8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("no-cache", forHTTPHeaderField: "cache-control")
        
        session.dataTask(with: request){(data, response, error) in
        
        guard let data = data, error == nil, let respuesta = response as? HTTPURLResponse else {
            print("error en llamado \(error!)")
            return
        }
        if respuesta.statusCode == 200 {
            do{
                let decoder = JSONDecoder()
                let getURL = try decoder.decode(DatoURL.self, from: data)
                print(getURL)
                self.remoteRequestHandlerSeason?.RemoteDataManagerCallbackDataSeason(with: getURL.self)
            }catch{
                print("nose logro parsear")
            }
            
        }else{
            print("ocurio un error")
        }
        
        
    }.resume()
    }
    
    
    
}
