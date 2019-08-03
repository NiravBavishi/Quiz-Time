//
//  InstructionViewController.swift
//  FinalProject
//
//  Created by MacStudent on 2017-10-24.
//  Copyright © 2017 MacStudent. All rights reserved.
//

import UIKit

class InstructionViewController: UIViewController {
    
    
    @IBOutlet weak var InstructionWebView: UIWebView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setNeedsStatusBarAppearanceUpdate()
        
        // Do any additional setup after loading the view.
       self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Back-01.jpg")!)
         loadFromFile()
        
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
    
    
    func loadFromFile()
    {
        let localfilePath = Bundle.main.url(forResource: "quiz_instruction", withExtension: "html");
        let myRequest = URLRequest(url: localfilePath!);
        InstructionWebView.loadRequest(myRequest);
    }
    
    
    @IBAction func btnBack(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "BackToHome", sender: self)
        
    }
    
    

}
