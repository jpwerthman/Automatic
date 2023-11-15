//
//  RankController.swift
//  Automatic
//
//  Created by Nikos Claman on 11/14/23.
//
import UIKit
class RankController: UIViewController {
    
    
    @IBOutlet weak var goldLabel: UILabel!
    @IBOutlet weak var masterLabel: UILabel!
    @IBOutlet weak var silverLabel: UILabel!
    @IBOutlet weak var bronzeLabel: UILabel!
    @IBOutlet weak var legendLabel: UILabel!
    @IBOutlet weak var emporerLabel: UILabel!
    @IBOutlet weak var copperLabel: UILabel!
    @IBOutlet weak var beginnerLabel: UILabel!
    
    @IBOutlet weak var apprenticeLabel: UILabel!
    
    
    @IBAction func segmentChanged(_ sender: Any) {
        
    }
    
    private func updateLabels(forSegment index: Int) {
        if index == 0 { // Hours is selected
            masterLabel.text = "Master: 1000 Hours"
            emporerLabel.text = "Emperor: 750 Hours"
            silverLabel.text = "Silver: 200 Hours"
            bronzeLabel.text = "Bronze: 100 Hours:"
            legendLabel.text = "Legend: 500 Hours"
            copperLabel.text = "Copper: 50 hours"
            goldLabel.text = "Gold: 300 Hours"
            beginnerLabel.text = "Beginner: 5 Hours"
        } else { // Streaks (or Days) is selected
            masterLabel.text = "Master: 1000 Days"
            emporerLabel.text = "Emperor: 750 Days"
            silverLabel.text = "Silver: 200 Days"
            bronzeLabel.text = "Bronze: 100 Days:"
            legendLabel.text = "Legend: 500 Days"
            copperLabel.text = "Copper: 50 Days"
            goldLabel.text = "Gold: 300 Days"
            beginnerLabel.text = "Beginner: 5 Hours"

        }
        
        
    }
}
