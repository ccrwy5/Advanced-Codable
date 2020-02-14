//
//  ColorsLoader.swift
//  Advanced Codable
//
//  Created by Chris Rehagen on 2/10/20.
//  Copyright © 2020 Chris Rehagen. All rights reserved.
//

import Foundation

class ColorsLoader {

    class func load(jsonFileName: String) -> ColorCollection? {
        var colorCollection: ColorCollection?
        let jsonDecoder = JSONDecoder()
        
        if let jsonFileUrl = Bundle.main.url(forResource: jsonFileName, withExtension: ".json"),
           let jsonData = try? Data(contentsOf: jsonFileUrl) {
                colorCollection = try? jsonDecoder.decode(ColorCollection.self, from: jsonData)
        }
        return colorCollection
    }
    
}
