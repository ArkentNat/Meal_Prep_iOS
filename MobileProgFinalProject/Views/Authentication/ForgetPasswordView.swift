//
//  ForgetPasswordView.swift
//  MobileProgFinalProject
//
//  Created by Arkent Nathanael on 22/11/22.
//

import SwiftUI

struct ForgetPasswordView: View {
    @State var email: String = ""
    @State private var goToLogin: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Email Address")
                    .foregroundColor(.gray)
                    .padding(.left, 40)
                
                HStack {
                    Image(systemName: "envelope")

                    TextField("Your Email Address", text: self.$email)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                }
                .padding(.left, 20)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(Color.gray)
                    .frame(height: 50))
                .padding(.top, 25)
                .padding(.left, 40)
                .padding(.right, 40)
                .padding(.bottom, 40)
                
                NavigationLink(destination: LoginView(), isActive: $goToLogin) {
                    Button("Submit") {
                        goToLogin = true
                    }
                    .buttonStyle(SecondaryButtonStyle())
                }
                .padding(.left, 70)
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct ForgetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgetPasswordView()
    }
}
