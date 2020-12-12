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
    override func loadView() {
        super.loadView()
        
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        
        tableView.backgroundColor = .clear
        view.backgroundColor = .clear
        
        tableView.register(
            UINib(nibName: "MarcheDirectionInfoTableViewCell", bundle: nil),
            forCellReuseIdentifier: MarcheDirectionInfoTableViewCell.reuseIdentifier)
        tableView.register(
            UINib(nibName: "StopTableViewCell", bundle: nil),
            forCellReuseIdentifier: StopTableViewCell.reuseIdentifier)
        tableView.register(
            UINib(nibName: "TransportTableViewCell", bundle: nil),
            forCellReuseIdentifier: TransportTableViewCell.reuseIdentifier)
        
        tableView.separatorStyle = .none
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

// MARK: - Table View Data Source
extension MarcheDirectionTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 { return 1 }
        else if section == 1 { return marcheDirection.transportsOnEndStop.count }
        else { return marcheDirection.marcheLine.count }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: MarcheDirectionInfoTableViewCell.reuseIdentifier, for: indexPath) as! MarcheDirectionInfoTableViewCell
            cell.firstStop = marcheDirection.directionInfo.firstStop
            cell.lastStop = marcheDirection.directionInfo.lastStop
            return cell
        } else if indexPath.section == 1 {
            let transport = marcheDirection.transportsOnEndStop[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: TransportTableViewCell.reuseIdentifier, for: indexPath) as! TransportTableViewCell
            cell.comment = transport.comment
            cell.setImage(name: transport.image)
            return cell
        } else {
            let object = marcheDirection.marcheLine[indexPath.row]
            
            switch object {
            case .stop(let stop):
                let cell = tableView.dequeueReusableCell(withIdentifier: StopTableViewCell.reuseIdentifier, for: indexPath) as! StopTableViewCell
                cell.time = stop.arrive
                cell.title = stop.title
                return cell
            case .transport(let transport):
                let cell = tableView.dequeueReusableCell(withIdentifier: TransportTableViewCell.reuseIdentifier, for: indexPath) as! TransportTableViewCell
                cell.comment = transport.comment
                return cell
            case .unsupported:
                return UITableViewCell()
            }
        }
    }
    
}


// MARK: - Load transport Icons
extension MarcheDirectionTableViewController {
    
    
    
}
