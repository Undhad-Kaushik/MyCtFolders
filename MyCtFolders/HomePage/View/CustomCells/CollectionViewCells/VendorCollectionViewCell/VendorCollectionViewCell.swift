//
//  VendorCollectionViewCell.swift
//  MyCtFolders
//
//  Created by undhad kaushik on 30/03/23.
//

import UIKit
import Cosmos

class VendorCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets
    @IBOutlet weak var viewCosmos: CosmosView!
    @IBOutlet weak var minmumOrderLabel: UILabel!
    @IBOutlet weak var orderCountLabel: UILabel!
    @IBOutlet weak var vendorsNameLabel: UILabel!
    @IBOutlet weak var deleveryLabel: UILabel!
    @IBOutlet weak var vendorsImageview: UIImageView!
    @IBOutlet weak var moreViewButton: UIButton!
    @IBOutlet weak var viewFirst: UIView!
    @IBOutlet weak var viewSecond: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
