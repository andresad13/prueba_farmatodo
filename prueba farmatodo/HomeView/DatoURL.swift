//
//  DatoURL.swift
//  prueba farmatodo
//
//  Created by Leonel Alfonso on 5/01/22.
//



struct DatoURL : Codable {

let top: [Animes]
    
    struct Animes : Codable {
        let image_url : String
    }
}
