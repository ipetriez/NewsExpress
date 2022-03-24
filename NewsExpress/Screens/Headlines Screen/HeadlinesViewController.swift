//
//  HeadlinesViewController.swift
//  NewsExpress
//
//  Created by Sergey Petrosyan on 24.03.22.
//

import UIKit

class HeadlinesViewController: UITableViewController {
    
    // MARK: - Private properties
    
    private let viewModel: HeadlinesViewModelDelegate
    
    // MARK: - Initialization
    
    init(viewModel: HeadlinesViewModelDelegate) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(HeadlineTableViewCell.self, forCellReuseIdentifier: HeadlineTableViewCell.reuseIdentifier)
    }
    
    // MARK: - Private methods

    // MARK: - UITableViewDelegate methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HeadlineTableViewCell.reuseIdentifier, for: indexPath) as? HeadlineTableViewCell else { return UITableViewCell() }
        viewModel.configure(cell, at: indexPath)
        return cell
    }
}
