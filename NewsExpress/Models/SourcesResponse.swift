//
//  SourcesResponse.swift
//  NewsExpress
//
//  Created by Sergey Petrosyan on 23.03.22.
//

import Foundation

struct SourcesResponse: Codable {
    let status: String
    let sources: [Sources]
}

struct Sources: Codable {
    let id: String
    let name: String
    let description: String
    let url: String
    let category: String
    let language: String
    let country: String
}
