//
//  TaskListViewController.swift
//  ProductRecipe2022
//
//  Created by SeinaKonishi on 2022/02/21.
//

import UIKit

class TaskListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet var table: UITableView!
    
    let saveData: UserDefaults = UserDefaults.standard
    
    var titleArray = [String]()
  //  var taskArray = [String]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        titleArray = saveData.object(forKey: "title")as![String]
        table.reloadData()
        
        if let indexPath = table.indexPathForSelectedRow{
            table.deselectRow(at: indexPath, animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveData.register(defaults: ["title":[]])
        saveData.register(defaults: ["task":"NoTask"])
        saveData.register(defaults: ["start":Date()])
        saveData.register(defaults: ["finish":Date()])

//        saveData.set(titleArray, forKey: "title")
//        saveData.set(taskArray, forKey: "task")
        
        titleArray = saveData.object(forKey: "title")as![String]
//      taskArray = saveData.array(forKey: "task")as![String]
        
        table.dataSource = self
        table.delegate = self
        

        // Do any additional setup after loading the view.
    }
    
 
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = titleArray[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "next", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "next"{
            let nextView = segue.destination as! ViewController
            nextView.arrayNumber = sender as? Int
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
