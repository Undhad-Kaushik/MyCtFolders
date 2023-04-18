//
//  LocationTableViewCell.swift
//  MyCtFolders
//
//  Created by undhad kaushik on 29/03/23.
//

import UIKit

// MARK: - Protocol
class LocationTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var viewCity: UIView!
    @IBOutlet weak var viewAria: UIView!
    
    @IBOutlet weak var btnCity: UIButton!
    @IBOutlet weak var btnAria: UIButton!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        viewCity.setCorner(radius: 5)
        viewAria.setCorner(radius: 5)
        
        viewCity.setBoarder(width: 1, color: .white)
        viewAria.setBoarder(width: 1, color: .white)
        
        backgroundColor = AppColors.primarycolor
        
        btnAria.setTitle("Katargam", for: .normal)
        btnCity.setTitle("surat", for: .normal)
        
        searchBar.tintColor = AppColors.primarycolor
        searchBar.barTintColor = AppColors.primarycolor
        searchBar.backgroundColor = AppColors.primarycolor
        
        searchBar.isTranslucent = false
        
        let textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.font = UIFont.systemFont(ofSize: 14)
        textFieldInsideSearchBar?.backgroundColor = .white
        textFieldInsideSearchBar?.attributedPlaceholder = NSAttributedString(string: PlaceHolder.searchStore, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)])
        
        textFieldInsideSearchBar?.setCorner(radius: 8)
    }
    
}
