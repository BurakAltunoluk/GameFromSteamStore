//
//  ViewController.swift
//  GameFromSteamStore
//
//  Created by Burak Altunoluk on 25/10/2022.
//

import UIKit

final class MainVC: UIViewController {
    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    private var gameData = GameListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        getData()
    }
    
    private func reload() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.activityIndicator.isHidden = true
            self.activityIndicator.stopAnimating()
        }
        
    }
    private func getData() {
        
        DispatchQueue.main.async {
            self.gameData.getDataFromApi { datam in
                if datam != nil {
                    self.gameData.gameList = datam!
                    self.reload()
                    
                }
            }
        }
    }
}



extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameData.rowNumberSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cello", for: indexPath) as! TableViewCell
        cell.textLabel?.text = gameData.indexAtRow(indexPath.row).name
        return cell
    }
    
}
