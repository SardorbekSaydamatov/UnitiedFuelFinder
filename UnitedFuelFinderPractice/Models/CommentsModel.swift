//
//  CommentsModel.swift
//  UnitedFuelFinderPractice
//
//  Created by Sardorbek Saydamatov on 11/01/24.
//

import Foundation
import RealmSwift

class CommentsModel: Object, Identifiable {
    @Persisted(primaryKey: true) var id: String
    @Persisted var title: String
    @Persisted var stationId: String
    @Persisted var commentDescription: String
    @Persisted var starRating: Int
    @Persisted var date: Date

    init(id: String, title: String, stationId: String, commentDescription: String, starRating: Int, date: Date) {
        self.title = title
        self.stationId = stationId
        self.commentDescription = commentDescription
        self.starRating = starRating
        self.date = date
        super.init()
        self.id = id
    }
    
    override init() {
        super.init()
    }
}
