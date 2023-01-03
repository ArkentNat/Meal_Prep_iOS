//
//  ContentView.swift
//  MobileProgFinalProject
//
//  Created by Arkent Nathanael on 22/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandingPage()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewRouter())
            .environmentObject(ModelData())
    }
}
