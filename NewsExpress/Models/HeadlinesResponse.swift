//
//  HeadlinesResponse.swift
//  NewsExpress
//
//  Created by Sergey Petrosyan on 24.03.22.
//

import Foundation

struct HeadlinesResponse: Codable {
    let status: String
    let totalResults: Int?
    let articles: [Article]
}

struct Article: Codable {
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}
