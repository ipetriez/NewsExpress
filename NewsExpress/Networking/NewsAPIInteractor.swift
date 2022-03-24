//
//  NewsAPIInteractor.swift
//  NewsExpress
//
//  Created by Sergey Petrosyan on 23.03.22.
//

import Foundation


// MARK: - Enum for building full paths for each request

enum NewsAPIRequestPath: String {
    
    case sources = "/v2/top-headlines/sources?"
    case headlines = "/v2/top-headlines?sources=*&"
    
    private var baseURL: String {
        "https://newsapi.org/"
    }
    
    private var apiKey: String {
        "apiKey=171748af94644eff83e028a74407ab1a"
    }
    
    func fullPath() -> String {
        baseURL + self.rawValue + apiKey
    }
}

class NewsAPIInteractor {
    
    // MARK: - Singleton
    
    static let shared = NewsAPIInteractor()
    
    // MARK: Private properties
    
    private let networkService: Networking
    
    // MARK: - Initialization
    
    init(networkService: Networking = NetworkService()) {
        self.networkService = networkService
    }
    
    // MARK: - Public methods
    
    func getSources(from path: String, completion: @escaping (Result<SourcesResponse?, Error>) -> Void) {
        guard let url = URL(string: path) else { return }
        networkService.request(from: url, completion: completion)
    }
    
    func getHeadlines(from path: String, for source: String, completion: @escaping (Result<HeadlinesResponse?, Error>) -> Void) {
        guard let url = URL(string: path.replacingOccurrences(of: "*", with: source)) else { return }
        networkService.request(from: url, completion: completion)
    }
}


