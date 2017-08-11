//
//  FriendsViewController.swift
//  Uno Counter
//
//  Created by Alexandr Pavlov on 8/9/17.
//  Copyright © 2017 Softintercom. All rights reserved.
//

import UIKit

class PlayersViewController: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var noPlayersLabel: UILabel!
    @IBOutlet weak var playersTableView: UITableView! {
        didSet {
            
            playersTableView.tableFooterView = UIView()
        }
    }
    
    //MARK: - Properties
    
    fileprivate var playersArray = [Player]()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        playersArray = CoreDataManager.getAllPlayers()!
        playersArray.count > 0 ? (noPlayersLabel.isHidden = true) : (noPlayersLabel.isHidden = false)
        playersTableView.reloadData()
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        
        super.setEditing(editing, animated: animated)
        playersTableView.setEditing(editing, animated: animated)
    }
}

extension PlayersViewController: UITableViewDataSource, UITableViewDelegate {
    
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
        let controller = self.storyboard?.instantiateViewController(withIdentifier: PlayerPreviewViewController.identifier)
        navigationController?.pushViewController(controller!, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            CoreDataManager.deletePlayer(player: playersArray[indexPath.row])
            playersArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            playersArray.count > 0 ? (noPlayersLabel.isHidden = true) : (noPlayersLabel.isHidden = false)
        }
    }
}

class PlayersTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: PlayersTableViewCell.self)
    
    //MARK: - Outlets
    
    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playedTimesLabel: UILabel!
    
    func setCellValuesWithPlayer(player: Player) {
        
        playerNameLabel.text = player.name
        if player.playedCount > 0 {
            playedTimesLabel?.text = "Played for \(player.playedCount) times"
        } else {
            playedTimesLabel?.text = "Has not played yet!"
        }
        //TODO: Add player Image
    }
}
