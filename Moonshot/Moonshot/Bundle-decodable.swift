//
//  Bundle-decodable.swift
//  Moonshot
//
//  Created by Johel Zarco on 28/12/22.
//

import Foundation

extension Bundle{
    // mdoified to used generic and decode both json objects
    func decode<T : Codable>(_ file : String) -> T{
        guard let url = self.url(forResource: file, withExtension: nil) else{
            fatalError("Failed to locate \(file) in bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else{
            fatalError("Failed to load \(file) from bundle")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(T.self, from: data) else{
            fatalError("Failed to decode \(file) from bundle")
        }
        
        return loaded
    }
}