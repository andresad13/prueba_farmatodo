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
        let title : String
        let type : String
        let episodes : Int
        let rank : Int
        let score : Float
        let start_date : String
        let url : String
        let members: Int
        
    }
}
