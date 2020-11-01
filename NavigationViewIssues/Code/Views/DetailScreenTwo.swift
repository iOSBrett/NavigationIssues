import SwiftUI

struct DetailScreenTwo : View {

    @EnvironmentObject var downloadManager : DownloadManager

    var body: some View {

        ZStack {
            Color.orange
                .edgesIgnoringSafeArea(.all)
        }
        .onAppear() {
            downloadManager.download(itemAtUrl: "https://twitter.com/catsynthspace/status/971039568962244608/photo/1")
        }
    }
}
