//
//  ViewController.swift
//  Tasks_
//
//  Created by Matěj Žemlička on 11/11/2019.
//  Copyright © 2019 Matěj Žemlička. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    private let tasks = ["", "", "", "", ""]
    
    @IBOutlet weak var tvTasks: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tvTasks.delegate = self
        tvTasks.dataSource = self
        // Do any additional setup after loading the view.
    }

    @IBAction func bOpenEmptyView(_ sender: Any) {
        performSegue(withIdentifier: "ssEmptyView", sender: nil)
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
                
        cell.textLabel?.text = tasks[indexPath.item]
        
        return cell
    }
}


