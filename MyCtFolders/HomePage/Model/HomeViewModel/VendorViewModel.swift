//
//  VendorViewModel.swift
//  MyCtFolders
//
//  Created by undhad kaushik on 06/04/23.
//

import Foundation

struct VendorViewModel {
    private let vendor: Vendor
    
    init(vendor: Vendor) {
        self.vendor = vendor
    }
    
    func getStoreType() -> String { vendor.id }
    func getTypeVendorName() -> String { vendor.name }
    func getImage() -> String {
        return Config.baseURlForCatagories + (vendor.image.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
    }
    
    func isOpen() -> Bool { vendor.isOpen == "open" }
    func getDeliveryChange() -> String {
      //  return String(format: "Delivery Fees : $%.2f", Float(vendor.deliveryCharges) ?? 0)
        return "Delivery Fees: $\(vendor.deliveryCharges)"
    }
    func getMinimuOrder() -> String {
        return "Min. Order: $\(vendor.minOrder)"
    }
    
    func isFav() -> Bool { vendor.fevoriteVendor == "yes" }
}
