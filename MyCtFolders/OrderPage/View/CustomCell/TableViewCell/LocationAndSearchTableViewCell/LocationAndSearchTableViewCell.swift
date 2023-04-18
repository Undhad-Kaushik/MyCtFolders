//
//  LocationAndSearchTableViewCell.swift
//  MyCtFolders
//
//  Created by undhad kaushik on 09/04/23.
//

import UIKit

class LocationAndSearchTableViewCell: UITableViewCell {

    @IBOutlet weak var myOrderLabel: UILabel!
    @IBOutlet weak var notificationButton: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
