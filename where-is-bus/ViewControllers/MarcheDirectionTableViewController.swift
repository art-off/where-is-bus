//
//  MarcheDirectionTableViewController.swift
//  where-is-bus
//
//  Created by art-off on 21.10.2020.
//  Copyright © 2020 art-off. All rights reserved.
//

import UIKit

class MarcheDirectionTableViewController: UITableViewController {
    
    
    // MARK: - Data Source
    var marcheDirection: MarcheDirection!
    
    
    // MARK: - Initialization
    convenience init(marcheDirection: MarcheDirection) {
        self.init()
        set(marcheDirection: marcheDirection)
    }
    
    func set(marcheDirection: MarcheDirection) {
        self.marcheDirection = marcheDirection
        tableView.reloadData()
    }
    
    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
    }

}

// MARK: - Table View Data Source
extension MarcheDirectionTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return marcheDirection.transportsOnEndStop.count + marcheDirection.marcheLine.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        if indexPath.row < marcheDirection.transportsOnEndStop.count {
            let transtopt = marcheDirection.transportsOnEndStop[indexPath.row]
            cell.textLabel?.text = transtopt.comment
            cell.textLabel?.textColor = .white
            cell.backgroundColor = .link

            return cell
        }
        
        let index = indexPath.row - marcheDirection.transportsOnEndStop.count
        let object = marcheDirection.marcheLine[index]
        
        switch object {
        case .stop(let stop):
            cell.textLabel?.text = stop.title
        case .transport(let transport):
            cell.textLabel?.text = transport.comment
            cell.backgroundColor = .link
            cell.textLabel?.textColor = .white
        case .unsupported:
            break
        }

        return cell
    }
    
}
