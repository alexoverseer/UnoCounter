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
    
    let appColors = [CustomColor.init(name: "Turquoise", color: UIColor.Turquoise),
                     CustomColor.init(name: "Emerland", color: UIColor.Emerland),
                     CustomColor.init(name: "Peter River", color: UIColor.PeterRiver),
                     CustomColor.init(name: "Amethyst", color: UIColor.Amethyst),
                     CustomColor.init(name: "Wet Asphalt", color: UIColor.WetAsphalt),
                     CustomColor.init(name: "Green Sea", color: UIColor.GreenSea),
                     CustomColor.init(name: "Nephritis", color: UIColor.Nephritis),
                     CustomColor.init(name: "Belize Hole", color: UIColor.BelizeHole),
                     CustomColor.init(name: "Midnight Blue", color: UIColor.MidnightBlue),
                     CustomColor.init(name: "Sun Flower", color: UIColor.SunFlower),
                     CustomColor.init(name: "Carrot", color: UIColor.Carrot),
                     CustomColor.init(name: "Alizarin", color: UIColor.Alizarin),
                     CustomColor.init(name: "Concrete", color: UIColor.Concrete),
                     CustomColor.init(name: "Orange", color: UIColor.Orange),
                     CustomColor.init(name: "Pumpkin", color: UIColor.Pumpkin),
                     CustomColor.init(name: "Pomegranate", color: UIColor.Pomegranate),
                     CustomColor.init(name: "Silver", color: UIColor.Silver)]

    @IBOutlet weak var colorPreviewTableView: UITableView! {
        
        didSet {
            colorPreviewTableView.tableFooterView = UIView()
        }
    }
}

extension ColorPreviewTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - UITableViewDataSource
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return appColors.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ColorPreviewTableViewCell.identifier, for: indexPath) as! ColorPreviewTableViewCell
        
        cell.backgroundColor = appColors[indexPath.row].color
        cell.colorNameLabel.text = appColors[indexPath.row].name
        
        return cell
    }
    
    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        Chameleon.setGlobalThemeUsingPrimaryColor(appColors[indexPath.row].color, with: .contrast)
        UserDefaults.standard.setColor(appColors[indexPath.row].color, forKey: Constants.appPrimaryColor)
        UserDefaults.standard.synchronize()
        UIApplication.shared.updateAppAppearance()
    }
}

class CustomColor: NSObject {
    
    var name: String!
    var color: UIColor!
    
    init(name: String, color: UIColor) {
        self.name = name
        self.color = color
    }
}

class ColorPreviewTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: ColorPreviewTableViewCell.self)
    
    @IBOutlet weak var colorNameLabel: UILabel!
}
