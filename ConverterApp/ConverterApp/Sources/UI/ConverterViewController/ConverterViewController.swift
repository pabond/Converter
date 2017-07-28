//
//  ConverterViewController.swift
//  ConverterApp
//
//  Created by Bondar Pavel on 7/28/17.
//  Copyright © 2017 Pavel Bondar. All rights reserved.
//

import UIKit
import RxSwift

enum ConvertFromType {
    case usd, btc
}

class ConverterViewController: UIViewController, RootViewGettable {
    typealias RootViewType = ConverterView
    let disposeBag = DisposeBag()
    
    var cryptoCurrency : CryptoCurrency?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.automaticallyAdjustsScrollViewInsets = true;
        self.extendedLayoutIncludesOpaqueBars = true;
        self.edgesForExtendedLayout = .bottom;
        
        cryptoCurrency.map { self.rootView?.fillViews(with: $0) }
        self.navigationItem.title = "Converter"
    }
    
    @IBAction func onCalculate(_ sender: UIButton) {
        let isUSD = self.rootView?.currencySegmentedControl.selectedSegmentIndex == 0
        guard let text = rootView?.convertTextField.text,
            let value = Float(text),
            let cryptoCurrency = cryptoCurrency
            else { return }
        
        DispatchQueue.global().async { [weak self] in
            guard let `self` = self else { return }
            
            ContverterInteractor.convert(cryptoCurrency: cryptoCurrency,
                                         valueToConvert: value,
                                         isUSD: isUSD)
                .observeOn(MainScheduler.instance)
                .subscribe { [weak self] (event) in
                    self?.rootView?.resultLabel.text = "\(event.element ?? 0)"
                }.addDisposableTo(self.disposeBag)

        }
    }
}
