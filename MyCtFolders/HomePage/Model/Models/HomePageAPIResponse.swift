//
//  HomePageAPIResponse.swift
//  MyCtFolders
//
//  Created by undhad kaushik on 01/04/23.
//

import Foundation

struct HomePageAPIResponse: Decodable {
    var error: Bool
    var arrStoreTypes: [StoreType]
    var arrBanner: [Banner]
    var arrVendor: [Vendor]
    var numStores: Int
    
    enum CodingKeys: String, CodingKey {
        case error
        case arrStoreTypes = "store_type"
        case numStores = "num_stores"
        case arrBanner = "banner"
        case arrVendor = "data"
    }
}
