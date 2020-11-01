import SwiftUI

@main
struct NavigationViewIssuesApp: App {
    
    @StateObject private var downloadManager = DownloadManager()
    @StateObject private var globalUISettings = GlobalUISettings()
    @StateObject private var tabBarModel = TabBarModel()
    
        
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(globalUISettings)
                .environmentObject(tabBarModel)
                .environmentObject(downloadManager)
        }
    }
}
