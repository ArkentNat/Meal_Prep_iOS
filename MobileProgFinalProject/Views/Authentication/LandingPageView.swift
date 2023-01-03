//
//  LandingPage.swift
//  Meal_Prep_iOS
//
//  Created by Arkent Nathanael on 01/11/22.
//

enum NoFlipEdge {
    case left, right
}

struct NoFlipPadding: ViewModifier {
    let edge: NoFlipEdge
    let length: CGFloat?
    @Environment(\.layoutDirection) var layoutDirection

    private var computedEdge: Edge.Set {
        if layoutDirection == .rightToLeft {
            return edge == .left ? .trailing : .leading
        } else {
            return edge == .left ? .leading : .trailing
        }
    }

    func body(content: Content) -> some View {
        content
            .padding(computedEdge, length)
    }
}

extension View {
    func padding(_ edge: NoFlipEdge, _ length: CGFloat? = nil) -> some View {
        self.modifier(NoFlipPadding(edge: edge, length: length))
    }
}

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 290, height: 85)
            .font(.system(size: 28, weight: Font.Weight.bold))
            .foregroundColor(.white)
            .background(Color("Primary"))
            .cornerRadius(25)
            .scaleEffect(configuration.isPressed ? 1.5 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

import SwiftUI


struct LandingPage: View {
    @State private var goToRegister = false
    
    var body: some View {
        NavigationView {
            VStack(){
                Spacer()
                    .frame(height: 330)
                Text("Eat Healthy").font(.largeTitle).bold()
                Spacer()
                    .frame(height: 20)
                Text("Maintaining good health should be the primary focus of everyone.")
                    .padding(.left, 30)
                    .padding(.right, 30)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                
                Spacer()
                    .frame(height: 90)
                
                NavigationLink(destination: RegisterView(), isActive: $goToRegister) {
                    Button("Get Started") {
                        goToRegister = true
                    }
                    .buttonStyle(PrimaryButtonStyle())
                }
                

                Spacer()
                    .frame(height: 20)
                HStack {
                    Text("Already have an account?")
                    NavigationLink(destination: LoginView()) {
                        Text("Log In")
                            .foregroundColor(Color("Primary"))
                            .bold()
                    }
                    .navigationBarBackButtonHidden(true)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}
