//
//  CryptoCurrency.swift
//  ConverterApp
//
//  Created by Bondar Pavel on 7/27/17.
//  Copyright © 2017 Pavel Bondar. All rights reserved.
//

import UIKit
import ObjectMapper

struct CryptoCurrency: Mappable {
    var id = String()
    var name = String()
    var priceBTC = String()
    var priceUSD = String()
    var rank = 0
    var symbol = String()
    
    var currency : String {
        return "\(self.priceBTC) BTC per \(self.priceUSD) USD"
    }
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id          <- map["id"]
        name        <- map["name"]
        priceBTC 	<- map["price_btc"]
        priceUSD 	<- map["price_usd"]
        rank        <- map["rank"]
        symbol      <- map["symbol"]
    }
}
