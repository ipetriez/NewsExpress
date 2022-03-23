//
//  ViewController.swift
//  NewsExpress
//
//  Created by Sergey Petrosyan on 23.03.22.
//

import UIKit

class SourcesViewController: UITableViewController {
    
    // MARK: - Private properties:
    
    private var viewModel: SourceViewModelDelegate = SourcesViewModel()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subscribeForNotifications()
        viewModel.getSources()
        setupNavBar()
        configureTableView()
    }
    
    // MARK: - Private methods
    
    private func setupNavBar() {
        title = "CHOOSE A NEWS PUBLISHER"
    }
    
    private func configureTableView() {
        tableView.rowHeight = 50
        tableView.backgroundColor = .secondarySystemBackground
    }
    
    private func subscribeForNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateSelf), name: Notification.Name(NCKeys.sourcesHaveBeenUpdated.rawValue), object: nil)
    }
    
    // MARK: - Actions
    
    @objc private func updateSelf() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    // MARK: - UITableViewDelegate methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - UITableViewDataSource methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = viewModel.nameOfSource(at: indexPath.row)
        cell.detailTextLabel?.text = viewModel.descriptionOfSource(at: indexPath.row)
        return cell
    }
}

