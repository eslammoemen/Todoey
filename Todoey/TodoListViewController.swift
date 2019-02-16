//  ViewController.swift
//  Todoey
//  Created by Eslam Moemen on 2018-06-29.
//  Copyright © 2018 Eslam Moemen. All rights reserved.

import UIKit

class TodoListViewController: UITableViewController{

    var itemArray = [Item]()
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         if let item = defaults.array(forKey: "todoListArray") as? [Item]{
            itemArray = item
        }
        
        let item1 = Item()
        item1.title = "Find Migos"
        itemArray.append(item1)
        item1.done = true
       
        let item2 = Item()
        item2.title = "Call Sia"
        itemArray.append(item2)

        
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row].title
        
        if itemArray[indexPath.row].done == true {
            cell.accessoryType = .checkmark
            
        } else {
            cell.accessoryType = .none
            
        }
        
        return cell
    }
    
    
    
    
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        print(itemArray[indexPath.row])
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if itemArray[indexPath.row].done == false {
            itemArray[indexPath.row].done = true
            
        }else {
            
            itemArray[indexPath.row].done = false
        }
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            
        } else{
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
       
        }
        tableView.reloadData()
    }
    
    
    
    
    
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add Item Todoey", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            self.tableView.reloadData()
            self.defaults.set(self.itemArray, forKey: "todoListArray")
        }
        
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "create new item"
            textField = alertTextField
        }
        
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    
    
    }
    
    
}



