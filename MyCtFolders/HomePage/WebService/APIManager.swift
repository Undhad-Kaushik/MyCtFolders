//
//  APIManager.swift
//  MyCtFolders
//
//  Created by undhad kaushik on 01/04/23.
//

import Foundation
import Alamofire

class APIManager {
    
    // MARK: - API
    func request(with url: String,methodtype: HTTPMethod? = nil,header: HTTPHeaders? = nil,parameters: Parameters? = nil, completionHandler: @escaping(Result<Data, APIError>)-> Void){
        guard let url = URL(string: url) else {
            completionHandler(.failure(.urlDoesNotFound))
            return
        }
        
        AF.request(url, method: methodtype ?? .get, parameters: parameters,encoding: URLEncoding.default, headers: header).responseData { response in
            
            guard let statusCode = response.response?.statusCode,(200...299).contains(statusCode)
            else{
                completionHandler(.failure(.invalidResponse))
                return
            }
            
            guard let data = response.data
            else {
                completionHandler(.failure(.dataNotFound))
                return
            }
            completionHandler(.success(data))
        }
    }
}

enum APIError: Error {
    case urlDoesNotFound
    case invalidResponse
    case dataNotFound
}

