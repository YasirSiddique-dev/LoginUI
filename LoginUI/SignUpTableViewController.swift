//
//  SignUpTableViewController.swift
//  LoginUI
//
//  Created by Yasir Siddique on 05/11/2021.
//  Copyright © 2021 Yasir Siddique. All rights reserved.
//

import UIKit

class SignUpTableViewController: UITableViewController {

    //IBOutlets for view
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var passField: UITextField!
    
    //SignUp button Actions
    @IBAction func signUp(_ sender: Any)
    {
        //parsing fields data into variables
        let name = nameField.text
        let email = emailField.text
        let pass = passField.text
        let city = cityField.text
        let address = addressField.text
        let phone = phoneField.text
    
        //check if email or password isEmpty or not
        if email == "" || pass == "" || name == "" || city == "" || address == "" || phone == ""
        {
            alertPop(msg: "Please fill all the fields")
        }
        //check if email is valid or not
        else if isValidEmail(email: email!) == false
        {
           alertPop(msg: "Please enter valid email.")
            
        }
    
    }
    //check if email is valid or not
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    //alert function
    func alertPop(msg : String)
    {
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        //recognizing the taps
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        }

     @objc func dismissKeyboard() {
           view.endEditing(true)
       }
    
       }
