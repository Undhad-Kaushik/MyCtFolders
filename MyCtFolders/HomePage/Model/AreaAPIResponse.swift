//
//  AreaAPIResponse.swift
//  MyCtFolders
//
//  Created by undhad kaushik on 01/04/23.
//

import Foundation

struct AreaApiResponse: Decodable {
    var error: Bool
    var data: [Area]
}
