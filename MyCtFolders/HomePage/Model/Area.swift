//
//  Aria.swift
//  MyCtFolders
//
//  Created by undhad kaushik on 01/04/23.
//

import Foundation

struct Area: Decodable {
    var areaName: String
    var stats: String
    
    enum CodingKeys: String, CodingKey {
        case areaName = "area_name"
        case stats
    }
}
