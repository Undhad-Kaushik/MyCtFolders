//
//  OrderViewModel.swift
//  MyCtFolders
//
//  Created by undhad kaushik on 09/04/23.
//

import Foundation
import Alamofire

class OrderViewModel {
    private(set) var arrOrderDetails: [MyOrderApiViewModel] = []
    private let apiManager: APIManager = APIManager()
    
    func apiOderDetails(completion: @escaping(Result<(), Error>) -> Void ) {
        apiManager.request(with: OrderApiEndPoint.getOrder.url, methodtype: .get) {
            responce in
            switch responce {
            case .success(let data):
                do{
                    let orderData = try JSONDecoder().decode(OrderApiResponce.self, from: data)
                    self.arrOrderDetails =  orderData.data.map { MyOrderApiViewModel(orderApidata: $0)}
                    print(self.arrOrderDetails)
                    completion(.success(()))
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func numOfSectionIn() -> Int { return 2 }
    func numOfRowIn() -> Int { 
        return arrOrderDetails.count
    }
}
