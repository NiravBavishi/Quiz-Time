//
//  QuizPageViewController.swift
//  FinalProject
//
//  Created by MacStudent on 2017-10-24.
//  Copyright © 2017 MacStudent. All rights reserved.
//

import UIKit
import AVFoundation

 var OptionArray = [String]()

class QuizPageViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    
    //Now
    
    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string: "")
    
    //Now
    
    var QuestionIndex = 0
    var UserAnswer = ""
   
    var timer : Timer!
    var seconds = 10
    
    var Options = [String] ()
    
    @IBOutlet weak var Optionselector: UIPickerView!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var QuestionProgress: UIProgressView!
    @IBOutlet weak var lblQuestionNo: UILabel!
    @IBOutlet weak var lblTimer: UILabel!
    @IBOutlet weak var btnSpeak: UIButton!
    
    var QuestionData = [Questions]()
   

    override func viewDidLoad() {
        super.viewDidLoad()

        
        setNeedsStatusBarAppearanceUpdate()
        
        btnNext.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        btnSpeak.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        btnNext.layer.borderColor = UIColor.darkGray.cgColor
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Back-01.jpg")!)
        
        // For Count Quize Started
        
        
        
        let CounterQuizstarted = UserDefaults.standard
        
        var counterQuiz = CounterQuizstarted.value(forKey: "NoOfAttempts") as! Int
        
        counterQuiz += 1
        
        CounterQuizstarted.set(counterQuiz, forKey: "NoOfAttempts")
        
        
        //// For Count Quize Started
        
        
        QuestionData = Questions.setQuestions()
        
        btnNext.layer.cornerRadius = 7
        
        Optionselector.dataSource = self
        Optionselector.delegate = self
      
//        let progValue = Float(QuestionIndex+1) / 10
//        QuestionProgress.setProgress(progValue, animated: true)
//
//
//        print("Ok-------------------------")
//        print(QuestionData[QuestionIndex].Question!)
//
//        OptionArray.append(QuestionData[QuestionIndex].Option1)
//        OptionArray.append(QuestionData[QuestionIndex].Option2)
//        OptionArray.append(QuestionData[QuestionIndex].Option3)
//        OptionArray.append(QuestionData[QuestionIndex].Option4)
//
//
//
//        lblQuestion.text = "Q : " + QuestionData[QuestionIndex].Question
//
//        QuestionIndex += 1
//
//        lblQuestionNo.text = "\(QuestionIndex)/10"
//
//        startTimer()

        
        NextQuestion()
        
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
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return OptionArray.count
    }
    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return OptionArray[row]
//    }
//    
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let attributedString = NSAttributedString(string: OptionArray[row], attributes: [NSAttributedStringKey.foregroundColor : UIColor.white])
        return attributedString
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(OptionArray[Optionselector.selectedRow(inComponent: 0)])
        
        UserAnswer = OptionArray[Optionselector.selectedRow(inComponent: 0)]
        
        if QuestionIndex == 10 {
            
            btnNext.setTitle("End Quiz", for: .normal)
            
        }else
        {
        
            btnNext.setTitle("Next", for: .normal)
        
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
        // setNeedsStatusBarAppearanceUpdate()
    }
    
    @IBAction func btnNextTapped(_ sender: UIButton) {
        
        
       
        
        
        
        
        if QuestionIndex >= 1 {
            Questions.AddAnswers(questionNo: QuestionIndex-1, answer: UserAnswer)
        }
        
        if QuestionIndex < 10 {
            
            NextQuestion()
            
        }
            
        else {
            
            print("Ok Above 10 Index")
            
            performSegue(withIdentifier: "QuizToScoreSegue", sender: self)
            
        }
        
      
        
    }
    
    func NextQuestion () {
        
        
        
        UserAnswer = ""
        
        btnNext.setTitle("Skip", for: .normal)
        Optionselector.selectRow(0, inComponent: 0, animated: true)
        
        
        
        
        
        
        OptionArray.removeAll()
        
        
            
        
        
            
//            let QuestionText = QuestionData[QuestionIndex].Question
          //  let AnswerText = QuestionData[QuestionIndex].Answer
        
        print("Answer : \(QuestionData[QuestionIndex].Answer)")
            
            OptionArray.append(QuestionData[QuestionIndex].Option1)
            OptionArray.append(QuestionData[QuestionIndex].Option2)
            OptionArray.append(QuestionData[QuestionIndex].Option3)
            OptionArray.append(QuestionData[QuestionIndex].Option4)
            
        lblQuestion.text = "Q : " + QuestionData[QuestionIndex].Question
            self.Optionselector.reloadAllComponents()
            
       
        if QuestionIndex >= 1 {
            
            self.timer.invalidate()
            
        }
        
        QuestionIndex += 1
        if QuestionIndex == 10 {
            
            btnNext.setTitle("End Quiz", for: .normal)
            
        }
        
       
        
        seconds = 10
        startTimer()
        
        lblQuestionNo.text = "\(QuestionIndex)/10"
        
 //End of func NextQuestion()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(QuizPageViewController.updateTimer)), userInfo: nil, repeats: true)
        
    }
    @objc func updateTimer() {
        seconds -= 1
        
        
        
        if(seconds == 0){
            
            if QuestionIndex >= 10 {
                
                 performSegue(withIdentifier: "QuizToScoreSegue", sender: self)
        }
            else {
                
                NextQuestion()
                
            }
            
            
        }
        else if(seconds < 0){
            lblTimer.text = ""
        }
        
        if (seconds < 5 ) {
            
            lblTimer.textColor = UIColor.red
            QuestionProgress.progressTintColor = UIColor.red
            
        }else {
            
            lblTimer.textColor = UIColor.white
            QuestionProgress.progressTintColor = UIColor.init(red: 52/255.0, green: 118/255.0, blue: 243/255.0, alpha: 1)

        }
        
        lblTimer.text = "Timer : " + String(seconds) + " sec"
            
            let progValue = Float(seconds) / 10
             QuestionProgress.setProgress(progValue, animated: true)
    
       
    }
    

    @IBAction func btnSpeakQuestion(_ sender: UIButton) {
        
        //Now
        
        
        myUtterance = AVSpeechUtterance(string: lblQuestion.text!)
        myUtterance.rate = 0.3
        //synth.speakspeak(myUtterance)
        synth.speak(myUtterance)
        
        
        //Now
        
    }
    
//End Of Class Questions()
}
