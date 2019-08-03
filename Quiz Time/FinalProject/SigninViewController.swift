//
//  SigninViewController.swift
//  FinalProject
//
//  Created by MacStudent on 2017-10-23.
//  Copyright © 2017 MacStudent. All rights reserved.
//

import UIKit

class SigninViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
  
    
    
    
    
    @IBOutlet weak var GenderPickerView: UIPickerView!
    
    var GenderArray = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNeedsStatusBarAppearanceUpdate()
        
       self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Back-01.jpg")!)

        // Do any additional setup after loading the view.
        self.GenderPickerView.dataSource = self
        self.GenderPickerView.delegate = self
        
        GenderArray = ["Male", "Female", "Other"]
        
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
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return GenderArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return GenderArray[row]
    }
    
    
}
