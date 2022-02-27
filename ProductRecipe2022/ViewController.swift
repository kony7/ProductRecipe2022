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
    
    var titleArray = [String]()
    var taskArray = [String]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleArray = saveData.array(forKey: "title")as![String]
        taskArray = saveData.array(forKey: "task")as![String]
        
        titleTextField.delegate = self
        taskTextField.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButton(){
        
        titleArray.append(titleTextField.text!)
        taskArray.append(taskTextField.text!)
        
        saveData.set(titleArray, forKey: "title")
        saveData.set(taskArray, forKey: "task")
        
        //self.navigationController?.popToRootViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        titleTextField.resignFirstResponder()
        taskTextField.resignFirstResponder()
        return true
    }
    
    @IBAction func returnButton(){
        
        //self.navigationController?.popToRootViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }


}

