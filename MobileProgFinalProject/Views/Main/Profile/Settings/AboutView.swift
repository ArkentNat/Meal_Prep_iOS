//
//  AboutView.swift
//  MobileProgFinalProject
//
//  Created by Arkent Nathanael on 04/01/23.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationView{
            VStack (alignment: .leading){
                Text("This application is for Semester 7 Mobile Programming Project of Swiss German University")
                Spacer()
                    .frame(height:30)
                Text("Developed by: \nArkent Nathanael \nDave Andersen \nWilliam Hartowidjojo")
                
                Spacer()
                    .frame(height:300)
                HStack{
                    Text("v.0.5.0")
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity)

            }

            .padding(.left, 30)
            .padding(.right, 30)
        }
        .navigationTitle("About")
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
