//
//  Alert.swift
//  FinalProject
//
//  Created by MacStudent on 2017-10-24.
//  Copyright © 2017 MacStudent. All rights reserved.
//

import Foundation
import UIKit


class Alert {
    
    func showAlert(Title : String, Message: String){
        
        let alert = UIAlertController(title: Title, message: Message, preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(action1)
        
        //present(alert, animated: true, completion: nil)
        
    }
    
}


