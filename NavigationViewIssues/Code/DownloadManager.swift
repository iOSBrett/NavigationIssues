import Foundation
import Combine

struct DownloadItem {
    var cachedItemURL : URL?
    let filename : String
}

/// Simple Download Manager (which also caches)
///
class DownloadManager : ObservableObject
{
    @Published var downloadedItems = [String:DownloadItem]()
    
    func download(itemAtUrl urlString: String, trackProgress: Bool = false) {
     
        guard let filename = URL(string: urlString)?.lastPathComponent else {
            return
        }

        // If we have cached this item already then return it
        let cacheURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
        let cachedItemURL = cacheURL.appendingPathComponent(filename)
        
        let session = URLSession.shared
                
        let url = URL(string: urlString)!
        session.dataTask(with: url, completionHandler: { (data, response, error) in
            
            if let data = data {
                try? data.write(to: cachedItemURL, options: .completeFileProtection)
                
                DispatchQueue.main.async {
                    self.downloadedItems[urlString]?.cachedItemURL = cachedItemURL
                }
            }
        })
        .resume()
    }
}

