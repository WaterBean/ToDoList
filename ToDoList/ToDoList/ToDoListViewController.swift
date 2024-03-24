//
//  ToDoListViewController.swift
//  ToDoList
//
//  Created by 한수빈 on 3/22/24.
//

import UIKit


var dummyData: [ToDoListModel] = [ToDoListModel(name: "책 구매", detail: "Cocoa Internals"),
                                  ToDoListModel(name:"철수와 약속" , detail: "PC방 가서 오버워치하기"),
                                  ToDoListModel(name: "스터디 준비하기", detail: "비동기 프로그래밍 이해하기")]
var todolist: [ToDoListModel] = dummyData.map { $0 }

class ToDoListViewController: UITableViewController {

    @IBOutlet var tvToDo: UITableView!
    var sectionList: [String] = ["할 일"]
    var reuseIdentifier = "todolist"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func viewWillAppear(_ animated: Bool) {
        tvToDo.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sectionList.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todolist.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        var config = cell.defaultContentConfiguration()
        let todolistCell = todolist[indexPath.row]
        
        config.text = todolistCell.name
        config.secondaryText = todolistCell.detail
        config.image = .strokedCheckmark.withTintColor(.brown)
        
        cell.contentConfiguration = config
        return cell
    }
    

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionList[section]
    }
    
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        
        return true
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todolist.remove(at: (indexPath as NSIndexPath).row)
        
            
            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let toMove = todolist[(fromIndexPath as NSIndexPath).row]
        todolist.remove(at: (fromIndexPath as NSIndexPath).row)
        todolist.insert(toMove, at: (to as NSIndexPath).row)
    }

    
    // Override to support conditional rearranging of the table view.
//    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the item to be re-orderable.
//        return true
//    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgDetail" {
            let cell = sender as! UITableViewCell
            let indexPath = self.tvToDo.indexPath(for: cell)
            let detailView = segue.destination as! ToDoDetailViewController
            detailView.receiveToDo(todolist[(indexPath! as NSIndexPath).row])
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
