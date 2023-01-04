//
//  ProfileView.swift
//  MobileProgFinalProject
//
//  Created by Arkent Nathanael on 03/01/23.
//

import SwiftUI

struct ProfileView: View {
    
    @State var firstName = ""
    @State var lastName = ""
    
    var body: some View {
        VStack(alignment: .center, content: {
            Text("Profile")
                .font(.system(size: 20))
                .foregroundColor(.gray)
            Spacer()
                .frame(height: 50)
            AsyncImage(url: URL(string: "https://spesialis1.orthopaedi.fk.unair.ac.id/wp-content/uploads/2021/02/depositphotos_39258143-stock-illustration-businessman-avatar-profile-picture.jpg")) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .stroke(.white, lineWidth: 4)
                    }
                    .shadow(radius: 7)
            } placeholder: {
                Image (systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
            Text("Arkent Nathanael")
                .font(.system(size: 30))
            .padding(.top, 20)
            
            Spacer()
                .frame(height: 50)
            
            List {
                NavigationLink(destination: EditProfileView()) {
                    ProfileMenus(image: "person.fill", menuText: "Edit Profile")
                }
                NavigationLink(destination: SettingsView()) {
                    ProfileMenus(image: "gearshape.fill", menuText: "Settings")
                }
                Spacer()
                    .frame(height: 20)
                NavigationLink(destination: LandingPage()) {
                    ProfileMenus(image: "rectangle.portrait.and.arrow.right", menuText: "Log Out")
                }
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            }
            .listStyle(.plain)

            
            
        })
        .navigationTitle("Profile")
        
    }
}

struct ProfileMenus: View {
    var image: String
    var menuText: String
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
                .foregroundColor(Color("Secondary"))
                .padding(.top, 15)
                .padding(.left, 15)
                .padding(.bottom, 15)
                .padding(.right, 15)
                .background(Color("Ternary"))
                .cornerRadius(15)
            
            
            Text(menuText)
                .foregroundColor(.gray)
                .font(.system(size: 20))
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

