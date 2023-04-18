//
//  HomeViewController.swift
//  MyCtFolders
//
//  Created by undhad kaushik on 01/04/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - OutLets
    @IBOutlet weak var tabelView: UITableView!
    
    // MARK: - Variables
    var viewModel: HomeViewModel = HomeViewModel()
    
    var tabelViewCell = [LocationTableViewCell.identifier, CatagoryTableViewCell.identifier, BannerTableViewCell.identifier, DeviveryOptionsTableViewCell.identifier, VendorTableViewCell.identifier]
   
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        fetchDetails()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: - Initialization
    private func setup() {
        tabelViewCell.forEach{ cellName in
            tabelView.register(UINib(nibName: cellName, bundle: nil),forCellReuseIdentifier: cellName)
        }
        
        tabelView.separatorStyle = .none
        if #available(iOS 15.0, *) { tabelView.sectionHeaderTopPadding = 0.0 }
    }
    
    // MARK: - Home Page Details
    private func fetchDetails() {
        guard Config.isInternetAvailable() else {
            print("Display No internet available popup")
            return
        }
        
        viewModel.fetchDetails { result in
            switch result {
            case .success:
                print("Reload Tabel View")
                self.tabelView.reloadData()
            case .failure(let error):
                print("Show this \(error.localizedDescription) in alert view")
            }
        }
    }
}

// MARK: - Method: Tableview Delegate & Datasource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSection()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRow()
    }
    
    // MARK: - TabelView cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell: LocationTableViewCell = tableView.dequeueReusableCell(withIdentifier: "LocationTableViewCell") as! LocationTableViewCell
            return cell
        case 1:
            let cell: CatagoryTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CatagoryTableViewCell") as! CatagoryTableViewCell
            cell.delegate = self
            cell.set(arrCatagorys: viewModel.arrCategories, selectCatagoryIndex: viewModel.selectedCategoryIndex)
            return cell
        case 2:
            let cell: BannerTableViewCell = tableView.dequeueReusableCell(withIdentifier: "BannerTableViewCell") as! BannerTableViewCell
            cell.delegate = self
            cell.set(arrBanners: viewModel.arrBanners)
            return cell
        case 3:
            let cell: DeviveryOptionsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "DeviveryOptionsTableViewCell") as! DeviveryOptionsTableViewCell
            cell.delegate = self
            return cell
        case 4:
            let cell: VendorTableViewCell = tableView.dequeueReusableCell(withIdentifier: VendorTableViewCell.identifier) as! VendorTableViewCell
            cell.set(arrVendors: viewModel.arrVendors)
            return cell
        default: return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return 120
        case 1: return 80
        case 2: return 140
        case 3: return 60
        case 4: return tableView.frame.height
        default: return 44
        }
    }

    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 16))
        return headerView
    }
}

// MARK: - Protocol Extentions
extension HomeViewController: CatagoryTableViewCellDeleate{
    func didSelect(at index: Int) {
        viewModel.updateIndex(selectedCategoryIndex: index)
        tabelView.reloadData()
        fetchDetails()
    }
}

extension HomeViewController: DeviveryOptionsTableViewCellDelegate{
    func didSelectIndexOf(index: Int) {
        viewModel.updateIndexOf(selectedDeliveryIndex: index)
        tabelView.reloadData()
        fetchDetails()
    }
}

extension HomeViewController: BannerTableViewCellDelegate{
    func didSelectBanner(at index: Int) {
        print(index)
    }
}
