//
//  ConverterView.swift
//  ConverterApp
//
//  Created by Bondar Pavel on 7/28/17.
//  Copyright © 2017 Pavel Bondar. All rights reserved.
//

import UIKit

class ConverterView: UIView {
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var convertTextField: UITextField!
    @IBOutlet weak var currencySegmentedControl: UISegmentedControl!
    @IBOutlet weak var resultLabel: UILabel!
    
    func fillViews(with cryptoCurrency: CryptoCurrency) {
        currencyLabel.text = cryptoCurrency.currency
        
    }
}
