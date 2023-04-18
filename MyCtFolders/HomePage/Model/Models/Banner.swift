//
//  Banner.swift
//  MyCtFolders
//
//  Created by undhad kaushik on 01/04/23.
//

import Foundation

struct Banner: Decodable {
    var id: Int
    var image: String
    
    enum CodingKeys: String, CodingKey {
        case id = "v_id"
        case image = "filename"
    }
}
