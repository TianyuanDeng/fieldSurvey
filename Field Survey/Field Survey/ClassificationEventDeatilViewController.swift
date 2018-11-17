//
//  ClassificationEventDeatilViewController.swift
//  Field Survey
//
//  Created by Deng tianyuan on 11/16/18.
//  Copyright © 2018 Deng tianyuan. All rights reserved.
//

import UIKit

class ClassificationEventDeatilViewController: UIViewController {

    @IBOutlet weak var classificationImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    let dateFormatter = DateFormatter()
    
    var classificationEvent: ClassificationEvent?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        if let classificationEvent = classificationEvent {
            
            descriptionLabel.text = classificationEvent.description
            titleLabel.text = classificationEvent.title
            dateLabel.text = dateFormatter.string(from: classificationEvent.date)
            classificationImageView.image = UIImage(named: classificationEvent.classification.rawValue)
        }
    }
}
