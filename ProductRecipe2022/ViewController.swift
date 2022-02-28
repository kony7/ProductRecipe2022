//
//  ViewController.swift
//  ProductRecipe2022
//
//  Created by SeinaKonishi on 2022/02/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate  {
    
    let saveData: UserDefaults = UserDefaults.standard
    
    @IBOutlet var titleTextField:UITextField!
    @IBOutlet var taskTextField:UITextField!
    
    @IBOutlet var startDayPicker:UIDatePicker!
    @IBOutlet var finishDayPicker:UIDatePicker!
    
    var titleArray = [String]()
    var taskArray = [String]()
    var startDayArray = [Date]()
    var finishDayArray = [Date]()
    
    var arrayNumber:Int!
    var beforeData:Bool! = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveData.register(defaults: ["title":[]])
        saveData.register(defaults: ["task":[]])
        saveData.register(defaults: ["start":[]])
        saveData.register(defaults: ["finish":[]])
        
        titleArray = saveData.object(forKey: "title")as![String]
        taskArray = saveData.object(forKey: "task")as![String]
        startDayArray = saveData.object(forKey: "start")as![Date]
        finishDayArray = saveData.object(forKey: "finish")as![Date]
        
        if arrayNumber == nil{
            
            beforeData = false
            
        }else{
            titleTextField.text = titleArray[arrayNumber]
            taskTextField.text = taskArray[arrayNumber]
            startDayPicker.date = startDayArray[arrayNumber]
            finishDayPicker.date = finishDayArray[arrayNumber]
        }
        
        titleTextField.delegate = self
        taskTextField.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButton(){
        
        if beforeData == false{
            
            titleArray.append(titleTextField.text!)
            taskArray.append(taskTextField.text!)
            startDayArray.append(startDayPicker.date)
            finishDayArray.append(finishDayPicker.date)
            
        }else{
            
            titleArray[arrayNumber] = titleTextField.text!
            taskArray[arrayNumber] = taskTextField.text!
            startDayArray[arrayNumber] = startDayPicker.date
            finishDayArray[arrayNumber] = finishDayPicker.date
            
        }
        
        saveData.set(titleArray, forKey: "title")
        saveData.set(taskArray, forKey: "task")
        saveData.set(startDayArray,forKey: "start")
        saveData.set(finishDayArray,forKey: "finish")
            
        
        
        self.navigationController?.popToRootViewController(animated: true)
            //self.dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        titleTextField.resignFirstResponder()
        taskTextField.resignFirstResponder()
        return true
    }
    
//    @IBAction func returnButton(){
//
//        self.navigationController?.popToRootViewController(animated: true)
//        //self.dismiss(animated: true, completion: nil)
//    }


}

