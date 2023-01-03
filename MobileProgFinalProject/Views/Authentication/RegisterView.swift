//
//  RegisterView.swift
//  MobileProgFinalProject
//
//  Created by Arkent Nathanael on 22/11/22.
//

import SwiftUI

struct RegisterView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State private var goToLogin = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
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
                
                Text("Password")
                    .foregroundColor(.gray)
                    .padding(.left, 40)
                
                HStack {
                    Image(systemName: "lock")

                    SecureInputView("Your Email Address", text: self.$password)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                }
                .padding(.left, 20)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(Color.gray)
                    .frame(height: 50))
                .padding(.top, 25)
                .padding(.left, 40)
                .padding(.right, 40)
                .padding(.bottom, 30)
                
                HStack {
                    Spacer()
                    NavigationLink(destination: LoginView()) {
                        Text("Already have an account ?")
                            .foregroundColor(Color("Primary"))
                            .bold()
                    }
                    .padding(.right, 40)
                }
                Spacer()
                    .frame(height: 100)
                

                NavigationLink(destination: LoginView(), isActive: $goToLogin) {
                    Button("Sign Up") {
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

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
