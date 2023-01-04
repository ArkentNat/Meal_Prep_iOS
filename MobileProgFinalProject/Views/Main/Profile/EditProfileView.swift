//
//  EditProfileView.swift
//  MobileProgFinalProject
//
//  Created by Arkent Nathanael on 03/01/23.
//

import SwiftUI

struct EditProfileView: View {
    @State var username: String = ""
    @State var email: String = ""
    @State var phoneNo: String = ""
    @State private var updated: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.white
                //.ignoresSafeArea()
           
            VStack {
                Rectangle()
                    .frame(height: 0)
                    .background(Color("Primary"))
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
                .offset(y: -100)
                
                HStack {
                    Image(systemName: "person.fill")

                    TextField("Username", text: self.$username)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                }
                .padding(.left, 20)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(Color.gray)
                    .frame(height: 50))
                .padding(.top, 15)
                .padding(.left, 40)
                .padding(.right, 40)
                .padding(.bottom, 40)
                
                HStack {
                    Image(systemName: "envelope")

                    TextField("Username", text: self.$username)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                }
                .padding(.left, 20)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(Color.gray)
                    .frame(height: 50))
                .padding(.top, 15)
                .padding(.left, 40)
                .padding(.right, 40)
                .padding(.bottom, 40)
                
                HStack {
                    Image(systemName: "phone.fill")

                    TextField("Phone Number", text: self.$phoneNo)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                }
                .padding(.left, 20)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(Color.gray)
                    .frame(height: 50))
                .padding(.top, 15)
                .padding(.left, 40)
                .padding(.right, 40)
                .padding(.bottom, 30)
                
                Spacer()
                    .frame(height: 30)

                Button("Update") {
                    self.presentationMode.wrappedValue.dismiss()
                }
                .buttonStyle(PrimaryButtonStyle())

                Spacer()
            }
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
