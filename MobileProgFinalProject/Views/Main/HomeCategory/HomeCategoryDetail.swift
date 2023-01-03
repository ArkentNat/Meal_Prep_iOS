//
//  HomeCategoryDetail.swift
//  MobileProgFinalProject
//
//  Created by Arkent Nathanael on 03/01/23.
//

import SwiftUI

struct HomeCategoryDetail: View {
    var meal: Meal
    var body: some View {
        ScrollView {
            AsyncImage(url: URL(string: meal.imageName)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width)
                
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
            }
            .scaledToFill()
            .frame(height: 300, alignment: .center)
            .clipped()
            .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]), startPoint: .top, endPoint: .bottom))
            .cornerRadius(40)
            
            VStack(spacing: 30) {
                Text(meal.name)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                
                VStack(alignment: .leading, spacing: 30) {
                    if !meal.description.isEmpty {
                        Text(meal.description)
                    }
                    
                    
                    
                    if !meal.ingredients.isEmpty {
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Ingredients")
                                .font(.headline)
                            
                            Text(meal.ingredients)
                        }
                    }
                    
                    if !meal.directions.isEmpty {
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Directions")
                                .font(.headline)
                            
                            Text(meal.directions)
                        }
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal)
        }
    }
}

struct HomeCategoryDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        HomeCategoryDetail(meal: modelData.meals[0])
            .environmentObject(modelData)
    }
}
