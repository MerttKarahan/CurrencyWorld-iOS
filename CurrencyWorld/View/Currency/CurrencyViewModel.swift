//
//  CurrencyViewModel.swift
//  CurrencyWorld
//
//  Created by emn on 20.05.2022.
//

import Foundation
import UIKit
import FirebaseAuth


// Tüm liste
class CurrencyListViewModel {
    
    var webService = WebService()
    var currencyList : [CurrencyPackage] = []
    
    
    func getData(dataFetched: @escaping (() -> Void)) {
        webService.getData { currencies in
            self.currencyList = currencies
            dataFetched()
        } error: { err in
            print(err)
        }
        
    }
    
    func numberOfRowsInSection() -> Int {
        return self.currencyList.count
    }
    
    func currencyAtIndex(_ index: Int) -> CurrencyPackage {
        let item = self.currencyList[index]
        return item
    }
    
    
    func logout(finish: @escaping ((String?) -> Void)) {
        do {
            try Auth.auth().signOut()
            finish(nil)
        } catch {
            finish(error.localizedDescription)
        }
    }
    
}


