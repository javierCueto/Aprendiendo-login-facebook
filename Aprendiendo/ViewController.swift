//
//  ViewController.swift
//  Aprendiendo
//
//  Created by Luis Carlos Mejia Garcia on 20/01/20.
//  Copyright © 2020 Platzi. All rights reserved.
//

import UIKit
import PopupDialog

class ViewController: UIViewController {
    // MARK: - Referencias UI
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var emailSwitch: UISwitch!
    
    private let emailKey = "email-key"
    private let storage = UserDefaults.standard
    
    @IBAction func loginButtonAction() {
        // 1. Obtener los valores de los textfield.
        let email = emailTextField.text
        let password = passwordTextField.text
        
        if email == "carlos@mejia.com", password == "123" {
            if emailSwitch.isOn{
                // save data in the usersDefaults
                storage.set(email, forKey: emailKey)
            }else{
                storage.removeObject(forKey: emailKey)
            }
            performSegue(withIdentifier: "home_segue", sender: nil)
        } else {
            print("Credenciales Inválidas.")
            showErrorDialog()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // search a string in userDefaults
        if let storageEmail = storage.string(forKey: emailKey){
            emailTextField.text = storageEmail
            emailSwitch.isOn = true
        } else{
            
            emailSwitch.isOn = false
        }
        
        
    }
    
    func showErrorDialog(){
        // Prepare the popup assets
        let title = "Error"
        let message = "Credenciales invalidas"
        let image = UIImage(named: "pexels-photo-103290")

        // Create the dialog
        let popup = PopupDialog(title: title, message: message, image: image)

        // Create buttons
        let buttonOne = CancelButton(title: "CANCEL") {
            print("You canceled the car dialog.")
        }

   

        // Add buttons to dialog
        // Alternatively, you can use popup.addButton(buttonOne)
        // to add a single button
        popup.addButtons([buttonOne])

        // Present dialog
        self.present(popup, animated: true, completion: nil)
    }

}

