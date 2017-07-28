//
//  CryptoCurrencyCell.swift
//  ConverterApp
//
//  Created by Bondar Pavel on 7/27/17.
//  Copyright © 2017 Pavel Bondar. All rights reserved.
//

import UIKit

class CryptoCurrencyCell: UITableViewCell {
    @IBOutlet weak var CryptoCurrencyNameLabel: UILabel!
    @IBOutlet weak var CryptoCurrencyValuesLabel: UILabel!
    
    var cryptoCurrency : CryptoCurrency? {
        didSet {
            cryptoCurrency.map { fillWith($0) }
        }
    }
    
    func fillWith(_ cryptoCurrency: CryptoCurrency) {
        CryptoCurrencyNameLabel.text = cryptoCurrency.name
        CryptoCurrencyValuesLabel.text = cryptoCurrency.currency
    }
    
    override func prepareForReuse() {
        CryptoCurrencyNameLabel.text = nil
        CryptoCurrencyValuesLabel.text = nil
    }
}
