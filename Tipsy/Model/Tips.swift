//
//  Tips.swift
//  Tipsy
//
//  Created by Terence Win on 2025/10/22.
//

import Foundation

struct Tips{
    var totalBill : Double = 0.00
    var totalPeople: Int = 0
    var tipPercentage: Double = 0.00
    var eachPersonBill: String? = nil
    var message: String{
        let percentage: Int
        if tipPercentage == 1.10{
            percentage = 10
        }else if tipPercentage == 1.20{
            percentage = 20
        }else{
           percentage = 0
        }
        return "Split between \(totalPeople) people, with \(percentage)% tip."
    }
}

