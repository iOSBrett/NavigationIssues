import SwiftUI

final class GlobalUISettings: ObservableObject {
    
    @Published var safeAreaInsets = EdgeInsets()
    @Published var statusBarHidden = false
    @Published var mainViewSize : CGSize = UIScreen.main.bounds.size {
        didSet {
            print("mainViewSize: \(mainViewSize)")
        }
    }
}

