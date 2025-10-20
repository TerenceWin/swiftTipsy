//
//  ViewController.swift
//  Tipsy
//
//  Created by Terence Win on 2025/10/19.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var zeroPercentTip: UIButton!
    @IBOutlet weak var tenPercentTip: UIButton!
    @IBOutlet weak var twentyPercentTip: UIButton!
    @IBOutlet weak var label: UILabel?
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var calculateButton: UIButton!
    
    var people : Int = 0
    var tipPercentage: Double? = nil
    var totalBill: Double? = nil
    var input: String? = nil
    var totalBillForEachPerson: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userInput.addTarget(self, action: #selector(textFieldChange(_:)), for: .editingChanged)

        let tap = UIGestureRecognizer(target: self, action: #selector(dismissTextField))
        view.addGestureRecognizer(tap)
        
        people = Int(stepper.value)
        label!.text = String(people)
        
        
    }
    
    @objc func dismissTextField(){
        view.endEditing(true)
    }
    
    @IBAction func textFieldChange(_ sender: UITextField){
        if let input = sender.text{
            let doubleInput = Double(input)
            totalBill = doubleInput
        }else{
            totalBill = 0.0
        }
    }
    
    @IBAction func tipSelected(_ sender: UIButton){
        switch sender.currentTitle {
            case "0%":
                tipPercentage = 0.0
            case "10%":
                tipPercentage = 0.1
            case "20%":
                tipPercentage = 0.2
            default:
                break
            }
        print(tipPercentage!)
    }
    

}
