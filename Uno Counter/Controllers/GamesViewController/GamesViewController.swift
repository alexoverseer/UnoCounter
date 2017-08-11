//
//  GamesViewController.swift
//  Uno Counter
//
//  Created by Alexandr Pavlov on 8/9/17.
//  Copyright © 2017 Softintercom. All rights reserved.
//

import UIKit

class GamesViewController: UIViewController {

    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        
        super.setEditing(editing, animated: animated)
    }
}

class GamesTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: GamesTableViewCell.self)
}
