//
//  ViewRouter.swift
//  MobileProgFinalProject
//
//  Created by Arkent Nathanael on 22/11/22.
//

import Foundation
import SwiftUI

class ViewRouter : ObservableObject {
    @Published var currentPage: Page = .home
}

enum Page {
    case home
    case search
    case favorite
    case profile
}


