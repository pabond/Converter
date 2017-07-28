//
//  CryptoCurrenciesView.swift
//  ConverterApp
//
//  Created by Bondar Pavel on 7/28/17.
//  Copyright © 2017 Pavel Bondar. All rights reserved.
//

import UIKit

class CryptoCurrenciesView: BPVView {
    @IBOutlet weak var tableView: UITableView!
    
    private let rowHeight : CGFloat = 50
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.tableView.registerCell(withClass: CryptoCurrencyCell.self)
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = rowHeight
    }
}
