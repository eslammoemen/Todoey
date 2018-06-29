//
//  ViewController.swift
//  Todoey
//
//  Created by Eslam Moemen on 2018-06-29.
//  Copyright © 2018 Eslam Moemen. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController{
    let itemArray = ["find mike","buy eggos","go to path"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
        
    }
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
       
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    }
    
       
        
        
    













}
