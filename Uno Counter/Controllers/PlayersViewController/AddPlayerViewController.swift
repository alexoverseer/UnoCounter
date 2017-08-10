//
//  AddPlayerViewController.swift
//  Uno Counter
//
//  Created by Alexandr Pavlov on 8/10/17.
//  Copyright © 2017 Softintercom. All rights reserved.
//

import UIKit

class AddPlayerViewController: UIViewController, UITextFieldDelegate {

    static let identifier = String(describing: AddPlayerViewController.self)
    
    //MARK: - Outlets
    
    @IBOutlet weak var playerNameTextField: UITextField! {
        didSet {
            if let appPrimaryColor = UserDefaults.standard.color(forKey:Constants.appPrimaryColor) {
                playerNameTextField.tintColor = appPrimaryColor
            }
            playerNameTextField.becomeFirstResponder()
        }
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        addSaveButton()
        title = "Add new player"
        
        self.view.addTapGestureRecognizer {
            self.view.endEditing(true)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        playerNameTextField.delegate = nil
    }
    
    func addSaveButton() {
        
        let saveButton = UIBarButtonItem.init(barButtonSystemItem: .save, target: self, action: #selector(saveButtonAction(sender:)))
        self.navigationItem.rightBarButtonItem = saveButton
    }
    
    func saveButtonAction(sender: UIBarButtonItem) {
        
        if (playerNameTextField.text?.characters.count)! > 0 {
            CoreDataManager.addNewPlayerWithName(playerName: playerNameTextField.text!)
            navigationController?.popViewController(animated: true)
        }
    }
    
    //MARK: - UITextFieldDelegate
    
    func textFieldDidEndEditing(_ textField: UITextField) {
    
        if (textField.text?.characters.count)! > 0 {
            CoreDataManager.addNewPlayerWithName(playerName: playerNameTextField.text!)
            navigationController?.popViewController(animated: true)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
