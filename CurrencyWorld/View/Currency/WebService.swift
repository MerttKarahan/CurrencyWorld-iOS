//
//  Service.swift
//  CurrencyWorld
//
//  Created by emn on 20.05.2022.
//

import Foundation


class WebService {
    
    func getData(finish: @escaping (([CurrencyPackage]) -> Void), error: @escaping ((String) -> Void) ) {
        URLSession.shared.dataTask(with: URL(string:"https://api.currencyscoop.com/v1/latest?api_key=36d39ecf1aaff384a00edfad502fa246")!) { data, _ , err in
            if let data = data {
                let dictionary = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                let response = dictionary?["response"] as? [String:Any]
                let rates = response?["rates"] as? [String:Double]
                
                
                var ratesList = [CurrencyPackage]()
                for rate in rates ?? [:] {
                    let currency = CurrencyPackage(currency: rate.key, price: rate.value.description)
                    ratesList.append(currency)
                }
                ratesList.sort {
                    $0.currency < $1.currency
                }
                finish(ratesList)
            } else {
                error(err?.localizedDescription ?? "")
            }
        }.resume()
    }
}
