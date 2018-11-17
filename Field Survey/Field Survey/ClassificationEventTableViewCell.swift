//
//  ClassificationEventTableViewCell.swift
//  Field Survey
//
//  Created by Deng tianyuan on 11/16/18.
//  Copyright © 2018 Deng tianyuan. All rights reserved.
//

import UIKit

class ClassificationEventTableViewCell: UITableViewCell {
    @IBOutlet weak var classificationImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
