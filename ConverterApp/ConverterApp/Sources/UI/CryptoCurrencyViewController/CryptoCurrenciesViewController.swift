//
//  CryptoCurrenciesViewController.swift
//  ConverterApp
//
//  Created by Bondar Pavel on 7/27/17.
//  Copyright © 2017 Pavel Bondar. All rights reserved.
//

import UIKit
import RxSwift

class CryptoCurrenciesViewController: UIViewController, RootViewGettable {
    typealias RootViewType = CryptoCurrenciesView
    
    let disposeBag = DisposeBag()
    
    var cryptoCurrencies : [CryptoCurrency]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.load()
        self.rootView?.tableView.registerCell(withClass: CryptoCurrencyCell.self)
        self.rootView?.tableView.rowHeight = UITableViewAutomaticDimension
        self.rootView?.tableView.estimatedRowHeight = 50
    }
    
    private func load() {
        let context = Context()
        context.result.subscribe { [weak self] result in
            guard let `self` = self else { return }
            
            if let error = result.error {
                print(error)
            } else if let cryptoCurrencies = result.element {
                self.cryptoCurrencies = cryptoCurrencies
            }
            
            DispatchQueue.main.async {
                self.rootView?.tableView.reloadData()
            }
            
            self.rootView?.loading = false
            }.addDisposableTo(disposeBag)
        
        rootView?.loading = true
        context.execute()
    }
}

    // MARK: -
    // MARK: UITableViewDelegate, UITableViewDataSource

extension CryptoCurrenciesViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptoCurrencies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCellWithClass(CryptoCurrencyCell.self, path: indexPath)
        cell.cryptoCurrency = cryptoCurrencies?[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
}
