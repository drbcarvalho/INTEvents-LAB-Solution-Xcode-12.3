//
//  ViewController.swift
//  INTEvents LAB Solution
//
//  Created by DanielCarvalho
//

import UIKit

class ViewController: UIViewController {

    // This is the "hard coded" credential.
    // Using Tuple to easy access those fields.
    private let credentials : (username : String, password : String) = ("admin@int4fc.com", "LaSalle2000")
    
    
    @IBOutlet weak var txtLogin: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
        
    @IBOutlet weak var btnLogin: UIButton!
    
    @IBOutlet weak var switchRememberUsername: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    func getLastAccessCredentials(){
        // this func handles the "remember me" option. It is using the UserInfo
        // class to get the stored information.
        let username = UserInfo.getUsername()
        
        if username.count > 0 {
            txtLogin.text = username
            switchRememberUsername.isOn = true
        } else {
            switchRememberUsername.isOn = false
        }
    }
    
    func setLastAccessCredentials(){
        // this func handles the "remember me" option. It is using the UserInfo
        // class to save the username (if switch is on) or clearing it (if switch
        // is off).
        if switchRememberUsername.isOn == true {
            UserInfo.setUsername(username: txtLogin.text!)
        } else {
            UserInfo.clearUsername()
        }
        
    }

    
    
    func customizeView(){
        // Rouding button's corner
        btnLogin.layer.cornerRadius = 10
        
        // Changing navigation controller background color using RGB
        self.navigationController!.navigationBar.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        
        getLastAccessCredentials()
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        // As our Segue is trigged by a button, we can intercept it and validate the login
        // fields overriding this shouldPerformSegue. If the return is TRUE, the Segue
        // will continue (transition). If the return is FALSE, it will be cancelled.
        
        if identifier == Segues.toEventsView {
            
            guard let login : String = txtLogin.text, let password : String = txtPassword.text else{
                return false
            }
            
            // isValidEmail() method is an extension on String class. See the file
            // "src/extensionString.swift" to understand the use of extension.
            if (!login.isValidEmail()) {
                ShowDialog.ok(view: self, title: "Oops!", message: "Invalid email address!", dialogType: .actionSheet)
                txtLogin.becomeFirstResponder()
                return false
            }
            
            if (login != credentials.username) {
                ShowDialog.ok(view: self, title: "Wrong credentials", message: "Incorrect username!", dialogType: .actionSheet)
                txtLogin.becomeFirstResponder()
                return false
            }
            
            if password != credentials.password {
                ShowDialog.ok(view: self, title: "Wrong credentials!", message: "Incorrect password!", dialogType: .actionSheet)
                txtPassword.becomeFirstResponder()
                return false
            }
            
            setLastAccessCredentials()
            
            return true   // Segue will continue
            
        }
        
        return false  // Segue cancelled.
        
    }
    
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // To send data to the Segue destination, we have to override the func "prepare(for segue...)"
        
        if segue.identifier == Segues.toEventsView {
            
            // Here we are accessing the public property loggedUser definied inside the
            // EventsViewController Class
            (segue.destination as! EventsViewController).loggedUser = txtLogin.text!
            
            txtPassword.text = ""
            
        }
        
    }
    

}

