//
//  TaskTableViewCell.swift
//  homeWork4
//
//  Created by Dmitriy Lee on 20.10.2021.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

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
        deadlineLabel.text = "Deadline: \(date.getFormattedDate())"
        statusLabel.text = status
    }

}

extension Date {
   func getFormattedDate() -> String {
        let dateformat = DateFormatter()
        dateformat.dateStyle = .medium
        dateformat.timeStyle = .none
        return dateformat.string(from: self)
    }
}
