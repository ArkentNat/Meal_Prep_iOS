//
//  LoginView.swift
//  Meal_Prep_iOS
//
//  Created by Arkent Nathanael on 13/10/22.
//



import SwiftUI

struct FacebookButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 300, height: 45)
            .font(.system(size: 18, weight: Font.Weight.bold))
            .foregroundColor(.white)
            .background(Color("FacebookButton"))
            .cornerRadius(11)
            .scaleEffect(configuration.isPressed ? 1.5 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct GoogleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 300, height: 45)
            .font(.system(size: 18, weight: Font.Weight.bold))
            .overlay(
                    RoundedRectangle(cornerRadius: 11)
                        .stroke(Color(.systemGray5), lineWidth: 2)
            )
            .foregroundColor(.gray)
            .background(Color.white)

            .scaleEffect(configuration.isPressed ? 1.5 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct SecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 290, height: 85)
            .font(.system(size: 28, weight: Font.Weight.bold))
            .foregroundColor(.white)
            .background(Color("Secondary"))
            .cornerRadius(25)
            .scaleEffect(configuration.isPressed ? 1.5 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct LoginView: View {
    @State var email: String = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Image("login")
                    .resizable()
                    .frame(width: 400, height: 250)

                Button("Continue with Facebook") {
                    
                }
                .buttonStyle(FacebookButtonStyle())
                Button("Continue with Apple") {
                    
                }
                .buttonStyle(GoogleButtonStyle())
                HStack {
                    line
                        .padding(.left, 45)
                        .padding(.right, 10)
                    Text("OR")
                        .foregroundColor(Color.gray)
                    line
                        .padding(.left, 10)
                        .padding(.right, 45)
                }
                LoginForm()
            }
            .offset(y: -70)

        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)

    }
    
    var line: some View {
        VStack {
            VStack { Divider().background(Color.gray)}
        }
    }
}

struct LoginForm: View {
    @State var email: String = ""
    @State var password: String = ""
    @State private var goToHome = false
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){

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

                SecureInputView("Your Password", text: self.$password)
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
                NavigationLink(destination: RegisterView()){
                    Text("Don't have an account ?")
                        .foregroundColor(Color("Primary"))
                        .bold()

                }
                .navigationBarBackButtonHidden(true)
                .padding(.left, 40)
                Spacer()
                NavigationLink(destination: ForgetPasswordView()) {
                    Text("Forget Password?")
                        .foregroundColor(Color("Primary"))
                        .bold()
                }
                .padding(.right, 40)
            }
            Spacer()
                .frame(height: 60)
            

            NavigationLink(destination: TabBar(), isActive: $goToHome) {
                Button("Login") {
                    if(email == "example@example.com") && (password == "pass123") {
                        goToHome = true
                    } else if (email == "") || (password == "") {
                        showAlert = true;
                        alertMessage = "One of the fields is empty"
                    } else {
                        showAlert = true;
                        alertMessage = "Email/Password is incorrect or not found!"
                        password = ""
                    }

                }
                .alert(alertMessage, isPresented: $showAlert) {
                    Button("OK", role: .cancel) {}
                }
                .buttonStyle(SecondaryButtonStyle())
            }
            .padding(.left, 70)
            
            
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct SecureInputView: View {
    
    @Binding private var text: String
    @State private var isSecured: Bool = true
    private var title: String
    
    init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
    
    var body: some View {
        ZStack(alignment: .trailing) {
            Group {
                if isSecured {
                    SecureField(title, text: $text)
                } else {
                    TextField(title, text: $text)
                }
            }.padding(.trailing, 32)

            Button(action: {
                isSecured.toggle()
            }) {
                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                    .accentColor(.gray)
                    .padding(.right, 5)
            }
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

