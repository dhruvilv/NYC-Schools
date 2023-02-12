//
//  NYCSchoolListViewController.swift
//  NYCSchools
//
//  Created by Dhruvil Vyas on 2/7/23.
//

import UIKit

class NYCSchoolListViewController: UITableViewController {
  
  let listViewModel: NYCSchoolListViewModel
  
  init(viewModel: NYCSchoolListViewModel) {
    self.listViewModel = viewModel
    super.init(nibName: nil, bundle: nil)
    setupTableView()
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // We can localize strings like this to support multiple languages.
    title = "NYC School List"
    listViewModel.status.subscribe { [weak self] status in
      switch status {
      case .loaded:
        // Show data
        self?.tableView.reloadData()
      default:
        // Error Scenario
      break
      }
    }
  }
  
  func setupTableView() {
    tableView.register(
      NYCSchoolTableViewCell.self,
      forCellReuseIdentifier: NYCSchoolTableViewCell.reuseIdentifier
    )    
    tableView.separatorStyle = .none
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 80.0
    tableView.contentInset = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)

  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    listViewModel.didTapSchool(at: indexPath.row)
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80.0
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return listViewModel.schools?.count ?? 0
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeue(for: indexPath) as NYCSchoolTableViewCell
    cell.viewModel = listViewModel.schools?[indexPath.row]
    return cell
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
}

