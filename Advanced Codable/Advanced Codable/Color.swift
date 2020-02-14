//
//  Colors.swift
//  Advanced Codable
//
//  Created by Chris Rehagen on 2/10/20.
//  Copyright © 2020 Chris Rehagen. All rights reserved.
//

import Foundation


//struct ColorCollection: Codable {
//    var status: String
//    var colorsPath: String
//    var colors: [Color]
//    
//    enum CodingKeys: String, CodingKey {
//        case status
//        case colorsPath = "colors_path"
//        case colors
//    }
//}

struct Color: Codable {
    var color: String
    var category: String
    var type: String
}
