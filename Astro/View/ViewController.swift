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
    var taskViewModel: VMTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskViewModel = VMTask(viewDelegate: self)
//        tableView.register(UINib(nibName: "TaskCell", bundle: nil), forCellReuseIdentifier: "TaskCell")
//        tableView.separatorStyle = .none
//        tableView.delegate = self
//        tableView.dataSource = self
        
        self.queryAllTasks()
    }
    
    @IBAction func btnAddNewTask(_ sender: Any) {
        print("heyo")
    }
    func addTask(textName: String) {
        // create new girl
        indicator.startAnimating()
        
        let createTaskMutation = CreateNewTaskMutation(text: textName)
        
        apollo.perform(mutation: createTaskMutation) { [weak self] result, error in
            self?.indicator.stopAnimating()
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            // reload data
            self?.queryAllTasks()
        }
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

extension ViewController: reloadTableViewDelegate {
    func reloadTableView(index: Int) {
//        text .text = ""
//        phoneNumberTextField.text = ""
//        itemTableView.beginUpdates()
//        itemTableView.insertRows(at: [IndexPath(row: index-1,section: 0)], with: .automatic)
//        itemTableView.endUpdates()
//        let alert = UIAlertController(title: "", message: "Contact Added Successfully", preferredStyle: UIAlertControllerStyle.alert)
//        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
//        self.present(alert, animated: true, completion: nil)
    }
    
    
}
