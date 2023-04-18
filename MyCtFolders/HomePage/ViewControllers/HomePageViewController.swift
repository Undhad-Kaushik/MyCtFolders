//
//  HomePageViewController.swift
//  MyCtFolders
//
//  Created by undhad kaushik on 01/04/23.
//

import UIKit
import Alamofire

class HomePageViewController: UIViewController {
    
    // MARK: - Variables & Array
    var arr: [Area] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - API
    private func fetchHomePageDetails() {
        guard Config.isInternetAvailable() else {
            print("Display not internet availabel popup")
            return
        }
        let apiManager: APIManager = APIManager()
        apiManager.request(with: APIEndPoint.getAria.url) { response in
            switch response {
            case .success(let data): print("Data \(data)")
                do {
                    let areaAPIResponse = try JSONDecoder().decode(AreaApiResponse.self, from: data)
                    self.arr = areaAPIResponse.data
                    print(self.arr)
                    
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
