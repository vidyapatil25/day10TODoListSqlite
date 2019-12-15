//
//  NextViewController.swift
//  day10TODoListSqlite
//
//  Created by Student 06 on 28/11/19.
//  Copyright © 2019 Student 06. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet weak var taskIdText: UITextField!
    
    @IBAction func saveButton(_ sender: UIButton) {
        let insertQuery = "insert into taskTable(taskId,taskName)values ('\(taskIdText.text!)','\(taskNameText.text!)')"
        let isSuccess = DBWrapper.sharedObj.executeQuery(query: insertQuery)
        if isSuccess
        {
            print("Insert Success:")
        }
        else
        {
            print("Insert Failed:")
        }
        
        
    }
    @IBOutlet weak var taskNameText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
