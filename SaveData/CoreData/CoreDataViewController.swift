//
//  CoreDataViewController.swift
//  SaveData
//
//  Created by Владислав Климов on 06.02.2020.
//  Copyright © 2020 Владислав Климов. All rights reserved.
//

import UIKit
import CoreData

class CoreDataViewController: UIViewController {

    var toDoList: [NSManagedObject] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadData()
        self.tableView.reloadData()
    }
    
    func reloadData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ToDoItem")
        
        do {
            self.toDoList = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }

}

extension CoreDataViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = toDoList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoreDataTableViewCell") as! CoreDataTableViewCell
        cell.itemLabel.text = item.value(forKey: "text") as? String
        return cell
    }
}

extension CoreDataViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteItem = UIContextualAction(style: .destructive, title: "Удалить"){
            (contextualAction, view, boolValue) in
                guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
                let delItem = self.toDoList.remove(at: indexPath.row)
                let zalupa = delItem.value(forKey: "text") as! String
                let managedContext = appDelegate.persistentContainer.viewContext
                let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ToDoItem")
                fetchRequest.predicate = NSPredicate(format: "text = %@", zalupa)
            
                do {
                    let items = try managedContext.fetch(fetchRequest)
                    
                    let objectToDelete = items[0]
                    managedContext.delete(objectToDelete)
                    do{
                        try managedContext.save()
                    } catch {
                        print(error)
                    }
                } catch {
                    print(error)
                }
                tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        let swipeActions = UISwipeActionsConfiguration(actions: [deleteItem])
        return swipeActions
    }
}
