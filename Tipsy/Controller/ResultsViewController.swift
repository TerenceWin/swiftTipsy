//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Terence Win on 2025/10/21.
//

import UIKit

class ResultsViewController: UIViewController{
    
    var personBill: String?
    var finalMessage: String?
    
    @IBOutlet weak var recalculateButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var billLabel: UILabel!
    
    override func viewDidLoad(){
        billLabel.text = personBill!
        messageLabel.text = finalMessage!
    }
    
    @IBAction func recalculate(_ sender: UIButton){
        self.dismiss(animated: true)
    }
    
    
    
}
