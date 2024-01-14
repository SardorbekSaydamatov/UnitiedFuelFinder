//
//  AuthView.swift
//  UnitedFuelFinderPractice
//
//  Created by Sardorbek Saydamatov on 26/11/23.
//

import SwiftUI

struct AuthView: View {
    
    @State private var email: String = ""
    @State private var isOn: Bool = false
    @State var isLogged: Bool = false
    
    var body: some View {
        mainBody
    }
    
    private var mainBody: some View {
        NavigationStack {
            VStack {
                innerBody
                    .keyboardDismissable()
            }
            .ignoresSafeArea(.keyboard, edges: .all)
            .navigationDestination(isPresented: $isLogged) {
                RegisterProfileView()
            }
            .navigationBarBackButtonHidden()
        }
    }
    
    private var innerBody: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("Welcome to")
                    Text("FUEL CARDS")
                        .foregroundStyle(Color.orange).opacity(0.7)
                }
                .font(.system(size: 24, weight: .semibold))
                Text("Let's sign you in")
                    .font(.system(size: 14, weight: .medium))
                
                    YTextFieldView(text: $email, placeholder: "sample@email.domain", lineLimit: 2)
                        .textContentType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .padding(.top, 20)
                
                HStack {
                    Image(systemName: isOn ? "checkmark.square" : "square")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 18)
                        .fontWeight(.bold)
                        .onTapGesture {
                            isOn.toggle()
                        }
                        .foregroundStyle(Color.orange).opacity(0.7)
                    
                    Text("I do agree with")
                    Text("offer")
                        .foregroundStyle(Color.orange)
                }
                .font(.system(size: 12))
                .padding(.vertical)
                
                
            }
            .padding()
            VStack {
                Spacer()
                SubmitButton {
                    isLogged = true
                } label: {
                    Text("Login")
                }
            .set(isEnabled: isOn && !email.isEmpty)
            .padding(.horizontal, Padding.default)
            .padding(.bottom, Padding.medium)
            }
        }
    }
}

#Preview {
    AuthView()
}
