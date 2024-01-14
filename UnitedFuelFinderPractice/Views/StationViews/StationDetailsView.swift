//
//  StationDetailsView.swift
//  UnitedFuelFinderPractice
//
//  Created by Sardorbek Saydamatov on 05/01/24.
//

import SwiftUI

struct StationDetailsView: View {
    @ObservedObject var stationVieModel = StationsViewModel()
    @ObservedObject var commentsViewModel = CommentsViewModel()
    @Environment (\.dismiss) var dismiss
    @State var feedback: String = ""
    @State var stationId: String = ""
    @State var rate: Int = 0
    @State var allCommentsOn: Bool = false
    
    var body: some View {
        ZStack {
            innerBody
        }
        .onAppear {
            commentsViewModel.loadComments(forStationId: stationId)
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: CustomBackButton {
            dismiss()
        })
        .navigationDestination(isPresented: $allCommentsOn) {
            AllCommentsView(commentsViewModel: commentsViewModel, stationId: stationId)
        }
        .keyboardDismissable()
    }
    private var innerBody: some View {
        VStack(alignment: .leading) {
            headerView
            details
            postFeedbacks
            comments
        }
        .scrollable(showIndicators: false)
    }
    
    private var headerView: some View {
        GeometryReader { geometry in
            Image("station")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .stretchable(in: geometry)
        }
        .frame(height: UIScreen.main.bounds.height * 0.4)
        .ignoresSafeArea()
    }
    
    private var details: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                .frame(height: 32)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("TA/Petro")
                        .font(.system(size: 13, weight: .semibold))
                    
                    Text("Richard st, New York, 10010")
                        .font(.system(size: 12))
                }
            }
            .padding(.top)
            
            row(title: "Distance", detail: Text("23.37 ml").font(.system(size: 12, weight: .medium)))
            
            if let details = stationVieModel.getStationDetails(by: stationId) {
                row(title: "Price", detail: Text(details.price).font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(Color.init(uiColor: .systemGreen)))
                
                row(title: "Discount", detail: Text(details.discount).font(.system(size: 12, weight: .medium)).foregroundStyle(Color.init(uiColor: .systemRed)))
            }
        }
        .padding(.horizontal)
    }

    private var starRating: some View {
        HStack(spacing: 5) {
            RateView(starsCount: 5, rate: $rate)
                .frame(width: 100, height: 20)
                .padding(.leading, Padding.small / 2)
            
            Spacer()
            
            Button(action: {
                if feedback != "" {
                    let currentDate = Date()
                   let newComment = CommentsModel(id: UUID().uuidString, title: "You", stationId: stationId, commentDescription: feedback, starRating: rate, date: currentDate)
                    commentsViewModel.addComment(comment: newComment)
                    feedback = ""
                    rate = 0
                }
            }, label: {
                Text("Post")
                    .font(.system(size: 13, weight: .semibold))
            })
            .frame(width: 99, height: 40)
            .foregroundStyle(Color.init(uiColor: .label))
            .background(Color.init(uiColor: .secondarySystemBackground))
            .cornerRadius(6)
        }
        .padding(.horizontal, Padding.medium)
        .padding(.bottom)
    }
    
    private func row(title: String, detail: any View) -> some View {
        VStack {
            HStack {
                Text(title)
                    .font(.system(size: 12))
                Spacer()
                AnyView(detail)
            }
            
            Divider()
        }
    }
    
    private var postFeedbacks: some View {
        VStack(alignment: .leading) {
            Text("Post feedback")
                .padding(.top)
                .padding(.horizontal)
                .font(.system(size: 14, weight: .medium))
            
            YTextView(text: $feedback, placeholder: "Write comment", lineLimit: 5)
                .padding(.horizontal, Padding.medium)
            
            starRating
        }
    }
    
    private var comments: some View {
        VStack(alignment: .leading, spacing: 10) {
            Divider()
                .background(Color.black)
                .padding(.bottom)
            
            Text("Latest comments")
                .fontWeight(.semibold)
                .padding(.leading)
                .padding(.bottom)
                
            let stationComments = commentsViewModel.comments
                .filter { $0.stationId == self.stationId }
                .sorted { $0.date > $1.date }
            
            if !stationComments.isEmpty {
                if stationComments.count < 3 {
                    ForEach(stationComments) {comments in
                        CommentDetails(comment: comments.commentDescription, rate: comments.starRating, dateValue: comments.date) {
                            commentsViewModel.deleteComment(comment: comments)
                        }
                    }
                    .padding(.horizontal)
                } else {
                    ForEach(0..<3) {index in
                        CommentDetails(comment: stationComments[index].commentDescription, rate: stationComments[index].starRating, dateValue: stationComments[index].date) {
                            commentsViewModel.deleteComment(comment: stationComments[index])
                        }
                    }
                    .padding(.horizontal)
                    
                    SubmitButton {
                        allCommentsOn.toggle()
                    } label: {
                        Text("More feedbacks")
                    }
                    .padding(.horizontal)
                    .frame(height: 100)
                }
            }
        }
    }
}

#Preview {
    StationDetailsView(rate: 0)
}
