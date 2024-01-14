//
//  CommentsViewModel.swift
//  UnitedFuelFinderPractice
//
//  Created by Sardorbek Saydamatov on 11/01/24.
//

import SwiftUI
import RealmSwift

class CommentsViewModel: ObservableObject {
    @Published var comments: [CommentsModel] = []

    func loadComments(forStationId stationId: String) {
        do {
            let realm = try Realm()
            comments = Array(realm.objects(CommentsModel.self).filter("stationId == %@", stationId))
        } catch {
            print("Error loading comments: \(error.localizedDescription)")
        }
    }
    
    func addComment(comment: CommentsModel) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(comment)
            }
            
            loadComments(forStationId: comment.stationId)
        } catch {
            print("Error adding comment: \(error.localizedDescription)")
        }
    }
    
    func deleteComment(comment: CommentsModel) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete(comment)
            }

            if let index = comments.firstIndex(of: comment) {
                comments.remove(at: index)
            }
        } catch {
            print("Error deleting comment: \(error)")
        }
    }
}

