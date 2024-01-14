//
//  StationsViewModel.swift
//  UnitedFuelFinderPractice
//
//  Created by Sardorbek Saydamatov on 10/01/24.
//

import Foundation
import RealmSwift

class StationsViewModel: ObservableObject {
    @Published var stations: [StationsModel] = []

    init() {
        fetchStations()
    }

    func fetchStations() {
        if let realm = Realm.new {
            stations = Array(realm.objects(StationsModel.self))
        }
    }
    
    func getStationDetails(by id: String) -> (price: String, discount: String)? {
            
            if let station = stations.first(where: { $0.id == id }) {
                return (station.price, station.discount)
            }
            return nil
        }
}
