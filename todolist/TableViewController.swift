//
//  TableViewController.swift
//  todolist
//
//  Created by Emma Davis on 7/15/19.
//  Copyright © 2019 Emma Davis. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    func createToDos() -> [toDo] {
        let swift = toDo()
        swift.name = "Learn Swift"
        swift.important = true
        let dog = toDo()
        dog.name = "walk dog"
    return [swift, dog]
    }
    var toDos : [toDo] = []
    override func viewDidLoad() {
        super.viewDidLoad()

    toDos = createToDos()
    }

    


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
 


        }    




    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
   // }
    


