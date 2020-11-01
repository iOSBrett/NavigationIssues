import SwiftUI
import Combine

struct DetailScreenOne : View {
    
    @Environment(\.presentationMode) var presentation
    
    @EnvironmentObject var globalUISettings : GlobalUISettings
    
    @State private var showDetailScreenTwo = false
    
    var body: some View {
        
        ZStack {
            
            Color.green
                .edgesIgnoringSafeArea(.all)
            
            NavigationLink(destination:DetailScreenTwo(),
                           isActive: self.$showDetailScreenTwo) { EmptyView() }
                .isDetailLink(false)
            
            VStack(spacing: 16.0) {
                
                Button(action: {
                    withAnimation() { self.showDetailScreenTwo = true }
                }, label: {
                    Text("Show Detail Screen Two")
                })
                
                Button(action: {
                    presentation.wrappedValue.dismiss()
                }, label: {
                    Text("Go back to home")
                })
            }
            .frame(maxWidth: .infinity)
            .navigationBarTitle("Detail Screen One", displayMode: .inline)
        }
        .onChange(of: showDetailScreenTwo) { show in
            print("showDetailScreenTwo:\(showDetailScreenTwo)")
        }
    }
}
