//
//  HomeCategoryItem.swift
//  MobileProgFinalProject
//
//  Created by Arkent Nathanael on 03/01/23.
//

import SwiftUI

struct HomeCategoryItem: View {
    var meal: Meal
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: meal.imageName)) { image in
                image
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 155, height: 155)
                    .cornerRadius(30)
            } placeholder: {
                Image (systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            Text(meal.name)
                .foregroundColor(Color.black)
                .font(.system(size:15))
                .frame(width: 155, height:15)
                .truncationMode(.tail)
            
        }
        .padding(.leading, 15)
        

    }
}

struct HomeCategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        HomeCategoryItem(meal: ModelData().meals[0])
    }
}
