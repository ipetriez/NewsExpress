//
//  NewsDetailsViewController.swift
//  NewsExpress
//
//  Created by Sergey Petrosyan on 24.03.22.
//

import UIKit

class NewsDetailsViewController: UIViewController {
    
    // MARK: - Constants
    
    struct Constants {
        static let standardOffset: CGFloat = 8
        static let standardInset: CGFloat = -8
        static let imageHeight: CGFloat = 160
    }
    
    // MARK: - Views
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        viewModel.getImage(completion: { image in
            imageView.image = image
        })
        return imageView
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .footnote)
        label.text = viewModel.dateOfArticle
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        label.text = viewModel.descriptionOfArticle
        return label
    }()
    
    lazy var linkLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .footnote)
        label.numberOfLines = 0
        label.textColor = .link
        label.isUserInteractionEnabled = true
        label.text = viewModel.linkForArticle
        return label
    }()
    
    // MARK: - Private properties
    
    private let viewModel: NewsDetailsViewModelDelegate
    
    // MARK: - Initialization
    
    init(viewModel: NewsDetailsViewModelDelegate) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        linkLabel.addGestureRecognizer((UITapGestureRecognizer(target: self, action: #selector(handleTapOnLabel(_:)))))
    }
    
    // MARK: - Private methods
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(imageView)
        view.addSubview(dateLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(linkLabel)
        
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.standardOffset).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.standardInset).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: Constants.imageHeight).isActive = true
        
        dateLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Constants.standardOffset).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.standardOffset).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.standardInset).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: Constants.standardOffset).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.standardOffset).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.standardInset).isActive = true
        
        linkLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Constants.standardOffset).isActive = true
        linkLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.standardOffset).isActive = true
        linkLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.standardInset).isActive = true
    }
    
    // MARK: - Actions
    
    @objc func handleTapOnLabel(_ recognizer: UITapGestureRecognizer) {
        guard let string = linkLabel.text else { return }
        if let url = URL(string: string) {
            UIApplication.shared.openURL(url)
        }
    }
}
