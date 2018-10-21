//
//  ViewController.swift
//  todoApp
//
//  Created by Jason Chow on 10/17/18.
//  Copyright © 2018 Jason Chow. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var list = [""]
    var testList = ["test"]
    
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
        return(testList.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        //cell.textLabel?.text = testList[indexPath.row]
        cell.textLabel?.text = list[indexPath.row]
        return(cell)
    }
    
    
    
    @IBAction func addTask(_ sender: Any) {
        list.append(textTaskFieldConverter)
        taskTableView.reloadData()
        print(textTaskFieldConverter)
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

