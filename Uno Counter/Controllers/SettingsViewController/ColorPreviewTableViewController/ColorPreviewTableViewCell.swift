//
//  ColorPreviewTableViewCell.swift
//  Uno Counter
//
//  Created by Alexandr Pavlov on 8/10/17.
//  Copyright © 2017 Softintercom. All rights reserved.
//

import UIKit

class ColorPreviewTableViewCell: UITableViewCell {

    static let identifier = String(describing: ColorPreviewTableViewCell.self)
    
    @IBOutlet weak var colorNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
