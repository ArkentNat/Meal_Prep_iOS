//
//  Meal.swift
//  MobileProgFinalProject
//
//  Created by Arkent Nathanael on 22/11/22.
//

import Foundation
import SwiftUI

struct Meal: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var description: String
    var ingredients: String
    var directions: String
    var datePublished: String
    var url: String
    
    var imageName: String
    var image: Image {
        Image(imageName)
    }

    var category: Category
    enum Category: String, CaseIterable, Codable {
        case breakfast = "Breakfast"
        case lunch = "Lunch"
        case dinner = "Dinner"
    }

    var availableOn: Day
    enum Day: String, CaseIterable, Codable {
        case monday = "Monday"
        case tuesday = "Tuesday"
        case wednesday = "Wednesday"
        case thursday = "Thursday"
        case friday = "Friday"
    }
    


}
