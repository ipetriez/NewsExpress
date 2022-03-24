//
//  HeadlineTableViewCell.swift
//  NewsExpress
//
//  Created by Sergey Petrosyan on 24.03.22.
//

import UIKit

class HeadlineTableViewCell: UITableViewCell {
    
    static var reuseIdentifier: String { String(describing: self) }
    
    // MARK: - Constants
    
    struct Constants {
        static let standardOffset: CGFloat = 8
        static let standardInset: CGFloat = -8
        static let imageHeight: CGFloat = 120
    }
    
    // MARK: -  Views
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let acView = UIActivityIndicatorView(style: .medium)
        acView.translatesAutoresizingMaskIntoConstraints = false
        return acView
    }()
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .headline)
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .body)
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .footnote)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        contentView.addSubview(activityIndicator)
        contentView.addSubview(iconImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(dateLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        activityIndicator.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: iconImageView.centerXAnchor).isActive = true
        
        iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.standardOffset).isActive = true
        iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.standardOffset).isActive = true
        iconImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.standardInset).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: Constants.imageHeight).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: Constants.standardOffset).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.standardOffset).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.standardInset).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.standardOffset).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.standardOffset).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.standardInset).isActive = true
        
        dateLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Constants.standardOffset).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.standardOffset).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.standardInset).isActive = true
        dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Constants.standardInset).isActive = true
    }
}
