//
//  OrdersViewController.swift
//  MyCtFolders
//
//  Created by undhad kaushik on 09/04/23.
//

import UIKit

class OrdersViewController: UIViewController {
    
    // MARK: - OutLets
    @IBOutlet weak var oredreTableView: UITableView!
    
    // MARK: - Variabls
    private(set) var arrOrderDetails: [MyOrderApiViewModel] = []
    let viewModel: OrderViewModel = OrderViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setup()
    }
    
    // MARK: - Cell Nib File Register
    func setup() {
        let nibFile: UINib = UINib(nibName: "LocationAndSearchTableViewCell", bundle: nil)
        oredreTableView.register(nibFile, forCellReuseIdentifier: "LocationAndSearchTableViewCell")
        
        let nibFile2: UINib = UINib(nibName: "OrderDataTableViewCell", bundle: nil)
        oredreTableView.register(nibFile2, forCellReuseIdentifier: "OrderDataTableViewCell")
        
        viewModel.apiOderDetails { result in
            switch result {
            case .success():
                self.oredreTableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: - TableViewDelegate, DataSource Methos
extension OrdersViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numOfSectionIn()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        } else {
            return viewModel.numOfRowIn()
        }
    }
    
    // MARK: - TableView Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell: LocationAndSearchTableViewCell = tableView.dequeueReusableCell(withIdentifier: LocationAndSearchTableViewCell.identifier) as! LocationAndSearchTableViewCell
            return cell
        case 1:
            let cell2: OrderDataTableViewCell = tableView.dequeueReusableCell(withIdentifier: "OrderDataTableViewCell") as! OrderDataTableViewCell
            cell2.idLabel.text = viewModel.arrOrderDetails[indexPath.row].getOrdreId()
            cell2.timeLabel.text = viewModel.arrOrderDetails[indexPath.row].getTime()
            cell2.statusLabel.text = viewModel.arrOrderDetails[indexPath.row].getStetus()
            cell2.storeName.text = viewModel.arrOrderDetails[indexPath.row].getOrderVendorName()
            cell2.priceLabel.text = viewModel.arrOrderDetails[indexPath.row].getTotalPrice()
            return cell2
        default:
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return 120
        case 1: return 200
        default: return 44
        }
    }
}

