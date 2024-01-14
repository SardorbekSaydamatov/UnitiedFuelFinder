//
//  EditProfileView.swift
//  UnitedFuelFinderPractice
//
//  Created by Sardorbek Saydamatov on 04/01/24.
//

import SwiftUI

struct EditProfileView: View {
    @Environment (\.dismiss) var dismiss
    @State var name: String = ""
    @State var lastName: String = ""
    @State var phoneNumber: String = ""
    @State var address: String = ""

    var body: some View {
        NavigationStack {
            VStack {
                personalInfo
                    .padding(.top)
                adressInfo
                Spacer()
            }
            .padding(.horizontal)
            .navigationTitle("Edit profile")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: CustomBackButton {
                dismiss()
            })
        }
    }
    private var personalInfo: some View{
        VStack {
            YTextView(text: $name, placeholder: "First name", lineLimit: 2)
            YTextView(text: $lastName, placeholder: "Last name", lineLimit: 2)
            YTextView(text: $phoneNumber, placeholder: "Phone number", lineLimit: 2)
        }
    }
    
    private var adressInfo: some View {
        VStack(alignment: .leading, spacing: 16, content: {
            Text("Address Information")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.init(.label))
                .padding()
            
            YSelectionButton(selectedState: "States") { binding in
                SelectStateView(selectedState: binding)
            }
            
            YSelectionButton(selectedState: "City") { binding in
                SelectCityView(selectedState: binding)
            }
            
            YTextView(text: $address, placeholder: "Address", lineLimit: 5)
            
            Spacer()
            
            SubmitButton {
                
            } label: {
                Text("Save")
            }

        })
    }
}

#Preview {
    EditProfileView()
}
