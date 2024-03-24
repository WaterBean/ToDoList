//
//  ToDoDetailViewController.swift
//  ToDoList
//
//  Created by 한수빈 on 3/24/24.
//

import UIKit

class ToDoDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    var receivedToDo: ToDoListModel = ToDoListModel(name: "", detail: "") // 클래스 안에 있는 구조체
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = receivedToDo.name
        detailLabel.text = receivedToDo.detail
    }
    
    func receiveToDo (_ todo: ToDoListModel) {
        receivedToDo = todo
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
