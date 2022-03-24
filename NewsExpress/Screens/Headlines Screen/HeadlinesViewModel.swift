//
//  HeadlinesViewModel.swift
//  NewsExpress
//
//  Created by Sergey Petrosyan on 24.03.22.
//

import UIKit

protocol HeadlinesViewModelDelegate {
    var numberOfRows: Int { get }
    func configure(_ cell: HeadlineTableViewCell, at indexPath: IndexPath)
}

class HeadlinesViewModel: HeadlinesViewModelDelegate {
    
    // MARK: - Private properties
    
    private let articles: [Article]
    
    // MARK: Public properties
    
    var numberOfRows: Int {
        articles.count
    }
    
    // MARK: - Initialization
    
    init(with articles: [Article]) {
        self.articles = articles
    }
    
    // MARK: - Private methods
    
    private func assignImage(from url: String, to cell: HeadlineTableViewCell) {
        cell.activityIndicator.startAnimating()
        guard let url = URL(string: url) else { return }
        DispatchQueue.global(qos: .userInitiated).async {
            let urlContents = try? Data(contentsOf: url)
            DispatchQueue.main.async {
                if let imageData = urlContents {
                    cell.iconImageView.image = UIImage(data: imageData)
                    cell.activityIndicator.stopAnimating()
                }
            }
        }
    }
    
    // MARK: - Public methods
    
    func configure(_ cell: HeadlineTableViewCell, at indexPath: IndexPath) {
        let article = articles[indexPath.row]
        assignImage(from: article.urlToImage, to: cell)
        cell.titleLabel.text = article.title
        cell.descriptionLabel.text = article.description
        cell.dateLabel.text = article.publishedAt.components(separatedBy: "T").first
    }
}
