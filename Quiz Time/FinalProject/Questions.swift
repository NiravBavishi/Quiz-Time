//
//  Questions.swift
//  FinalProject
//
//  Created by MacStudent on 2017-10-24.
//  Copyright © 2017 MacStudent. All rights reserved.
//

import Foundation


class Questions{
    
    
   static var arrayQuestions:NSArray!
    
    
    
    var Question : String!
    var Option1 : String!
    var Option2 : String!
    var Option3 : String!
    var Option4 : String!
    var Answer : String!
    var UserAnswer : String!
    
    static var QuestionList = [Questions]()
    
    static var Answers = [String] (repeating: "", count: 10)
    
    static var TrueAnswer = [Int]()
    
    static var Right_Answers = 0
    static var Wrong_Answers = 0
    static var Skip_Answers = 0
    
    
    
    init() {
        
     
        self.Question = ""
        self.Option1 = ""
        self.Option2 = ""
        self.Option3 = ""
        self.Option4 = ""
        self.Answer = ""
        
    }
    
    
    init(question : String, Option1 : String, Option2 : String, Option3 : String, Option4 : String, Answer : String) {
        
        
        self.Question = question
        self.Option1 = Option1
        self.Option2 = Option2
        self.Option3 = Option3
        self.Option4 = Option4
        self.Answer = Answer
        
    }
    
    static func addQuestion(questionIndex : Int, question : Questions)  {
        
        if QuestionList[questionIndex].Question == nil {
            
            QuestionList[questionIndex] = question
            
        }
        
    }
    
    static func AddAnswers(questionNo : Int, answer: String){
        
            QuestionList[questionNo].UserAnswer = answer
    
    }
    
    static func checkAnswer(){
        
        for i in 0...9 {
            
            if QuestionList[i].Answer == QuestionList[i].UserAnswer{
                
                Right_Answers += 1
                
            } else if (QuestionList[i].UserAnswer == nil || QuestionList[i].UserAnswer == ""){
                
                Skip_Answers += 1
                
            }
            else {
                
                Wrong_Answers += 1
                
            }
            
        }
        
    }
    
    
  static func RandomIndexGeneratorCreator() -> [Int] {
    
    var counter = 0
        var RandomIndexes = [Int]()
        
//        for _ in 0..<10 {
//            let randomQuesIndex = (arc4random() % 20);
//            RandomIndexes.append(Int(randomQuesIndex))
//        }
//
    while counter <= 10 {

        let randomQuesIndex = (arc4random() % 20);

        if (!RandomIndexes.contains(Int(randomQuesIndex))) {

            RandomIndexes.append(Int(randomQuesIndex))
            counter += 1
        }
        
    }
    
        return RandomIndexes
    }
    
    
    
    static func setQuestions() -> [Questions]{
        
        Right_Answers = 0
        Wrong_Answers = 0
        Skip_Answers = 0
        
        var paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as Array
            let documentPath = paths[0] as String
            let path = documentPath.appending("/QuestionsPlist")
            
            let fileManager = FileManager.default
            
            if !fileManager.fileExists(atPath: path) {
                if let bundlePath = Bundle.main.path(forResource: "QuestionsPlist", ofType: "plist") {
                    do {
                        try fileManager.copyItem(at: URL(fileURLWithPath: bundlePath), to: URL(fileURLWithPath: path))
                    } catch {
                        print("copy failure")
                    }
                }
                else {
                    print("product plist not found")
                }
            }
            else {
                print("file product plist already exist at path")
            }
        arrayQuestions = NSDictionary(contentsOfFile: path)?.value(forKey: "Questions") as! NSArray
        let  randomArray : [Int] = self.RandomIndexGeneratorCreator()
        for i in randomArray{print("I >> \(i)")}
        
        for indeX in 0...9 {
            
            let TempData : [String:String] = arrayQuestions[randomArray[indeX]] as! Dictionary
            
            
            let Question = Questions(question: TempData["Question"]!, Option1: TempData["Option1"]!, Option2: TempData["Option2"]!, Option3: TempData["Option3"]!, Option4: TempData["Option4"]!, Answer: TempData["Answer"]!)
            
            QuestionList.insert(Question, at: indeX)
            
        }
        
        return QuestionList
        
    }
    
    
    // Main class
    
}
