//
//  SearchGridList.swift
//  MobileProgFinalProject
//
//  Created by Arkent Nathanael on 04/01/23.
//

import SwiftUI

struct SearchGridList: View {
    @EnvironmentObject var modelData : ModelData
    @State var filterText: String = "Chicken"
    
    var filteredMeals: [Meal] {
        modelData.meals.filter { meals in
            meals.name == filterText
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Showing \(filteredMeals.count) \(filteredMeals.count > 1 ? "meals" : "meal" )")
                    .font(.headline)
                    .fontWeight(.medium)
                .opacity(0.7)
                Spacer()
            }
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                ForEach(filteredMeals) { meals in
                    Text(meals.name)
                }
            }
            .padding(.top)
        }
        .padding(.horizontal)
    }
}

struct SearchGridList_Previews: PreviewProvider {
    static var previews: some View {
        SearchGridList()
            .environmentObject(ModelData())
    }
}
