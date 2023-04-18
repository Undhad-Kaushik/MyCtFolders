//
//  OrderApiEndPoint.swift
//  MyCtFolders
//
//  Created by undhad kaushik on 09/04/23.
//

import Foundation

enum OrderApiEndPoint {
    case getOrder
    
    var url: String {
        switch self {
        case .getOrder: return "\(Config.baseURL)/get_order/8"
        }
    }
}
