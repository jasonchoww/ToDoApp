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
    
    @IBOutlet weak var textTaskField: UITextField!
    @IBOutlet weak var taskTableView: UITableView!
    
    
    var textTaskFieldConverter: String{
        if let text = textTaskField.text{
            return text
        }else{
            return ""
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(list.count)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row]
        return(cell)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == UITableViewCellEditingStyle.delete{
            self.list.remove(at: indexPath.row)
            taskTableView.reloadData()
        }
    }
    
    
    @IBAction func addTask(_ sender: Any) {
        if (textTaskFieldConverter != ""){
        list.append(textTaskFieldConverter)
        }
        textTaskField.text = ""
        taskTableView.reloadData()
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

