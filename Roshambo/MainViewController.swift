//
//  ViewController.swift
//  Roshambo
//
//  Created by selin acar on 2016-07-04.
//  Copyright © 2016 selin acar. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var choice: choices!
    var opponentChoice: choices = choices.randchoice()
    
    enum choices: Int{
        case rock
        case paper
        case scissors
        
        static func randchoice() -> choices {
            let rand = arc4random_uniform(3)
                return choices(rawValue: Int(rand))!
        }
    }
    
    
    @IBAction func rockMove(sender: AnyObject) {
         opponentChoice = choices.randchoice()
        var resultsvc: ResultsViewController
        resultsvc = self.storyboard?.instantiateViewControllerWithIdentifier("resultsVC") as! ResultsViewController
        switch opponentChoice{
            case .rock:
                resultsvc.labelString = "Tie! Both Rocks Win!\n(Rock vs. Rock)"
                resultsvc.winnerImg = "itsATie"
            case .paper:
                resultsvc.labelString = "Paper Beat's Rock!\n(Rock vs. Paper)"
                resultsvc.winnerImg = "PaperCoversRock"
            case .scissors:
                resultsvc.labelString = "Rock Crushes Scissors!\n(Rock vs. Scissors)"
                resultsvc.winnerImg = "RockCrushesScissors"
        }
        self.presentViewController(resultsvc, animated: true, completion: nil)
    }
    
    @IBAction func paperMove(sender: AnyObject) {
                self.performSegueWithIdentifier("paperSegue", sender: self)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
         opponentChoice = choices.randchoice()
        let resultsvc: ResultsViewController = segue.destinationViewController as! ResultsViewController
        if segue.identifier == "scissorsSegue"{
            switch opponentChoice{
                case .rock:
                resultsvc.labelString = "Rock Crushes Scissors!\n(Scissors vs. Rock)"
                resultsvc.winnerImg = "RockCrushesScissors"
                case .paper:
                resultsvc.labelString = "YOU'VE BEEN CUT! Scissors Beat's Paper!\n(Scissors vs. Paper)"
                resultsvc.winnerImg = "ScissorsCutPaper"
                case .scissors:
                resultsvc.labelString = "Tie! Both Win!\n(Scissors vs. Scissors)"
                resultsvc.winnerImg = "itsATie"
            }
        }else{
            switch opponentChoice{
                case .rock:
                    resultsvc.labelString = "Paper Beat's Rock!\n(Paper vs. Rock)"
                    resultsvc.winnerImg = "PaperCoversRock"
                case .paper:
                    resultsvc.labelString = "Tie! The Papers Win!\n(Paper vs. Paper)"
                    resultsvc.winnerImg = "itsATie"
                case .scissors:
                    resultsvc.labelString = "Rock Crushes Scissors!\n(Paper vs. Scissors)"
                    resultsvc.winnerImg = "ScissorsCutPaper"
            }
        }
    }

    
}

