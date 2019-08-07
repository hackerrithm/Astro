//
//  TaskCell.swift
//  Astro
//
//  Created by Kemar Galloway on 8/4/19.
//  Copyright © 2019 Kemar Galloway. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {
    @IBOutlet weak var nameTextLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bind(task: TaskFullDetails) {
        nameTextLabel.text = "Text: \(task.text)"
    }

}
