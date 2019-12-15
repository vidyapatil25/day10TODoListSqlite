//
//  ViewController.swift
//  day10TODoListSqlite
//
//  Created by Student 06 on 28/11/19.
//  Copyright © 2019 Student 06. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func nextButton(_ sender: UIBarButtonItem) {
        let next = storyboard?.instantiateViewController(withIdentifier: "NextViewController")
        navigationController?.pushViewController(next!, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        DBWrapper.sharedObj.selectAllTask(query: "select * from taskTable")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

