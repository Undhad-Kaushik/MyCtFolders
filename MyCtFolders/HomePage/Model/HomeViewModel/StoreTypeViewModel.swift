//
//  StoreTypeViewModel.swift
//  MyCtFolders
//
//  Created by undhad kaushik on 06/04/23.
//

import Foundation

struct StoreTypeViewModel {
    private let storeType: StoreType

    init(storeType: StoreType) {
        self.storeType = storeType
    }

    func getStoreId() -> String { storeType.id }
    func getType() -> String { storeType.type }
    func getImageName() -> String {
        return Config.baseURlForCatagories + (storeType.image.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
    }
}
