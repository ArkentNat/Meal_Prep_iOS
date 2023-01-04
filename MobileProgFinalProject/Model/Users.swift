//
//  Users.swift
//  MobileProgFinalProject
//
//  Created by Arkent Nathanael on 03/01/23.
//

import Foundation
import SwiftUI

struct Users: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var username: String
    var email: String
    var address: Address
    var phone: String
    var website: String
}

struct Address: Hashable, Codable {
    var street: String
    var suite: String
    var city: String
    var zipcode: String
}
