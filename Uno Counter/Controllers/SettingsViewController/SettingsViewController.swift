//
//  SettingsViewController.swift
//  Uno Counter
//
//  Created by Alexandr Pavlov on 8/9/17.
//  Copyright © 2017 Softintercom. All rights reserved.
//

import UIKit

enum SettingsIndex : Int {
    case appColor = 0, testEnum
}

class SettingsViewController: UIViewController {
   
    //MARK: - Outlets
    
    @IBOutlet weak var settingsTableView: UITableView! {
        
        didSet {
            settingsTableView.tableFooterView = UIView()
            settingsTableView.register(UINib.init(nibName: SettingsTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: SettingsTableViewCell.identifier)
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - UITableViewDataSource
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as! SettingsTableViewCell
        
        switch SettingsIndex(rawValue: indexPath.row)! {
        case .appColor:
            cell.settingsTitle.text = "App Color"
        case .testEnum:
            cell.settingsTitle.text = "Test"
        }
        
        return cell
    }
    
    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch SettingsIndex(rawValue: indexPath.row)! {
        case .appColor:
            
            let controller = self.storyboard?.instantiateViewController(withIdentifier: ColorPreviewTableViewController.identifier) as! ColorPreviewTableViewController
            self.navigationController?.pushViewController(controller, animated: true)
            
        case .testEnum:
            print("salut")
        }
    }
}
