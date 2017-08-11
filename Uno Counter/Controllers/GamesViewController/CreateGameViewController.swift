//
//  CreateGameViewController.swift
//  Uno Counter
//
//  Created by Alexandr Pavlov on 8/11/17.
//  Copyright © 2017 Softintercom. All rights reserved.
//

import UIKit

class CreateGameViewController: UIViewController, UITextFieldDelegate {
    
    static let identifier = String(describing: CreateGameViewController.self)
    
    //MARK: - Outlets
    
    @IBOutlet weak var gameNameTextField: UITextField! {
        didSet {
            if let appPrimaryColor = UserDefaults.standard.color(forKey:Constants.appPrimaryColor) {
                gameNameTextField.tintColor = appPrimaryColor
            }
        }
    }
    
    @IBOutlet weak var numberOfPlayersTextField: UITextField! {
        didSet {
            if let appPrimaryColor = UserDefaults.standard.color(forKey:Constants.appPrimaryColor) {
                numberOfPlayersTextField.tintColor = appPrimaryColor
            }
        }
    }
    
    @IBOutlet weak var playToTextField: UITextField! {
        didSet {
            if let appPrimaryColor = UserDefaults.standard.color(forKey:Constants.appPrimaryColor) {
                playToTextField.tintColor = appPrimaryColor
            }
        }
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        addSaveButton()
        self.view.addTapGestureRecognizer {
            self.view.endEditing(true)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        gameNameTextField.delegate = nil
        numberOfPlayersTextField.delegate = nil
        playToTextField.delegate = nil
    }
    
    func addSaveButton() {
        
        let saveButton = UIBarButtonItem.init(barButtonSystemItem: .save, target: self, action: #selector(saveButtonAction(sender:)))
        self.navigationItem.rightBarButtonItem = saveButton
    }
    
    func saveButtonAction(sender: UIBarButtonItem) {
        
        let gameNameChecker = !(gameNameTextField.text?.isEmpty)!
        let numberOfPlayersChecker = !(numberOfPlayersTextField.text?.isEmpty)! && (Int(numberOfPlayersTextField.text!)! > 0)
        let playToChecker = !(playToTextField.text?.isEmpty)! && (Int(playToTextField.text!)! > 0)
        
        if gameNameChecker && numberOfPlayersChecker && playToChecker {
            
            let controller = self.storyboard?.instantiateViewController(withIdentifier: SelectPlayersViewController.identifier) as! SelectPlayersViewController
            controller.selectedGameName = gameNameTextField.text
            controller.selectedFinalScore = Int(playToTextField.text!)
            controller.selectedNumberOfPlayers = Int(numberOfPlayersTextField.text!)
            navigationController?.pushViewController(controller, animated: true)
            
        } else {
            showAlert(title: "Alert", message: "Please fill all text fields")
        }
    }
    
    //MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
