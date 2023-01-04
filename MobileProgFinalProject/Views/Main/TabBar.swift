//
//  TabBar.swift
//  Meal_Prep_iOS
//
//  Created by Arkent Nathanael on 10/11/22.
//

import SwiftUI

struct TabBar: View {
    @ObservedObject var viewRouter = ViewRouter()
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                switch viewRouter.currentPage  {
                case .home:
                    HomeView()
                case .search:
                    SearchView()
                case .favorite:
                    FavoriteView()
                case .profile:
                    ProfileView()
                }
                Spacer()
                HStack {
                    TabBarIcon(
                        viewRouter: viewRouter,
                        assignedPage: .home,
                        width: geometry.size.width/5,
                        height: geometry.size.height/25,
                        systemIconName: "house",
                        tabName: "Home")
                    TabBarIcon(
                        viewRouter: viewRouter,
                        assignedPage: .search,
                        width: geometry.size.width/5,
                        height: geometry.size.height/25,
                        systemIconName: "magnifyingglass",
                        tabName: "Search")
                    TabBarIcon(
                        viewRouter: viewRouter,
                        assignedPage: .favorite,
                        width: geometry.size.width/5,
                        height: geometry.size.height/25,
                        systemIconName: "heart",
                        tabName: "Favorites")
                    TabBarIcon(
                        viewRouter: viewRouter,
                        assignedPage: .profile,
                        width: geometry.size.width/5,
                        height: geometry.size.height/25,
                        systemIconName: "person.circle",
                        tabName: "Profile")
                }
                .frame(width: geometry.size.width, height: geometry.size.height/9)
                .background(Color.white).shadow(radius: 2)
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
        
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .environmentObject(ModelData())
    }
}

struct  TabBarIcon: View {
    @StateObject var viewRouter: ViewRouter
    let assignedPage: Page
    let width, height: CGFloat
    let systemIconName, tabName: String
    
    var body: some View {
        VStack {
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top, 20)
            Text(tabName)
                .font(.footnote)
            Spacer()
        }
        .padding(.horizontal, 1)
        .onTapGesture {
            viewRouter.currentPage = assignedPage
        }
        .foregroundColor(viewRouter.currentPage == assignedPage ? Color("Primary") : .gray)
    }
}
