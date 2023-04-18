//
//  DeviveryOptionsTableViewCell.swift
//  MyCtFolders
//
//  Created by undhad kaushik on 29/03/23.
//

import UIKit

// MARK: - Protocols
protocol DeviveryOptionsTableViewCellDelegate: AnyObject {
    func didSelectIndexOf(index: Int)
}

class DeviveryOptionsTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var dileveryOptionsSegment: UISegmentedControl!
    weak var delegate: DeviveryOptionsTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        dileveryOptionsSegment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white,NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .medium)], for: .selected)
        dileveryOptionsSegment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black,NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .regular)], for: .selected)
        dileveryOptionsSegment.backgroundColor = UIColor.clear
    }
    
    func set(selectedIndex: Int) {
        dileveryOptionsSegment.selectedSegmentIndex = selectedIndex
    }
    
    // MARK: - All Buttons Navigation
    @IBAction func dileveryOptionsSegmentTspped(_ sender: UISegmentedControl) {
        delegate?.didSelectIndexOf(index: sender.selectedSegmentIndex)
    }
}
