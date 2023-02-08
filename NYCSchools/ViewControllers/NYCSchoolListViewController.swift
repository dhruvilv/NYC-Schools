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
    // Do any additional setup after loading the view.
    view.backgroundColor = .systemGray
    listViewModel.statusDidChange = { [weak self] status in
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
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 88
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

