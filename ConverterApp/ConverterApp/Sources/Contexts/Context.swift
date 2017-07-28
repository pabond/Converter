//
//  Context.swift
//  ConverterApp
//
//  Created by Bondar Pavel on 7/27/17.
//  Copyright © 2017 Pavel Bondar. All rights reserved.
//

import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import RxSwift

struct Context {
    
    let result = PublishSubject<[CryptoCurrency]>()

    func execute() {
        let url = "https://api.coinmarketcap.com/v1/ticker/"
        Alamofire.request(url).responseArray { (response: DataResponse<[CryptoCurrency]>) in
            switch response.result {
            case .success(let cryptoCurrencies):
                self.result.onNext(cryptoCurrencies)
                break
            case .failure(let error):
                self.result.onError(error)
                break
            }
        }
    }
}
