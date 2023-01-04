//
//  SettingsView.swift
//  MobileProgFinalProject
//
//  Created by Arkent Nathanael on 03/01/23.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack{
            List {
                HStack {
                    AsyncImage(url: URL(string: "https://spesialis1.orthopaedi.fk.unair.ac.id/wp-content/uploads/2021/02/depositphotos_39258143-stock-illustration-businessman-avatar-profile-picture.jpg")) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .overlay {
                                Circle()
                                    .stroke(.white, lineWidth: 2)
                            }
                            .shadow(radius: 7)
                    } placeholder: {
                        Image (systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40, alignment: .center)
                            .foregroundColor(.white.opacity(0.7))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    Text("Arkent Nathanael")
                        .font(.system(size:23))
                        .padding(.left, 20)
                }
                .padding(.left, 30)
                .padding(.bottom, 20)
                .listRowSeparator(.hidden, edges: .top)
                
                Spacer()
                    .frame(height:30)
                
                Text("Account Settings")
                    .font(.system(size: 23))
                    .foregroundColor(.gray)
                    .listRowSeparator(.hidden)
                    .padding(.left, 30)
                
                NavigationLink(destination: Text("Change Password View")) {
                    ProfileMenus(image: "key.fill", menuText: "Change Password")
                }
                .padding(.top, 20)
                .padding(.left, 25)
                .padding(.bottom, 50)
                
                Text("More")
                    .font(.system(size: 23))
                    .foregroundColor(.gray)
                    .listRowSeparator(.hidden, edges: .bottom)
                    .padding(.left, 30)
                
                NavigationLink(destination: Text("Privacy Policy View")) {
                    ProfileMenus(image: "lock.doc.fill", menuText: "Privacy Policy")
                }
                .padding(.top, 20)
                .padding(.left, 25)
                .listRowSeparator(.hidden)
                
                NavigationLink(destination: Text("Terms and Conditions View")) {
                    ProfileMenus(image: "rectangle.fill.badge.checkmark", menuText: "Terms and Conditions")
                }
                .padding(.top, 20)
                .padding(.left, 25)
                .padding(.bottom, 50)
                
                NavigationLink(destination: AboutView()) {
                    ProfileMenus(image: "info.circle.fill", menuText: "About")
                }
                .padding(.top, 20)
                .padding(.left, 25)
                .listRowSeparator(.hidden, edges: .bottom)


            }
            .padding(.right, 15)
            .listStyle(.plain)
            
            
            Spacer()
            
        }
        .navigationTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
