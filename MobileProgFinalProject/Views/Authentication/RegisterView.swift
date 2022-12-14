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
    @State var confirmPassword: String = ""
    @State private var goToLogin = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Image("register")
                    .resizable()
                    .frame(width: 300, height: 300, alignment: .center)
                Spacer()
            }
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
            .padding(.top, 15)
            .padding(.left, 40)
            .padding(.right, 40)
            .padding(.bottom, 20)
            
            Text("Password")
                .foregroundColor(.gray)
                .padding(.left, 40)
            
            HStack {
                Image(systemName: "lock")

                SecureInputView("Your Password", text: self.$password)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled(true)
            }
            .padding(.left, 20)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(Color.gray)
                .frame(height: 50))
            .padding(.top, 15)
            .padding(.left, 40)
            .padding(.right, 40)
            .padding(.bottom, 20)
            
            Text("Confirm Password")
                .foregroundColor(.gray)
                .padding(.left, 40)
            
            HStack {
                Image(systemName: "lock")

                SecureInputView("Re-Type Password", text: self.$confirmPassword)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled(true)
            }
            .padding(.left, 20)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(Color.gray)
                .frame(height: 50))
            .padding(.top, 15)
            .padding(.left, 40)
            .padding(.right, 40)
            .padding(.bottom, 20)
            
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
        .offset(y: -30)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .frame(maxWidth: .infinity)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
