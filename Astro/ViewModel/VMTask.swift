//
//  VMTask.swift
//  Astro
//
//  Created by Kemar Galloway on 8/6/19.
//  Copyright © 2019 Kemar Galloway. All rights reserved.
//

import Foundation

protocol TaskViewModelDelegate {
    func onItemAddClick(textDetail: String)
}

protocol reloadTableViewDelegate {
    func reloadTableView(index: Int)
}

class VMTask {
    
    var items = [Task]()
    var reloadDelegate: reloadTableViewDelegate?
    var itemJson = [["textDetail":"Hi I am okay"],
                    ["textDetail":"Save me"],
                    ["textDetail":"Work smart"]]
    
    init(viewDelegate: reloadTableViewDelegate) {
        reloadDelegate = viewDelegate
        self.items = Task.modelFromDictionnaryArray(array: itemJson as! NSArray)
        print("items count",items.count)
    }
    
}

extension VMTask: TaskViewModelDelegate {
    func onItemAddClick(textDetail: String) {
        items.append(Task(txt: textDetail))
        reloadDelegate?.reloadTableView(index: items.count)
    }
    
    
}
