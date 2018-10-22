//
//  ViewController.swift
//  todoApp
//
//  Created by Jason Chow on 10/17/18.
//  Copyright © 2018 Jason Chow. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var list = ["corn", "milk", "eggs"]
    var change = ""
    
    @IBOutlet weak var textTaskField: UITextField!
    @IBOutlet weak var taskTableView: UITableView!
    
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

        //COMPLETE
        let complete = UITableViewRowAction(style: .normal, title: "Complete"){ action, index in
            let completeMark = " \u{2705}"
            let newRow = self.list.remove(at: indexPath.row) + completeMark
            self.list.insert(newRow, at: indexPath.row)
            self.taskTableView.reloadData()
           
        }
        complete.backgroundColor = .green
        
        //EDIT
        let edit = UITableViewRowAction(style: .normal, title: "Edit") { action, index in
            
            
        }
        edit.backgroundColor = .lightGray
        
        //TRASH
        let trash = UITableViewRowAction(style: .normal, title: "Trash"){ action, index in
            self.list.remove(at: indexPath.row)
            self.taskTableView.reloadData()
        }
        trash.backgroundColor = .red
        
        return[trash, edit, complete]
    }
    
    //*** BUTTONS
    @IBAction func addTask(_ sender: Any) {
        if (textTaskFieldConverter != ""){
        list.append(textTaskFieldConverter)
        }
        textTaskField.text = ""
        taskTableView.reloadData()
    }
    
    //*** EXTRA FUNCTIONS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

