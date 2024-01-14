//
//  SettingsView.swift
//  UnitedFuelFinderPractice
//
//  Created by Sardorbek Saydamatov on 05/01/24.
//

import SwiftUI

struct SettingsView: View {
    @Environment (\.dismiss) var dismiss
    @State var alertOn: Bool = false
    @State var editOpen: Bool = false
    @State var isLogOut: Bool = false
    var body: some View {
        VStack {
            SettingsButtonView(title: "Edit profile", image1: "square.and.pencil") {
                editOpen.toggle()
            }
            
            Divider()
            
            SettingsButtonView(title: "Language", image1: "character.phonetic") {
                alertOn.toggle()
            }
            
            Divider()
            
            SettingsButtonView(title: "Security", image1: "lock") {
                alertOn.toggle()
            }
            Divider()
            
            SettingsButtonView(title: "Contact us", image1: "person.wave.2") {
                alertOn.toggle()
            }
            Divider()
            
            SettingsButtonView(title: "Log out", image1: "pip.exit", color: Color.red) {
                isLogOut.toggle()
            }
            Text("")
                .frame(height: 350)
        }
        .alert(isPresented: $alertOn) {
            Alert(title: Text("Error"), message: Text("Sorry this function is not available yet"), dismissButton: .default(Text("OK")))
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton {
            dismiss()
        })
        .navigationDestination(isPresented: $editOpen) {
            EditProfileView()
        }
        .navigationDestination(isPresented: $isLogOut) {
            AuthView()
        }
    }
}

#Preview {
    NavigationStack{
        SettingsView()
    }
}
