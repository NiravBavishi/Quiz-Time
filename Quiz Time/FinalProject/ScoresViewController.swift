//
//  ScoresViewController.swift
//  FinalProject
//
//  Created by MacStudent on 2017-10-26.
//  Copyright © 2017 MacStudent. All rights reserved.
//

import UIKit

class ScoresViewController: UIViewController {
    
    
    
    @IBOutlet weak var lblNoOfAttempts: UILabel!
    @IBOutlet weak var lblHighScore: UILabel!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNeedsStatusBarAppearanceUpdate()

self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Back-01.jpg")!)
        
        
        lblNoOfAttempts.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        lblHighScore.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        
        
        lblNoOfAttempts.layer.cornerRadius = 7
        lblHighScore.layer.cornerRadius = 7
       
        
        // Do any additional setup after loading the view.
        
         let dataGet = UserDefaults.standard
        
        let tempCount = dataGet.value(forKey: "NoOfAttempts")
        
        
        
            lblNoOfAttempts.text = "No of Attempts : " + String(describing: dataGet.value(forKey: "NoOfAttempts")!)
        
        lblHighScore.text = "Highest Score : " + String(describing: dataGet.value(forKey: "HighScore")!)
        
        
        
        print("No Of Attempts : \(String(describing: tempCount))")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
        // setNeedsStatusBarAppearanceUpdate()
    }
    

    
    @IBAction func btnbackHomeTapped(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "ScoreToHomeSegue", sender: self)
        
    }
    
}
