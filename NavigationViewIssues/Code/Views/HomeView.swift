import SwiftUI
import MessageUI
import SafariServices

enum HomeDetailScreen : Int {
    case popToRoot = 0
    case showDetailScreenOne
}

class DetailScreenSelection : ObservableObject {
    @Published var screen : HomeDetailScreen?
}

struct HomeView: View {
    
    @EnvironmentObject var globalUISettings : GlobalUISettings
    @EnvironmentObject var downloadManager : DownloadManager   // <- Remove this and everything behaves
        
    @StateObject private var detailScreenSelection = DetailScreenSelection() // <- This is what gets reset
    
    var body: some View {
        
        return ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            NavigationLink(destination: DetailScreenOne(),
                           tag: HomeDetailScreen.showDetailScreenOne,
                           selection: $detailScreenSelection.screen) {
                EmptyView()
            }
            .hidden()
            
            VStack(spacing: 0.0) {
                
                Button(action: {
                    withAnimation() { detailScreenSelection.screen = .showDetailScreenOne }
                }) {
                    Text("Show Detail Screen One")
                        .font(.headline)
                        .padding()
                        .background(Color.gray)
                }
            }
            .navigationBarTitle("Home View", displayMode: .inline)
            .navigationBarHidden(false)
            .onChange(of: detailScreenSelection.screen) { screen in
                print("showScreen: \(String(describing: screen))")
            }
        }
    }
}

