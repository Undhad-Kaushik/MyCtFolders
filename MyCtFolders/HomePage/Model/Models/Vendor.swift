//
//  Vendor.swift
//  MyCtFolders
//
//  Created by undhad kaushik on 01/04/23.
//

import Foundation

struct Vendor: Decodable{
    var id: String
    var name: String
    var image: String
    var businessName: String
    var address: String
    var deliveryTime: String
    var deliveryTimeParaMeter: String
    var minOrder: String
    var deliveryCharges: String
    var isOpen: String
    var extraCharge: String
    var fevoriteVendor: String
    var favId: String
    var rating: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, image, address, rating
        case businessName = "business_name"
        case deliveryTime = "delivery_time"
        case deliveryTimeParaMeter = "delivery_time_in"
        case minOrder = "min_order"
        case deliveryCharges = "delivery_charges"
        case isOpen = "isopen"
        case extraCharge = "extra_charge"
        case fevoriteVendor = "favouriteRestau"
        case favId = "favid"
    }
}

