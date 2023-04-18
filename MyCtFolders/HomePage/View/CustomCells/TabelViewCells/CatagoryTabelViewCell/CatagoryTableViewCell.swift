//
//  CatagoryTableViewCell.swift
//  MyCtFolders
//
//  Created by undhad kaushik on 29/03/23.
//

import UIKit

// MARK: - Protocol
protocol CatagoryTableViewCellDeleate: AnyObject {
    func didSelect(at index: Int)
}


class CatagoryTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var viewMoreButton: UIButton!
    @IBOutlet weak var catagoryCollectionView: UICollectionView!
    
    weak var delegate: CatagoryTableViewCellDeleate?
    
    // MARK: - Array & Variabals
    var arrCatagorys: [StoreTypeViewModel] = []
    var selectCatagoryIndex: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        catagoryCollectionView.register(UINib(nibName: "CatagoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CatagoryCollectionViewCell")
    }
    
    func set(arrCatagorys: [StoreTypeViewModel], selectCatagoryIndex: Int) {
        self.arrCatagorys = arrCatagorys
        self.selectCatagoryIndex = selectCatagoryIndex
        catagoryCollectionView.delegate = self
        catagoryCollectionView.dataSource = self
        catagoryCollectionView.reloadData()
    }
    
    // MARK: - All Buttons Navigation
    @IBAction func ViewMoreButtonTapped(_ sender: UIButton) {
        
    }
    
}

extension CatagoryTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int { return 1 }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { return arrCatagorys.count }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CatagoryCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CatagoryCollectionViewCell", for: indexPath) as! CatagoryCollectionViewCell
        if selectCatagoryIndex == indexPath.row {
            cell.backgroundColor = AppColors.primarycolor
            cell.nameLabel.textColor = .white
            cell.nameLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        } else {
            cell.backgroundColor = .white
            cell.nameLabel.textColor = AppColors.primarycolor
            cell.nameLabel.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        }
        let catagory: StoreTypeViewModel = arrCatagorys[indexPath.row]
        cell.nameLabel.text = catagory.getType()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelect(at: indexPath.row)
    }
}

extension CatagoryTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 95, height: 38)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: 0.0, bottom: 8.0, right: 8.0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}
