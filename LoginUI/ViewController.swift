//
//  ViewController.swift
//  LoginUI/Users/yasir/Documents/Xcode Project/LoginUI/LoginUI/ViewController.swift
//
//  Created by Yasir Siddique on 04/11/2021.
//  Copyright © 2021 Yasir Siddique. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //IBoutlets for UI Elements
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var pwdField: UITextField!
       
    //SignIn button Actions
    @IBAction func signInButton(_ sender: Any)
    {
        let email = emailField.text
        let pass = pwdField.text
        
        //check if email or password isEmpty or not
        if email == "" || pass == "" {
            alertPop(msg: "Please fill the fields")
        }
        //check if email is valid or not
        else if isValidEmail(email: email!) == false
        {
           alertPop(msg: "Please enter valid email.")
            
        }

    }
    
    //Email validation function
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    //Alert Function
    func alertPop(msg : String)
    {
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Looks for single or multiple taps
         let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    

}

