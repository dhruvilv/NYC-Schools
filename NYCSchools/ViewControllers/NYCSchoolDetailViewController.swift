//
//  NYCSchoolDetailViewController.swift
//  NYCSchools
//
//  Created by Dhruvil Vyas on 2/7/23.
//

import UIKit

class NYCSchoolDetailViewController: UITableViewController, LoadingView {
  
  let viewModel: NYCSchoolDetailViewModel
    
  var formattedAddress: String {
    return "\(viewModel.schoolInfo.addressLine1)\n\(viewModel.schoolInfo.city), \(viewModel.schoolInfo.stateCode) \(viewModel.schoolInfo.zip)"
  }
  
  // MARK: - UI
  
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
  
  override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let headerView = TableHeaderView()
    headerView.configure(text: viewModel.sections[section])
    return headerView
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return viewModel.sections.count
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return UITableViewCell()
  }
}
