//
//  ClassificationEventViewController.swift
//  Field Survey
//
//  Created by Deng tianyuan on 11/16/18.
//  Copyright © 2018 Deng tianyuan. All rights reserved.
//

import UIKit

class ClassificationEventViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var dateFormatter = DateFormatter()
    
    @IBOutlet weak var classificationEventsTableView: UITableView!
    
    let jsonFileName = "field_observations"
    var classificationEvents: ClassificationEvents?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        classificationEvents = ClassificaitonEventLoader.load(jsonFileName: jsonFileName)
        
        if classificationEvents == nil {
            presentMessage(message: "Unable to load and parse \(jsonFileName).json")
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classificationEvents?.observations.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = classificationEventsTableView.dequeueReusableCell(withIdentifier: "classificationEventCell", for: indexPath)

        //let cell = tableView.dequeueReusableCell(withIdentifier: "classificationEventCell", for: indexPath)
        
        if let cell = cell as? ClassificationEventTableViewCell,
            let classificationEvent = classificationEvents?.observations[indexPath.row] {

            cell.dateLabel.text = classificationEvent.title
            cell.titleLabel.text = dateFormatter.string(from: classificationEvent.date)
            cell.classificationImageView.image = UIImage(named: classificationEvent.classification.rawValue)
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ClassificationEventDeatilViewController,
            let selectedIndexPath = classificationEventsTableView.indexPathForSelectedRow {
            destination.classificationEvent = classificationEvents?.observations[selectedIndexPath.row]
        }
    }
    
    func presentMessage(message: String) {
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
