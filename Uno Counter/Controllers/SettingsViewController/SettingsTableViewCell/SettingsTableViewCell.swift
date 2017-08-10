//
//  SettingsTableViewCell.swift
//  Uno Counter
//
//  Created by Alexandr Pavlov on 8/9/17.
//  Copyright © 2017 Softintercom. All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    static let identifier = String(describing: SettingsTableViewCell.self)
    
    //MARK: - Outlets
    
    @IBOutlet public weak var settingsImage: UIImageView!
    @IBOutlet public weak var settingsTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
