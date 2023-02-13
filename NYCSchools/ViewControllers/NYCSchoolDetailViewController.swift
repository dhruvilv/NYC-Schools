//
//  NYCSchoolDetailViewController.swift
//  NYCSchools
//
//  Created by Dhruvil Vyas on 2/7/23.
//

import UIKit

class NYCSchoolDetailViewController: UIViewController, LoadingView {
  
  let viewModel: NYCSchoolDetailViewModel
  
  // MARK: - UI Controls
  
  var spinner: UIActivityIndicatorView = {
    let spinner = UIActivityIndicatorView(style: .large)
    spinner.translatesAutoresizingMaskIntoConstraints = false
    return spinner
  }()
  
  // MARK: - Initialization
  
  init(viewModel: NYCSchoolDetailViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // NOTE: For multiple language support, we could localize
    // the text throughout the app
    title = "School Details"
    view.backgroundColor = .systemGreen
    setupViews()
    startAnimating()
  }
  
  func setupViews() {
    view.addSubview(spinner)
    NSLayoutConstraint.activate([
      spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }
}

extension NYCSchoolDetailViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    UITableViewCell()
  }
}

extension NYCSchoolDetailViewController: UITableViewDelegate {
  
}
