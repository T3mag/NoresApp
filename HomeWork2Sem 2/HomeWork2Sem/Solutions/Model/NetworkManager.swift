import Foundation

struct YouTubeResponse: Codable, Hashable {
    struct PageInfo: Codable, Hashable {
        let totalResults: Int
        let resultsPerPage: Int
    }
    struct Video: Codable, Hashable {
        struct ID: Codable, Hashable {
            let kind: String
            let videoID: String
        }
        let kind: String
        let etag: String
        let iD: ID
    }
    let kind: String
    let etag: String
    let nextPageToken: String
    let regionCode: String
    let pageInfo: PageInfo
    let videos: [Video]
}

class NetworkManager {
    private let session: URLSession
    private let apiKey = "AIzaSyDprjxV0rFg0OMwkn4TpSfijbV9GBeHa-c"
    
    init(with configuration: URLSessionConfiguration) {
        session = URLSession(configuration: configuration)
    }
    
    func obtainVideoByString(userRequestString: String) async -> [YouTubeResponse] {
        
        let url = URL(
            string:"https://youtube.googleapis.com/youtube/v3/search?part=snippet&maxResults=100&q=" + userRequestString + "&key=" + apiKey)
        
        let urlRequset = URLRequest(url: URL(string: "https://www.googleapis.com/youtube/v3/search")!)
        return []
    }
}
