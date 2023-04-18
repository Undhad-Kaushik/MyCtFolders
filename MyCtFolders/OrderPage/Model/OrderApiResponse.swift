//
//  OrgerApiResponse.swift
//  MyCtFolders
//
//  Created by undhad kaushik on 09/04/23.
//

import Foundation

struct OrderApiResponce: Decodable {
    var error: Bool
    var data: [OrderAPIData]

    enum CodingKeys: String, CodingKey {
        case error
        case data 
    }
}
