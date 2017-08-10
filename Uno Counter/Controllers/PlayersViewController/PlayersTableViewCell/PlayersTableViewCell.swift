//
//  PlayersTableViewCell.swift
//  Uno Counter
//
//  Created by Alexandr Pavlov on 8/10/17.
//  Copyright © 2017 Softintercom. All rights reserved.
//

import UIKit

class PlayersTableViewCell: UITableViewCell {

    static let identifier = String(describing: PlayersTableViewCell.self)
    
    //MARK: - Outlets
    
    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playedTimesLabel: UILabel!
    
    func setCellValuesWithPlayer(player: Player) {
        
        playerNameLabel.text = player.name
        if player.playedCount > 0 {
            playedTimesLabel.text = "Played for \(player.playedCount) times"
        } else {
            playedTimesLabel.text = "Has not played yet!"
        }
        //TODO: Add player Image
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
