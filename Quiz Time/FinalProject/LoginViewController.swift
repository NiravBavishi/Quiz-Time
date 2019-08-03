//
//  ViewController.swift
//  FinalProject
//
//  Created by MacStudent on 2017-10-23.
//  Copyright © 2017 MacStudent. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var txtFieldUserName: UITextField!
    @IBOutlet weak var txtFieldPassword: UITextField!
    @IBOutlet weak var lblLogin: UILabel!
    @IBOutlet weak var switchRememberMe: UISwitch!
    @IBOutlet weak var lblHeading: UILabel!
    
    
    
    @IBOutlet weak var btnLogin: UIButton!
    
     let userDataInsert = UserDefaults.standard
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNeedsStatusBarAppearanceUpdate()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Back-01.jpg")!)
        // Do any additional setup after loading the view, typically from a nib.
        
      
        
        btnLogin.layer.cornerRadius = 7
        
        txtFieldUserName.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        txtFieldPassword.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        lblLogin.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        lblHeading.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        txtFieldUserName.layer.borderWidth = 1
        txtFieldPassword.layer.borderWidth = 1
        lblLogin.layer.borderWidth = 1
        lblLogin.layer.cornerRadius = 7
        
        let myColor = UIColor.darkGray
        
        txtFieldUserName.layer.borderColor = myColor.cgColor
        txtFieldPassword.layer.borderColor = myColor.cgColor
        lblLogin.layer.borderColor = myColor.cgColor
      
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnLoginTapped(_ sender: UIButton) {
        
        let UserName = "Admin"
        let UserPassword = "Admin@123"

        if txtFieldUserName.text == UserName && txtFieldPassword.text == UserPassword {
            
            
            if switchRememberMe.isOn {
                
                userDataInsert.set(txtFieldUserName.text, forKey: "UserEmail")
                
               
                
            }else {
                
                
                
            }
            
            userDataInsert.set(0, forKey: "NoOfAttempts")
            
            userDataInsert.set(0, forKey: "HighScore")
            userDataInsert.set(0, forKey: "LowScore")
            
            performSegue(withIdentifier: "LoginToHomeSegue", sender: self)
            
        }
        else{
            
            showAlert(Title: "Message", Message: "Invalid Username Or Password")
            
        }
        
    }
    
    
    func showAlert(Title : String, Message: String){
        
        let alert = UIAlertController(title: Title, message: Message, preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(action1)
        
        present(alert, animated: true, completion: nil)
        
    }
    
 
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
        // setNeedsStatusBarAppearanceUpdate()
    }
    
   
    
    
}

