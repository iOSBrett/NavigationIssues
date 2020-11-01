import SwiftUI

struct ContentView: View {

    @EnvironmentObject var globalUISettings: GlobalUISettings
    
    var body: some View {
        
        ZStack {
            GeometryReader { screenGeometry in
                
                MainTabView()
                    .statusBar(hidden: self.globalUISettings.statusBarHidden) // Not working in VideoPlayer, so moved here
                    .onAppear() {
                        self.globalUISettings.safeAreaInsets = screenGeometry.safeAreaInsets
                        self.globalUISettings.mainViewSize = screenGeometry.size
                    }
            }
        }
    }
}
    

