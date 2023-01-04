//
//  LandingPageBannerView.swift
//  MobileProgFinalProject
//
//  Created by Arkent Nathanael on 04/01/23.
//

import SwiftUI




enum BannerContentType: CaseIterable, Identifiable {
    case first
    case second
    case third
    
    var id: Self { self }
    
    @ViewBuilder
    func getView() -> some View {
        switch self {
        case .first:
            Text("1️⃣")
        case .second:
            ZStack {
                Color.green
                Text("2️⃣")
            }
        case .third:
            ZStack {
                Color.orange
                Text("3️⃣")
            }
        }
    }
}

//class PagingBannerViewModel: ObservableObject {
//    @Published var bannerType: BannerContentType = .first
//    
//    private var cancellables = Set<AnyCancellable>()
//    
//    init() {
//        Timer.publish(every: 2, on: .main, in: .default)
//            .autoconnect()
//            .receive(on: DispatchQueue.main)
//            .sink { [weak self] _ in
//                guard let self = self else { return }
//                self.bannerType = self.bannerType.next()
//            }
//            .store(in: &cancellables)
//    }
// 
//    // Here
//    func onChangeBanner(to type: BannerContentType) {
//        let all = BannerContentType.allCases
//        guard let index = all.firstIndex(of: type),
//              let currentIndex = all.firstIndex(of: bannerType) else {
//                  return
//              }
//        
//        if currentIndex != index {
//            bannerType = type
//        }
//    }
//}

struct LandingPageBannerView: View {
    
    @State var selectedItem: BannerContentType = .first
    //@StateObject var vm = PagingBannerViewModel()
    
    var body: some View {
        Text("hello")
//        TabView(selection: $selectedItem) {
//            ForEach(BannerContentType.allCases) {
//                $0
//                    .getView()
//                    .tag($0)
//            }
//        }
//        .tabViewStyle(PageTabViewStyle())
//        .background(Color.black)
//        .frame(height: 200)
//        .onReceive(vm.$bannerType) { banner in
//            withAnimation {
//                selectedItem = banner
//            }
//        }
    }
}

struct LandingPageBannerView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageBannerView()
    }
}

extension CaseIterable where Self: Equatable {
    func next() -> Self {
        let all = Self.allCases
        let idx = all.firstIndex(of: self)!
        let next = all.index(after: idx)
        return all[next == all.endIndex ? all.startIndex : next]
    }
}
