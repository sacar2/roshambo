//
//  ResultsViewController.swift
//  Roshambo
//
//  Created by selin acar on 2016-07-04.
//  Copyright © 2016 selin acar. All rights reserved.
//

import UIKit


class ResultsViewController: UIViewController{
    
    @IBOutlet weak var resultsLabel: UILabel?
    @IBOutlet weak var winnerImage: UIImageView?
    
    var labelString: String!
    var winnerImg: String!
    
    
    override func viewWillAppear(animated: Bool) {
        if let labelString = self.labelString{
            self.resultsLabel?.text = labelString
        }
        if let winnerImg = self.winnerImg{
            self.winnerImage?.image = UIImage(named: winnerImg)
        }
    }
    
        @IBAction func playAgain(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}