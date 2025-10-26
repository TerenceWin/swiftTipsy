//
//  ViewController.swift
//  Tipsy
//
//  Created by Terence Win on 2025/10/19.
//

import UIKit

class ViewController: UIViewController {

    var tips = Tips()
    var selectedZero: Bool = false
    var selectedTen: Bool = false
    var selectedTwenty: Bool = false

    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var zeroPercentTip: UIButton!
    @IBOutlet weak var tenPercentTip: UIButton!
    @IBOutlet weak var twentyPercentTip: UIButton!
    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var peopleStepper: UIStepper!
    @IBOutlet weak var CalculateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userTextField.addTarget(self, action: #selector(userInputtingBill(_:)), for: .editingChanged)
        peopleLabel.text = (String(Int(peopleStepper.value)))
        peopleStepper.addTarget(self, action: #selector(peopleChange(_:)), for: .valueChanged)
    }
    
    @IBAction func userInputtingBill(_ sender: UITextField){
        if let text = sender.text, let value = Double(text){
            tips.totalBill = value
        }else{
            tips.totalBill = 0.00
        }
        print(tips.totalBill)
    }
    
    
    @IBAction func tipSelected(_ sender: UIButton){
        switch sender{
        case zeroPercentTip:
            selectedZero = true
            selectedTen = false
            selectedTwenty = false
            tips.tipPercentage = 1.00
        case tenPercentTip:
            selectedZero = false
            selectedTen = true
            selectedTwenty = false
            tips.tipPercentage = 1.10
        case twentyPercentTip:
            selectedZero = false
            selectedTen = false
            selectedTwenty = true
            tips.tipPercentage = 1.20
        default:
            print("No such button")
        }
        displayTipsButtonBackground()
        print(tips.tipPercentage)
    }
    
    func displayTipsButtonBackground(){
        if selectedZero{
            zeroPercentTip.backgroundColor = UIColor.green
            tenPercentTip.backgroundColor = UIColor.clear
            twentyPercentTip.backgroundColor = UIColor.clear
        }else if selectedTen{
            zeroPercentTip.backgroundColor = UIColor.clear
            tenPercentTip.backgroundColor = UIColor.green
            twentyPercentTip.backgroundColor = UIColor.clear
        }else if selectedTwenty{
            zeroPercentTip.backgroundColor = UIColor.clear
            tenPercentTip.backgroundColor = UIColor.clear
            twentyPercentTip.backgroundColor = UIColor.green
        }
    }
    
    @IBAction func peopleChange(_ sender: UIStepper){
        let value = Int(sender.value)
        peopleLabel.text = String(value)
        tips.totalPeople = value
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton){
        
        tips.eachPersonBill = String(format: "%.2f", tips.totalBill * tips.tipPercentage / Double(tips.totalPeople))
        
        print(tips.eachPersonBill)
        self.performSegue(withIdentifier: "goToResultVC", sender: self)
    }
    
    @objc override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ResultsViewController
        destinationVC.personBill = tips.eachPersonBill
        destinationVC.finalMessage = tips.message
    }
    
    
    
    

}
