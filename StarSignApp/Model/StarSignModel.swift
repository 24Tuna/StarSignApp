//
//  StarSignModel.swift
//  StarSignApp
//
//  Created by cmStudent on 2022/06/23.
//

import Foundation

struct SignResponce:Decodable{
    let result:[StarSign]
}

struct StarSign:Decodable, Hashable{
    let altitude: Altitude
//    let altitudeNum: Double
    let content, direction: String
    let jpName, origin: String
    let starIcon: String
}

enum Altitude: String, Codable {
    case the30度位 = "30度位"
    case the45度位 = "45度位"
    case the60度位 = "60度位"
    case 水平線の近く = "水平線の近く"
    case 真上 = "真上"
}

//enum Altitude:CustomStringConvertible,Decodable{
//    case the30度位
//    case the45度位
//    case the60度位
//    case 水平線の近く
//    case 真上
//    var description: String{
//        switch self {
//        case .the30度位:
//            return "30度位"
//        case .the45度位:
//            return "45度位"
//        case .the60度位:
//            return "60度位"
//        case .水平線の近く:
//            return "水平線の近く"
//        case .真上:
//            return "真上"
//        }
//    }
//}
