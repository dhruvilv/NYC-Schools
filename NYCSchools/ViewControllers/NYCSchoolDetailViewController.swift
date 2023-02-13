//
//  NYCSchoolDetailViewController.swift
//  NYCSchools
//
//  Created by Dhruvil Vyas on 2/7/23.
//

import UIKit

class NYCSchoolDetailViewController: UITableViewController, LoadingView {
  
  let viewModel: NYCSchoolDetailViewModel
  
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
    viewModel.status.subscribe { [weak self] status in
      switch status {
      case .loading:
        // Do nothing
        break
      case .loaded:
        self?.tableView.reloadData()
        self?.stopAnimating()
      case .error:
        //TODO: Show Error
      break
      }
    }
    setupViews()
    startAnimating()
  }
  
  func setupViews() {
    setupTableView()
    view.addSubview(spinner)
    NSLayoutConstraint.activate([
      spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }
  
  func setupTableView() {
    tableView.separatorStyle = .none
    tableView.register(
      NYCSchoolDetailAddressViewCell.self,
      forCellReuseIdentifier: NYCSchoolDetailAddressViewCell.reuseIdentifier
    )
    tableView.register(
      NYCSchoolDetailSingleLineCell.self,
      forCellReuseIdentifier: NYCSchoolDetailSingleLineCell.reuseIdentifier
    )
    tableView.register(
      NYCSchoolDetailSATScoresViewCell.self,
      forCellReuseIdentifier: NYCSchoolDetailSATScoresViewCell.reuseIdentifier
    )
    tableView.register(
      NYCSchoolDetailSchoolInfoCell.self,
      forCellReuseIdentifier: NYCSchoolDetailSchoolInfoCell.reuseIdentifier
    )
  }
  
  override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    if section == 0 { return UIView() }
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
    switch indexPath.section {
    case 0:
      let cell = tableView.dequeue(for: indexPath) as NYCSchoolDetailSchoolInfoCell
      cell.configure(name: viewModel.schoolName, id: viewModel.schoolInfo.databaseNumber)
      return cell
    case 1:
      let cell = tableView.dequeue(for: indexPath) as NYCSchoolDetailAddressViewCell
      cell.configure(address: viewModel.formattedAddress)
      return cell
    case 2:
      let cell = tableView.dequeue(for: indexPath) as NYCSchoolDetailSingleLineCell
      cell.configure(text: viewModel.phoneNumber)
      return cell
    case 3:
      let cell = tableView.dequeue(for: indexPath) as NYCSchoolDetailSingleLineCell
      cell.configure(text: viewModel.website)
      return cell
    case 4:
      let cell = tableView.dequeue(for: indexPath) as NYCSchoolDetailSATScoresViewCell
      cell.configure(
        criticalReadingScore: viewModel.satScoreInfo?.avgCriticalReadingScore ?? "N/A",
        mathScore: viewModel.satScoreInfo?.avgMathScore ?? "N/A",
        writingScore: viewModel.satScoreInfo?.avgWritingScore ?? "N/A",
        testTakerCount: viewModel.satScoreInfo?.testTakerCount ?? "N/A"
      )
      return cell
    default:
      break
    }
    return UITableViewCell()
  }
}
