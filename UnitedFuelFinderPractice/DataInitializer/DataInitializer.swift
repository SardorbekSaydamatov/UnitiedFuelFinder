//
//  DataInitializer.swift
//  UnitedFuelFinderPractice
//
//  Created by Sardorbek Saydamatov on 10/01/24.
//

import Foundation
import RealmSwift

class DataInitializer {
    static func prepopulateStations() {
        Realm.new?.tryWrite { realm in
            if realm.objects(StationsModel.self).isEmpty {
                let station1 = StationsModel(id: UUID().uuidString, price: "10.0", discount: "2.0")
                let station2 = StationsModel(id: UUID().uuidString, price: "15.0", discount: "3.0")
                let station3 = StationsModel(id: UUID().uuidString, price: "20.0", discount: "4.0")

                realm.add([station1, station2, station3])
            }
        }
    }
}

