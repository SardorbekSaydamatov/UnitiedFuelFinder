//
//  CommentsView.swift
//  UnitedFuelFinderPractice
//
//  Created by Sardorbek Saydamatov on 12/01/24.
//

import SwiftUI
import RealmSwift

struct AllCommentsView: View {
    @ObservedObject var commentsViewModel: CommentsViewModel
    @Environment (\.dismiss) var dismiss
    var stationId: String

    var body: some View {
        VStack {
            ForEach(commentsViewModel.comments) {comments in
                CommentDetails(comment: comments.commentDescription, rate: comments.starRating, dateValue: comments.date) {
                    commentsViewModel.deleteComment(comment: comments)
                }
                .padding(.horizontal)
            }
        }
        .padding(.top)
        .navigationTitle("All comments")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: CustomBackButton {
            dismiss()
        })
        .scrollable(showIndicators: false)
    }
}
//#Preview {
//    AllCommentsView(stationId: "assd")
//}
