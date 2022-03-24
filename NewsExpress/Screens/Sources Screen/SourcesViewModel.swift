//
//  SourcesViewModel.swift
//  NewsExpress
//
//  Created by Sergey Petrosyan on 23.03.22.
//

import Foundation

protocol SourceViewModelDelegate {
    var numberOfRows: Int { get }
    func getSources()
    func nameOfSource(at index: Int) -> String
    func descriptionOfSource(at index: Int) -> String
    func getHeadlinesForSource(at index: Int, completion: @escaping (HeadlinesViewModel) -> Void)
}

class SourcesViewModel: SourceViewModelDelegate {
    
    // MARK: Private properties
    
    private var sources = [Source]() {
        didSet {
            NotificationCenter.default.post(Notification(name: Notification.Name(NCKeys.sourcesHaveBeenUpdated.rawValue), object: nil))
        }
    }
    
    // MARK: Public properties
    
    var numberOfRows: Int {
        sources.count
    }
    
    // MARK: - Public methods
    
    func getSources() {
        NewsAPIInteractor.shared.getSources(from: NewsAPIRequestPath.sources.fullPath()) { [weak self] result in
            switch result {
            case .success(let response):
                if let sourceResponse = response {
                    self?.sources = sourceResponse.sources
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getHeadlinesForSource(at index: Int, completion: @escaping (HeadlinesViewModel) -> Void) {
        NewsAPIInteractor.shared.getHeadlines(from: NewsAPIRequestPath.headlines.fullPath(), for: nameOfSource(at: index)) { result in
            switch result {
            case .success(let response):
                if let headlinesResponse = response {
                    completion(HeadlinesViewModel(with: headlinesResponse.articles))
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func nameOfSource(at index: Int) -> String {
        sources[index].name
    }
    
    func descriptionOfSource(at index: Int) -> String {
        sources[index].description
    }
}
