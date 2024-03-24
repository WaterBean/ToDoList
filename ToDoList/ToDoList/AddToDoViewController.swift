//
//  AddToDoViewController.swift
//  ToDoList
//
//  Created by 한수빈 on 3/24/24.
//

import UIKit

class AddToDoViewController: UIViewController {

    @IBOutlet weak var todoName: UITextField!
    @IBOutlet weak var todoDetail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todoName.text = ""
        todoName.text = ""

        // Do any additional setup after loading the view.
    }

    
    @IBAction func btnAddToDo(_ sender: UIButton) {
        todolist.append(ToDoListModel(name: todoName.text!, detail: todoDetail.text!))
        navigationController?.popViewController(animated: true)
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
