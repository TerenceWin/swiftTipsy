//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Terence Win on 2025/10/21.
//

import UIKit

class ResultsViewController: UIViewController{
    
    @IBOutlet weak var recalculateButton: UIButton!
    override func viewDidLoad(){
        
    }
    
    @IBAction func recalculate(_ sender: UIButton){
        self.performSegue(withIdentifier: "goToViewController", sender: nil)
    }
    
}
