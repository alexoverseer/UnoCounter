//
//  ColorPreviewTableViewController.swift
//  Uno Counter
//
//  Created by Alexandr Pavlov on 8/9/17.
//  Copyright © 2017 Softintercom. All rights reserved.
//

import UIKit
import ChameleonFramework

class ColorPreviewTableViewController: UIViewController {

    static let identifier = String(describing: ColorPreviewTableViewController.self)

    let colorsArray = [.Turquoise, .Emerland, .PeterRiver, .Amethyst, .WetAsphalt] as Array<UIColor>

    @IBOutlet weak var colorPreviewTableView: UITableView! {
        
        didSet {
            
            colorPreviewTableView.tableFooterView = UIView()
            colorPreviewTableView.register(UINib.init(nibName: SettingsTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: SettingsTableViewCell.identifier)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
}


extension ColorPreviewTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - UITableViewDataSource
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return colorsArray.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as! SettingsTableViewCell
        
        cell.settingsImage.backgroundColor = colorsArray[indexPath.row]
        
        return cell
    }
    
    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        DispatchQueue.main.sync {
            Chameleon.setGlobalThemeUsingPrimaryColor(colorsArray[indexPath.row], with: .contrast)
        }
    }
}
