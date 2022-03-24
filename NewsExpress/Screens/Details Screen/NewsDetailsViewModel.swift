//
//  NewsDetailsViewModel.swift
//  NewsExpress
//
//  Created by Sergey Petrosyan on 24.03.22.
//

import UIKit

protocol NewsDetailsViewModelDelegate {
    var dateOfArticle: String? { get }
    var descriptionOfArticle: String { get }
    var linkForArticle: String { get }
    func getImage(completion: @escaping (UIImage) -> Void)
}

class NewsDetailsViewModel: NewsDetailsViewModelDelegate {
    
    // MARK: - Private properties
    
    private let article: Article
    
    // MARK: - Public properties
    
    var dateOfArticle: String? {
        article.publishedAt.components(separatedBy: "T").first
    }
    
    var descriptionOfArticle: String {
        article.description
    }
    
    var linkForArticle: String {
        article.url
    }
    
    // MARK: - Initialization
    
    init(with article: Article) {
        self.article = article
    }
    
    // MARK: - Public methods
    
    func getImage(completion: @escaping (UIImage) -> Void) {
        guard let url = URL(string: article.urlToImage) else { return }
        DispatchQueue.global(qos: .userInitiated).async {
            let urlContents = try? Data(contentsOf: url)
            DispatchQueue.main.async {
                if let imageData = urlContents, let image = UIImage(data: imageData) {
                    completion(image)
                }
            }
        }
    }
}
