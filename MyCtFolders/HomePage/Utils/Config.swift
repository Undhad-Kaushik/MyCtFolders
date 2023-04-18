//
//  Config.swift
//  MyCtFolders
//
//  Created by undhad kaushik on 28/03/23.
//

import Foundation
import UIKit

struct Config {
    static let appName = "MyCtFolders"
    static let dataBseName = "MyCtFolders.db"
    static let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    static  let androidLink: String = "https://play.google.com.store/apps/details?id=com.pragma.MyCtFolders"
    static let iOSLink: String = "items-apps://itunes.apple.com/us/app/apple-store/id1552347410?mt=8"
    static let iosSharingText: String = "Simple & easly your order"
    static let appDateFormat = "dd MMM yyyy"
    static let appTimeFormat = "hh:mm a"
    static let serverDateFormat: String = "yyyy-MM-dd"
    static let amountSign: String = "₹"
    
    static func isInternetAvailable() -> Bool {
        let reachability = Reachability()!
        return reachability.isReachable ? (reachability.isReachableViaWiFi || reachability.isReachableViaWWAN) : false
    }
    
    
    static let baseURL: String = "https://myct.store/Mobile_Services/user/v2/index.php/"
    static let baseURlForCatagories = "https://myct.store/admin/uploads/food_type/"
    static let baseURLForImage = "https://myct.store/admin/uploasds/"
    static let postURL: String = "https://gorest.co.in/public/v2/comments"
}
