//
//  HomeViewModel.swift
//  MyCtFolders
//
//  Created by undhad kaushik on 01/04/23.
//

import Foundation
import Alamofire
import UIKit

final class HomeViewModel {
    
    // MARK: - Variables & Array
    private(set) var arrCategories: [StoreTypeViewModel] = []
    private(set) var arrBanners: [BannerViewModel] = []
    private(set) var arrVendors: [VendorViewModel] = []
    private(set) var selectedCategoryIndex: Int = 0
    private(set) var selectedDeliveryIndex: Int = 0
    private(set) var vendorCount: Int = 0
    private let apiManager: APIManager = APIManager()
    
    // MARK: - API
    func fetchDetails(completion: @escaping(Result<(), Error>) -> Void) {
        let parameters: Parameters = ["area_id": "4",
                                      "city_id": "1",
                                      "custid": "",
                                      "store_type": selectedCategoryIndex == 0 ? "" : arrCategories[selectedCategoryIndex].getStoreId(),
                                      "type": selectedDeliveryIndex == 0 ? "takeaway" : "delivery"]
        
        apiManager.request(with: APIEndPoint.homepage.url, methodtype: .post, parameters: parameters) { response in
            switch response {
            case .success(let data):
                do {
                    let homePageAPIResponse = try JSONDecoder().decode(HomePageAPIResponse.self, from: data)
                    self.arrCategories = homePageAPIResponse.arrStoreTypes.map { StoreTypeViewModel(storeType: $0)}
                    self.arrBanners = homePageAPIResponse.arrBanner.map { BannerViewModel(banner: $0)}
                    self.arrVendors = homePageAPIResponse.arrVendor.map { VendorViewModel(vendor: $0)}
                    self.vendorCount = homePageAPIResponse.numStores
                    print(self.arrCategories)
                    completion(.success(()))
                } catch {
                    completion(.failure(APIError.invalidResponse))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}

// MARK: - Home model Extension
extension HomeViewModel {
    func numberOfSection() -> Int {
        if arrCategories.count > 0 , arrBanners.count > 0, arrVendors.count > 0 {
            return 5
        }
        return 0
    }
    func numberOfRow() -> Int { return 1 }
}

extension HomeViewModel {
    
    func updateIndex(selectedCategoryIndex: Int) {
        self.selectedCategoryIndex = selectedCategoryIndex
    }
    
    func updateIndexOf(selectedDeliveryIndex: Int) {
        self.selectedDeliveryIndex = selectedDeliveryIndex
    }
}

enum HomePageTableSection {
    case address
    case category(arrCategories: [StoreTypeViewModel])
    case banner(arrBanners: [BannerViewModel])
    case deliveryOptions(name: String)
    case vendor(arrVendors: [VendorViewModel])
}
