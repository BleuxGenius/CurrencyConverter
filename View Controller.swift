//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Danielle Blackwell on 9/5/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

// Blueprint of the currency Calculator
//needs to be outside of class


enum Currency {
    case cad
    case mxn
    case currency
}

class ViewController: UIViewController {
    
    // MARK: - Outlets/Properties
    
    var currency : Currency = .cad
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!
    
    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        var converted : String = ""
        
        guard let fromCurrencyText = fromCurrencyTextField.text else {return}
        guard let currencyValue = Double(fromCurrencyText)else {return}
        if currency == .cad {
            converted = String(convertToCanadaDollar(currencyValue))
        } else {
            converted = String(convertToPesoDollar(currencyValue))
        }
        toCurrencyTextField.text = converted
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected == true {
            currency = .cad
            toCurrencyLabel.text = "Currency (CAD)"
        }
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected == true {
            currency = .mxn
            toCurrencyLabel.text = "Currency (MXN)"
        }
    }
    
    // MARK: - Helper Methods
    
    //    This line of code helps , make the decimal point not go past the second decimal point. fist you need to
//    {create the
//    func to have perameters of a double that converts to a string.
//    set the first instruction creat a constant in the func where the dollar amount is multiplied . next set the string , then return the string in the claculator.
    
    func convertToCanadaDollar (_ dollars: Double) -> String {
        let canadaDollars = dollars * 1.33
        let modifiedCanadaDollar = String(format: "%.2f", canadaDollars)
        return modifiedCanadaDollar
    }
    func convertToPesoDollar (_ pesos: Double) -> String {
        let pesoDollars = pesos * 19.74
        let modifiedPesoDollar = String(format: "%.2f", pesoDollars)
        return modifiedPesoDollar
    }
}

