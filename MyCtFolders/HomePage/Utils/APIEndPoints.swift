//
//  APIEndPoints.swift
//  MyCtFolders
//
//  Created by undhad kaushik on 01/04/23.
//

import Foundation

enum APIEndPoint {
    
    case getAria
    case getCity
    case homepage
    
    var url: String {
        switch self {
        case .getAria:
            return "\(Config.baseURL)/get_area"
        case .getCity:
            return "\(Config.baseURL)/get_city"
        case .homepage:
            return "\(Config.baseURL)/homepage"
        }
    }
}


