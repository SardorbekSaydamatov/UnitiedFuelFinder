//
//  StationsModel.swift
//  UnitedFuelFinderPractice
//
//  Created by Sardorbek Saydamatov on 10/01/24.
//

import Foundation
import RealmSwift

class StationsModel: Object, Identifiable {
    @Persisted(primaryKey: true) var id: String
    @Persisted var price: String
    @Persisted var discount: String
    
    init(id: String, price: String, discount: String) {
        self.price = price
        self.discount = discount
        super.init()
        self.id = id
    }
    
    override init() {
        super.init()
    }
}



