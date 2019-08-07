//
//  Task.swift
//  Astro
//
//  Created by Kemar Galloway on 8/6/19.
//  Copyright © 2019 Kemar Galloway. All rights reserved.
//

import Foundation

class Task {
    
    var textDetail: String?
    
    init(txt: String) {
        self.textDetail = txt
    }
    
    init(dictionary: NSDictionary) {
        self.textDetail = dictionary["textDetail"] as? String
    }
    
    public class func modelFromDictionnaryArray(array: NSArray) -> [Task] {
        var items = [Task]()
        for data in array {
            items.append(Task(dictionary: data as! NSDictionary))
        }
        return items
    }
}
