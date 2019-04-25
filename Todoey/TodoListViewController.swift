//  ViewController.swift
//  Todoey
//  Created by Eslam Moemen on 2018-06-29.
//  Copyright © 2018 Eslam Moemen. All rights reserved.

import UIKit
import CoreData

class TodoListViewController: UITableViewController{

    var itemArray = [Item]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Entity", in: context)
        let dataItems = NSManagedObject(entity: entity!, insertInto: context)
        
        
        
        
        
        
        
        
        
        //    if let item = defaults.array(forKey: "todoListArray") as? [Item]{
      //      itemArray = item
      //  }
        
        
        
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
       
        //print(itemArray[indexPath.row])
        
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
            
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            self.tableView.reloadData()

            let encoder = PropertyListEncoder()
            
            do {
               
                let data = try encoder.encode(self.itemArray)
                try data.write(to: self.dataFilePath!)
                
            } catch {
                print("Error Encoding item, \(error)")
                
            }
            
            
            
            
            
        }
        
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "create new item"
            textField = alertTextField
        }
        
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    
    
    }
    
    
}



