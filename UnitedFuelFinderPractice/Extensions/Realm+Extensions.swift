//
//  Realm+Extensions.swift
//  UnitedFuelFinderPractice
//
//  Created by Sardorbek Saydamatov on 10/01/24.
//

import Foundation
import RealmSwift

extension Realm {
    static var new: Realm? {
        try? Realm()
    }
    
    func tryWrite(_ block: @escaping (Realm) -> Void) {
        do {
            try self.write({
                block(self)
            })
        } catch {
            debugPrint("Cannot write \(error.localizedDescription)")
        }
    }
}
