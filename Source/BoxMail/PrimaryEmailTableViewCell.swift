//
//  PrimaryEmailTableViewCell.swift
//  BoxMail
//
//  Created by Raj Abishek on 08/08/16.
//  Copyright © 2016 Raj Abishek. All rights reserved.
//

import UIKit
import Spring

class PrimaryEmailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImageView: DesignableImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var subjectLabel: UILabel!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    var email: Email! {
        didSet {
            configureCell(email)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        layoutMargins = UIEdgeInsetsZero
        preservesSuperviewLayoutMargins = false
    }
    
    func configureCell(email: Email) {
        nameLabel.text = email.from.name
        subjectLabel.text = email.subject
        messageLabel.text = email.message
        profileImageView.image = UIImage(named: "\(email.from.profileImageName)")
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "hh:mm aaa"
        let time = dateFormatter.stringFromDate(email.time)
        
        if !email.read {
            nameLabel.font = UIFont(name: "FiraSans-Regular", size: 16)
            subjectLabel.font = UIFont(name: "FiraSans-Regular", size: 12)
        }
        
        timeLabel.text = time
        
        
    }
    
}
