//
//  ViewController.swift
//  Astro
//
//  Created by Kemar Galloway on 8/3/19.
//  Copyright © 2019 Kemar Galloway. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    var tasks: [TaskFullDetails] = [TaskFullDetails]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.register(UINib(nibName: "TaskCell", bundle: nil), forCellReuseIdentifier: "TaskCell")
//        tableView.separatorStyle = .none
//        tableView.delegate = self
//        tableView.dataSource = self
        
        self.queryAllTasks()
    }
    
    // MARK: Query
    func queryAllTasks() {
        let taskDetailsQuery = GetAllTasksQuery()
        
        apollo.fetch(query: taskDetailsQuery, cachePolicy: .fetchIgnoringCacheData) { [weak self] result, error in
            guard let tasks = result?.data?.getAllTasks else { return }
            self?.tasks = tasks.map { $0.fragments.taskFullDetails }
            
            print("task count ", self?.tasks)
            
//            self?.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell") as? TaskCell {
            let taskDetails = self.tasks[indexPath.row]
            
            cell.bind(task: taskDetails)
            cell.selectionStyle = .none
            
            return cell
        }
        
        return UITableViewCell()
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let task = self.tasks[indexPath.row]
//
//        let addVC = AddTaskVC(nibName: "AddTaskVC", bundle: nil)
//        addVC.mode = .edit
//        addVC.task = task
//        addVC.delegate = self
//
//        self.navigationController?.pushViewController(addVC, animated: true)
//    }
}

//extension ViewController: UIPopoverPresentationControllerDelegate {
//    public func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
//        // return UIModalPresentationStyle.FullScreen
//        return UIModalPresentationStyle.none
//    }
//}
