//
//  HomeView.swift
//  Meal_Prep_iOS
//
//  Created by Arkent Nathanael on 10/11/22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var modelData : ModelData
    
    var body: some View {
        HomeCategory()
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .ignoresSafeArea()
    }
}

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeView()
            .environmentObject(ModelData())
    }
}
