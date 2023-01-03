//
//  HomeCategoryRow.swift
//  MobileProgFinalProject
//
//  Created by Arkent Nathanael on 15/12/22.
//

import SwiftUI

struct HomeCategoryRow: View {
    var categoryName: String
    var items: [Meal]
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
                .frame(height: 10)
            HStack {
                Spacer()
                    .frame(width: 15)
                Text(categoryName)
                    .font(.system(size: 36))
                    .foregroundColor(Color.black)
                    .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                    .background(Color.white).clipShape(RoundedRectangle(cornerRadius:20))
            }

            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { meal in
                        NavigationLink {
                            HomeCategoryDetail(meal: meal)
                        } label: {
                            HomeCategoryItem(meal: meal)
                        }
                        
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct HomeCategoryRow_Previews: PreviewProvider {
    static var meals = ModelData().meals
    
    static var previews: some View {
        HomeCategoryRow(
            categoryName: meals[0].category.rawValue,
            items: Array(meals.prefix(2))
        )
    }
}
