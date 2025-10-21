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
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var calculateButton: UIButton!
    
    var people : Int = 0
    var tipPercentage: Double? = 1.00
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
        if let tip = sender.currentTitle{
            switch tip{
                case "0%":
                    tipPercentage = 1.00
                    print("At 0%")
                case "10%":
                    tipPercentage = 1.10
                    print("At 10%")
                case "20%":
                    tipPercentage = 1.20
                    print("At 20%")
                default:
                    tipPercentage = 1.00
                    print("At default")
                }
            print(tipPercentage!)
        }
        print("At tipSelected Function")
    }
    
    @IBAction func peopleChange(_ sender: UIStepper){
        label.text = String(Int(sender.value))
    }
    
    @IBAction func calculatePage(_ sender: UIButton){
        self.performSegue(withIdentifier: "goToResultVC", sender: nil)
    }
    

}
