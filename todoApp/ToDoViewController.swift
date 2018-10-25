//
//  ViewController.swift
//  todoApp
//
//  Created by Jason Chow on 10/17/18.
//  Copyright © 2018 Jason Chow. All rights reserved.
//

import UIKit

class ToDoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var list = [String]()
    var newTaskAfterEdit: UITextField?
    var newText = ""

    @IBOutlet weak var textTaskField: UITextField!
    @IBOutlet weak var taskTableView: UITableView!
    
    func saveList(){
        let defaults = UserDefaults.standard
        defaults.set(list, forKey: "SavedList")
        print("***LIST SAVED!***")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let retrievedList = defaults.stringArray(forKey: "SavedList")
        list = retrievedList!
        taskTableView.reloadData()
    }

    
    //*** TASK TEXT BAR
    var textTaskFieldConverter: String{
        if let text = textTaskField.text{
            return text
        }else{
            return ""
        }
    }
    
    //*** TABLE VIEW
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(list.count)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row]
        return(cell)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?{

        //ALERT FOR EDIT
        func createAlert(title:String, message:String){
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title:"Accept", style: UIAlertActionStyle.default, handler: { (action) in alert.dismiss(animated: true, completion: nil)
                self.newText = (self.newTaskAfterEdit?.text)!
                self.list.remove(at: indexPath.row)
                self.list.insert(self.newText, at: indexPath.row)
                self.saveList()
                self.taskTableView.reloadData()
            }))
            
            alert.addAction(UIAlertAction(title:"Cancel", style: UIAlertActionStyle.default, handler: { (action) in alert.dismiss(animated: true, completion: nil)
            }))
            
            alert.addTextField(configurationHandler: newTaskAfterEdit)
            
            self.present(alert, animated: true, completion: nil)
        }
        
        //COMPLETE
        let complete = UITableViewRowAction(style: .normal, title: "Complete"){ action, index in
            let completeMark = " \u{2705}"
            let newRow = self.list.remove(at: indexPath.row) + completeMark
            self.list.insert(newRow, at: indexPath.row)
            self.saveList()
            self.taskTableView.reloadData()
            
        }
        complete.backgroundColor = .green
        
        //EDIT
        let edit = UITableViewRowAction(style: .normal, title: "Edit") { action, index in
            createAlert(title: "Edit", message: "Would you like to edit your task?")
            self.saveList()
        }
        edit.backgroundColor = .lightGray
        
        //TRASH
        let trash = UITableViewRowAction(style: .normal, title: "Trash"){ action, index in
            self.list.remove(at: indexPath.row)
            self.saveList()
            self.taskTableView.reloadData()
            
        }
        trash.backgroundColor = .red
        self.saveList()
        
        return[trash, edit, complete]
    }
    
    //*** BUTTONS
    @IBAction func addTask(_ sender: Any) {
        if (textTaskFieldConverter != ""){
        list.append(textTaskFieldConverter)
        }
        textTaskField.text = ""
        self.saveList()
        taskTableView.reloadData()
    }
    
    func newTaskAfterEdit(textField: UITextField!){
        newTaskAfterEdit = textField
        newTaskAfterEdit?.placeholder = "Enter new task..."
    }
    
    //RESET
    func resetList(){
        list = [String]()
        saveList()
        //taskTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

