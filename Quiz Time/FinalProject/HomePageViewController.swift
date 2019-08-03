//
//  HomePageViewController.swift
//  FinalProject
//
//  Created by MacStudent on 2017-10-24.
//  Copyright © 2017 MacStudent. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {
    
    
    @IBOutlet weak var btnStartQuiz: UIButton!
    @IBOutlet weak var btnScores: UIButton!
    @IBOutlet weak var btnInstructions: UIButton!
    @IBOutlet weak var txtViewInfo: UITextView!
    @IBOutlet weak var NavigationBat: UINavigationBar!
    
      let userDataDelete = UserDefaults.standard
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNeedsStatusBarAppearanceUpdate()
        

        // Do any additional setup after loading the view.
        
        txtViewInfo.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Back-01.jpg")!)
        
        NavigationBat.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        
        btnStartQuiz.layer.cornerRadius = 7
        btnScores.layer.cornerRadius = 7
        btnInstructions.layer.cornerRadius = 7
      
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
        // setNeedsStatusBarAppearanceUpdate()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func btnLogoutTapped(_ sender: UIBarButtonItem) {
        
        userDataDelete.removeObject(forKey: "UserEmail")
        userDataDelete.removeObject(forKey: "NoOfAttempts")
        
        performSegue(withIdentifier: "LogoutSegue", sender: self)
        
    }
    

}
