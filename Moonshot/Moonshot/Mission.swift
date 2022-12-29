//
//  Mission.swift
//  Moonshot
//
//  Created by Johel Zarco on 28/12/22.
//

import Foundation

struct Mission: Codable, Identifiable{
    struct CrewRole : Codable{
        let name : String
        let role : String
    }
    let id : Int
    let launchDate : Date?
    let crew : [CrewRole]
    let description : String
    
    var displayName : String{
        return "Apollo \(id)"
    }
    // compose image name according to asset catalog
    var image : String{
        return "apollo\(id)"
    }
    // format date to appropiate
    var formattedLaunchDate : String{
        return launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    
}
