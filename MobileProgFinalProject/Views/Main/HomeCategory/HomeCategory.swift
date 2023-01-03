//
//  HomeCategory.swift
//  MobileProgFinalProject
//
//  Created by Arkent Nathanael on 22/11/22.
//

import SwiftUI

struct HomeCategory: View {
    @State private var selectedTab: Int = 0
    let tabs: [Tab] = [
        .init(title: "MON"),
        .init(title: "TUE"),
        .init(title: "WED"),
        .init(title: "THU"),
        .init(title: "FRI"),
    ]
    @EnvironmentObject var modelData : ModelData
    
    var monday: [Meal] {
        return modelData.meals.filter{$0.availableOn == Meal.Day.monday}
    }
    var tuesday: [Meal] {
        return modelData.meals.filter{$0.availableOn == Meal.Day.tuesday}
    }
    var wednesday: [Meal] {
        return modelData.meals.filter{$0.availableOn == Meal.Day.wednesday}
    }
    var thursday: [Meal] {
        return modelData.meals.filter{$0.availableOn == Meal.Day.thursday}
    }
    var friday: [Meal] {
        return modelData.meals.filter{$0.availableOn == Meal.Day.friday}
    }
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                VStack(spacing: 0) {
                    // Tabs
                    Tabs(tabs: tabs, geoWidth: geo.size.width, selectedTab: $selectedTab)
                    // Views
                    TabView(selection: $selectedTab,
                            content: {
                                HomeCategoryColumn(items:
                                                    selectedTab == 0 ? monday :
                                                    selectedTab == 1 ? tuesday:
                                                    selectedTab == 2 ? wednesday:
                                                    selectedTab == 3 ? thursday:
                                                    selectedTab == 4 ? friday:
                                                    friday
                                )
                    })
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                }
                .navigationBarHidden(true)
                
            }
        }
    }
}

struct HomeCategory_Previews: PreviewProvider {
    static var previews: some View {
        HomeCategory()
            .environmentObject(ModelData())
    }
}
