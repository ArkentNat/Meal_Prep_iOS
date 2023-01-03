//
//  HomeCategoryColumn.swift
//  MobileProgFinalProject
//
//  Created by Arkent Nathanael on 22/11/22.
//

import SwiftUI

struct HomeCategoryColumn: View {

    var items: [Meal]
    
    var breakfast: [Meal] {
        return items.filter{$0.category == Meal.Category.breakfast}
    }
    var lunch: [Meal] {
        return items.filter{$0.category == Meal.Category.lunch}
    }
    var dinner: [Meal] {
        return items.filter{$0.category == Meal.Category.dinner}
    }
    
    @EnvironmentObject var modelData : ModelData

    var body: some View {
        List {
            ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                Section {
                    HomeCategoryRow(categoryName: key, items:
                                        key == "Breakfast" ? breakfast :
                                        key == "Lunch" ? lunch :
                                        key == "Dinner" ? dinner :
                                        breakfast
                    )
                }
            }
            .listRowInsets(EdgeInsets())
            
        }

    }
}

struct HomeCategoryColumn_Previews: PreviewProvider {
    static var meals = ModelData().meals

    static var previews: some View {
        HomeCategoryColumn(
            items: Array(meals.prefix(2))
        ).environmentObject(ModelData())
    }
}
