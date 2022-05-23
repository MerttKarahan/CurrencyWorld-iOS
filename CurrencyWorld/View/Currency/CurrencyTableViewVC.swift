//
//  CurrencyTableViewVC.swift
//  CurrencyWorld
//
//  Created by emn on 18.05.2022.
//

import UIKit

class CurrencyTableViewVC: UITableViewController {
    
    private var currencyListViewModel = CurrencyListViewModel()
    private let refreshController = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: UIBarButtonItem.Style.plain, target: self, action: #selector(logout))
        
        tableView.refreshControl = refreshController
        refreshController.addTarget(self, action: #selector(getNewData), for: .valueChanged)
        refreshController.tintColor = UIColor(red: 0.25, green: 0.72, blue: 0.85, alpha: 1.0)
        refreshController.attributedTitle = NSAttributedString(string: "Getting new data..")
        
        currencyListViewModel.getData {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    @objc func logout(){
        currencyListViewModel.logout { errdesc in
            self.performSegue(withIdentifier: "toLoginVC", sender: nil)
        }
    }
    
    
    @objc func getNewData() {
        currencyListViewModel.getData {
            DispatchQueue.main.async {
                self.refreshController.endRefreshing()
                self.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyListViewModel.numberOfRowsInSection()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyTableViewCell", for: indexPath) as! CurrencyTableViewCell
        let currency = currencyListViewModel.currencyAtIndex(indexPath.row).currency
        let price = currencyListViewModel.currencyAtIndex(indexPath.row).price
        cell.currencyLabel.text = currency
        cell.priceLabel.text = price
        return cell
        }
}
