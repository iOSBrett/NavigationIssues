import SwiftUI

class TabBarModel : ObservableObject {
    
    enum Item : CaseIterable {
        case home
    }

    @Published var selectedItem : Item = .home
    @Published var items = [TabBarModel.Item.home]
}

struct MainTabView : View {
    
    @EnvironmentObject var tabBarModel : TabBarModel
    @EnvironmentObject var globalUISettings : GlobalUISettings
            
    @State private var didEnterBackground = true
    
    var body: some View {
        
        let maxWidth : CGFloat = 600.0
        let horizontalPadding = globalUISettings.mainViewSize.width - maxWidth > 0.0 ? (globalUISettings.mainViewSize.width - maxWidth)/2.0 : 16.0
        
        return ZStack {
            
            VStack(spacing: 0.0) {
                
                ZStack {
                    Color(.white)
                    
                    NavigationView {
                        HomeView()
                    }
                    .zIndex(tabBarModel.selectedItem == .home ? 1 : 0)
                    .opacity(tabBarModel.selectedItem == .home ? 1.0 : 0.0)                    
                }
                .padding(.horizontal, horizontalPadding)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

