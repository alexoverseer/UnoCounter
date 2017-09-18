//
//  SelectPlayersViewController.swift
//  Uno Counter
//
//  Created by Alexandr Pavlov on 8/11/17.
//  Copyright © 2017 Softintercom. All rights reserved.
//

import UIKit

class SelectPlayersViewController: UIViewController {

    static let identifier = String(describing: SelectPlayersViewController.self)
    
    // MARK: - Outlets
    
    @IBOutlet weak var selectPlayersTableView: UITableView! {
        didSet {
            selectPlayersTableView.tableFooterView = UIView()
        }
    }

    //MARK: - Properties
    
    fileprivate var playersArray = [Player]()
    var selectedGameName : String?
    var selectedFinalScore: Int?
    var selectedNumberOfPlayers: Int?
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        playersArray = CoreDataManager.getAllPlayers()!
    }
}

extension SelectPlayersViewController: UITableViewDataSource, UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return playersArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 70
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PlayersTableViewCell.identifier, for: indexPath) as! PlayersTableViewCell
        cell.setCellValuesWithPlayer(player: playersArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}
