//
//  StationDetailsComments.swift
//  UnitedFuelFinderPractice
//
//  Created by Sardorbek Saydamatov on 06/01/24.
//

import SwiftUI

struct CommentDetails: View {
    var sender: String = "You"
    var comment: String
    @State var rate: Int
    var dateValue: Date
    var canDelete: Bool = true
    
    var onClickDelete: (() -> Void)?
    
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm/dd/MM/yyyy"
        return dateFormatter.string(from: dateValue)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: Padding.small) {
            HStack {
                Text(sender)
                    .fontWeight(.medium)
                    .font(.system(size: 13, weight: .medium))
                
                Spacer()
                
                Button(action: {
                    self.onClickDelete?()
                }, label: {
                    Image(systemName: "trash")
                        .foregroundStyle(Color.red)
                })
                .opacity(canDelete ? 1 : 0)
            }
            
            Text(comment)
                .fontWeight(.light)
                .font(.system(size: 12))
                .multilineTextAlignment(.leading)
            
            HStack(spacing: 5) {
                RateView(rate: $rate, canRate: false)
                    .frame(width: 80, height: 16)
                Spacer()
                Text(formattedDate)
                    .font(.system(size: 12))
                    .foregroundStyle(.gray).opacity(0.7)
            }
        }
        .padding(Padding.small)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(Color.init(uiColor: .secondarySystemBackground))
        )
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 0.5)
                .foregroundStyle(Color.init(uiColor: .label))
                .opacity(canDelete ? 1 : 0)
        )
        .frame(maxHeight: 120)
    }
    
    func set(onClickDelete: @escaping () -> Void) -> Self {
        var v = self
        v.onClickDelete = onClickDelete
        return v
    }
}


//#Preview {
//    StationDetailsComments(sender: "a", comment: "b", rate: 3, dateValue: "c", canDelete: true)
//        .padding()
//}
