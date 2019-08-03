//
//  ShowScoreViewController.swift
//  FinalProject
//
//  Created by MacStudent on 2017-10-26.
//  Copyright © 2017 MacStudent. All rights reserved.
//

import UIKit

class ShowScoreViewController: UIViewController {
    
    
    @IBOutlet weak var lblCorrectAnswers: UILabel!
    @IBOutlet weak var lblWrongAnswers: UILabel!
    @IBOutlet weak var lblSkippedAnswers: UILabel!
    @IBOutlet weak var lblHeading: UILabel!
    @IBOutlet weak var lblBack: UILabel!
    @IBOutlet weak var btnHome: UIButton!
    
    let userDataInsert = UserDefaults.standard
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setNeedsStatusBarAppearanceUpdate()
        
        // Do any additional setup after loading the view.
      self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Back-01.jpg")!)
        
        Questions.checkAnswer()
        
        lblBack.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        lblHeading.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        lblSkippedAnswers.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        lblWrongAnswers.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        lblCorrectAnswers.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        
        btnHome.layer.cornerRadius = 3
        btnHome.layer.borderColor = UIColor.darkGray.cgColor
        
        print("Right Answer \(Questions.Right_Answers)")
        print("Wrong Answer \(Questions.Wrong_Answers)")
        print("Skiped Answer \(Questions.Skip_Answers)")
        
        if ( (userDataInsert.value(forKey: "HighScore") as! Int) < Questions.Right_Answers ){
            
            userDataInsert.set(Questions.Right_Answers, forKey: "HighScore")
            
        }
        
        if ( userDataInsert.value(forKey: "LowScore") as! Int > Questions.Right_Answers ){
            
            userDataInsert.set(Questions.Right_Answers, forKey: "LowScore")
            
        }
        
        
        lblCorrectAnswers.text = "Correct Answers : \(Questions.Right_Answers)"
        lblWrongAnswers.text = "Wrong Answers : \(Questions.Wrong_Answers)"
        lblSkippedAnswers.text = "Skipped Answers : \(Questions.Skip_Answers)"
        
        
        
        
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
    

}
