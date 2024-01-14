//
//  RegisterProfileView.swift
//  UnitedFuelFinderPractice
//
//  Created by Sardorbek Saydamatov on 28/11/23.
//

import SwiftUI

struct RegisterProfileView: View {
    @Environment (\.dismiss) var dismiss
    @State private var name: String = ""
    @State private var lastName: String = ""
    @State private var phoneNumber: String = ""
    @State private var cardNumber: String = ""
    @State private var companyName: String = ""
    @State private var address: String = ""
    @State var selectedState: String = ""
    @State var isHomeOpen: Bool = false
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 28) {
                    topHeading
                        .padding()
                    
                    personalDetails
                        .padding(.horizontal)
                    
                    organizationReq
                        .padding(.horizontal)
                    
                    addressInfo
                        .padding(.horizontal)
                    
                    Text("")
                        .frame(height: 100)
                }
            }
            VStack {
                Spacer()
                
                SubmitButton {
                    isHomeOpen.toggle()
                } label: {
                    Text("continue")
                }
                .padding(.bottom, Padding.medium)
                .padding(.horizontal)
            }
            .ignoresSafeArea(.keyboard, edges: .all)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton {
            dismiss()
        })
        .navigationDestination(isPresented: $isHomeOpen) {
            HomeView()
        }
    }
    private var topHeading: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(
                "Lets create an account"
            )
            .font(.system(size: 24, weight: .semibold))
            
            Text(
                "Insert your credentials"
            )
            .font(.system(size: 14, weight: .semibold))
        }
    }
    
    private var personalDetails: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Personal details")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.init(.label))
            
            YTextView(text: $name, placeholder: "First name", lineLimit: 2)
            YTextView(text: $lastName, placeholder: "Last name", lineLimit: 2)
            YTextView(text: $phoneNumber, placeholder: "Phone number", lineLimit: 2)
        }
    }
    
    private var organizationReq: some View {
        VStack(alignment: .leading, spacing: 16, content: {
            Text("Organization requisites")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.init(.label))
            
            YSelectionButton(selectedState: "Company") { binding in
                SelectCompanyView(selectedState: binding)
            }
            YTextView(text: $cardNumber, placeholder: "Card number", lineLimit: 2)
        })
    }
    
    private var addressInfo: some View {
        VStack(alignment: .leading, spacing: 16, content: {
            Text("Address Information")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.init(.label))
            
            YSelectionButton(selectedState: "States") { binding in
                SelectStateView(selectedState: binding)
            }
            
            YSelectionButton(selectedState: "City") { binding in
                SelectCityView(selectedState: binding)
            }
            
            YTextView(text: $address, placeholder: "Address", lineLimit: 5)
        })
    }
}

#Preview {
    RegisterProfileView()
}
