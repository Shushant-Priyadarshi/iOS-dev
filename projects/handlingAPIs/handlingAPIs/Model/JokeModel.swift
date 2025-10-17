//
//  JokeModel.swift
//  handlingAPIs
//
//  Created by Shushant  on 31/08/25.
//

import Foundation

struct JokeModel:Codable{
    var statusCode:Int
    var data:JokeData
    var message:String
    var success:Bool
    
}

struct JokeData:Codable{
    var categories:[String]
    var id:Int
    var content:String
}
