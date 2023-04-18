//
//  OrderDataTableViewCell.swift
//  MyCtFolders
//
//  Created by undhad kaushik on 09/04/23.
//

import UIKit

class OrderDataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var idLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var orderImage: UIImageView!
    
    @IBOutlet weak var storeName: UILabel!
    
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var reOrderButton: UIButton!
    
    
    @IBOutlet weak var cancelButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
