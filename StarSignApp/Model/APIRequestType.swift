//
//  APIRequestType.swift
//  StarSignApp
//
//  Created by cmStudent on 2022/06/23.
//

import Foundation

protocol APIRequestType{
    associatedtype Response: Decodable
    
    //プロパティ
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
}

struct SignRequest: APIRequestType{
    typealias Response = SignResponce
    private let query: String
    let path = "/hoshimiru/constellation"
    let queryItems: [URLQueryItem]?
    
    let manager = LocationModel()
    
    let lat,lon:String
    
    init(query:String){
        
        lat = String(manager.location.coordinate.latitude)
        lon = String(manager.location.coordinate.longitude)
        
        self.query = query
        self.queryItems = [.init(name: "lat", value: lat),
                           .init(name: "lng", value: lon),
                           .init(name: "date", value: "2022-06-23"),
                           .init(name: "hour",value: "20"),
                           .init(name: "min", value: "0")]
    }
}
