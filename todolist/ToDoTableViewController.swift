//
//  TableViewController.swift
//  todolist
//
//  Created by Emma Davis on 7/15/19.
//  Copyright © 2019 Emma Davis. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    func createToDos() -> [ToDo] {
        let swift = ToDo()
        swift.name = "Learn Swift"
        swift.important = true
        let dog = ToDo()
        dog.name = "walk dog"
    return [swift, dog]
    }
    var toDos : [ToDo] = []
    override func viewDidLoad() {
        super.viewDidLoad()

    toDos = createToDos()
    }

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
    return toDos.count
   }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let toDo = toDos[indexPath.row]

        if toDo.important {
            cell.textLabel?.text = "❗️" + toDo.name
        } else {
            cell.textLabel?.text = toDo.name
        }
        return cell

    }

   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let addVC = segue.destination as? AddToDoViewController {
           addVC.previousVC = self
          }
    if let completeVC = segue.destination as? CompleteViewController {
        if let toDo = sender as? ToDo {
        completeVC.selectedToDo = toDo
        completeVC.previousVC = self
    }
  }
}
override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let toDo = toDos[indexPath.row]
    performSegue(withIdentifier: "moveToComplete", sender: toDo)
}



}


