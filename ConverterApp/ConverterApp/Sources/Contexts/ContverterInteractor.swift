//
//  ContverterInteractor.swift
//  ConverterApp
//
//  Created by Bondar Pavel on 7/28/17.
//  Copyright © 2017 Pavel Bondar. All rights reserved.
//

import Foundation
import RxSwift

struct ContverterInteractor {
    
    static func convert (cryptoCurrency : CryptoCurrency,
                         valueToConvert: Float,
                         isUSD: Bool) -> Observable<Float>
    {
        return Observable.create({ observer in
            guard
                let priceUSD = Float(cryptoCurrency.priceUSD),
                let priceBTC = Float(cryptoCurrency.priceBTC)
                else { return Disposables.create() }

            let firstValue = isUSD ? priceBTC : priceUSD
            let secondValue = isUSD ? priceUSD : priceBTC
            
            observer.onNext(firstValue * valueToConvert / secondValue)
            return Disposables.create()
        })
    }
    
}
