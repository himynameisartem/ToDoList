//
//  ItemViewController.swift
//  ToDoList
//
//  Created by Артем Кудрявцев on 26.01.2022.
//

import UIKit

class ItemViewController: UITableViewController {
    
    var itemArray = [String]()
    
    var titleBar = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        title = titleBar
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]

        return cell
    }

    @IBAction func addButton(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Добавить задачу", message: "" , preferredStyle: .alert)
        let action = UIAlertAction(title: "Добавить", style: .default) { (alert) in
            self.itemArray.append(textField.text!)
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Введите текст"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    

}
