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
    var taskArray = [String]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        table.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveData.register(defaults: ["title":"NoTitle"])
        saveData.register(defaults: ["task":"NoTask"])

//        saveData.set(titleArray, forKey: "title")
//        saveData.set(taskArray, forKey: "task")
        
        titleArray = saveData.array(forKey: "title")as![String]
        taskArray = saveData.array(forKey: "task")as![String]
        
        table.dataSource = self
        

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
