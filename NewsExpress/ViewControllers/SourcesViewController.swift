//
//  ViewController.swift
//  NewsExpress
//
//  Created by Sergey Petrosyan on 23.03.22.
//

import UIKit

class SourcesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        NewsAPIInteractor.shared.getSources(from: NewsAPIRequestPath.sources.fullPath()) { result in
            print(result)
        }
    }

}

