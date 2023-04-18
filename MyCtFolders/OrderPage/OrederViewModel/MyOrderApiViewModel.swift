//
//  OrderViewModel.swift
//  MyCtFolders
//
//  Created by undhad kaushik on 09/04/23.
//

import Foundation


struct MyOrderApiViewModel {
    private let orderApidata: OrderAPIData
    
    init(orderApidata: OrderAPIData) {
        self.orderApidata = orderApidata
    }
    
    func getTime() -> String { return orderApidata.dateAndTime }
    func getOrderVendorName() -> String { return orderApidata.vendorName }
    func getStetus() -> String { return orderApidata.stats }
    func getTotalPrice() -> String { return orderApidata.totalPrice }
    func getOrdreId() -> String? { return orderApidata.orderId }
    
}
