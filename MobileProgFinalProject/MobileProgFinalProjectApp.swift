//
//  MobileProgFinalProjectApp.swift
//  MobileProgFinalProject
//
//  Created by Arkent Nathanael on 22/11/22.
//

import SwiftUI

@main
struct MobileProgFinalProjectApp: App {
    @StateObject var viewRouter = ViewRouter()
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewRouter)
                .environmentObject(modelData)
        }
    }
}
