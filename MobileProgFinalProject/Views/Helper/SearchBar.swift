//
//  SearchBar.swift
//  MobileProgFinalProject
//
//  Created by Arkent Nathanael on 04/01/23.
//

import SwiftUI

struct SearchBar: View {
    @State var searchText: String = ""
    var body: some View {
        HStack {
                Image(systemName: "magnifyingglass").foregroundColor(Color("Secondary"))
                TextField("Search", text: $searchText)
                    .font(Font.system(size: 21))
                    .autocapitalization(.none)
            }
            .padding(7)
            .background(Color("Ternary"))
            .cornerRadius(50)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
