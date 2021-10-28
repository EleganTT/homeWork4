//
//  CompletedTasksTableViewCell.swift
//  homeWork4
//
//  Created by Dmitriy Lee on 22.10.2021.
//

import UIKit

class CompletedTasksTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var deadlineLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initCell(title: String, description: String, date: Date, deadline: Date, status: String) {
        titleLabel.text = title
        descriptionLabel.text = description
        let date = Date()
        dateLabel.text = "\(date.getFormattedDate())"
        deadlineLabel.text = "Deadline: \(deadline.getFormattedDate())"
        statusLabel.text = status
        
        if statusLabel.text == "completed" {
            statusLabel.textColor = .systemGreen
        } else if statusLabel.text == "deleted" {
            statusLabel.textColor = .systemRed
        }
    }
}
