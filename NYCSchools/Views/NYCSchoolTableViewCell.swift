//
//  NYCSchoolTableViewCell.swift
//  NYCSchools
//
//  Created by Dhruvil Vyas on 2/7/23.
//

import UIKit

class NYCSchoolTableViewCell: UITableViewCell {
  
  var viewModel: NYCSchoolViewModel? {
    didSet {
      databaseNumberLabel.text = viewModel?.databaseNumber
      schoolNameLabel.text = viewModel?.schoolName
    }
  }
  
  let containerView: UIView = {
    let view = UIView()
    view.backgroundColor = .systemGray5
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  let schoolNameLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    label.font = UIFont.preferredFont(forTextStyle: .headline)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
 }()

 let databaseNumberLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.preferredFont(forTextStyle: .callout)
    label.textAlignment = .right
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
 }()
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    contentView.addSubview(containerView)
    containerView.addSubview(schoolNameLabel)
    containerView.addSubview(databaseNumberLabel)

    setupConstraints()
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      // Setup Container View
      containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
      containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
      containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
      containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
      
      // Setup schoolNameLabel
      schoolNameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 4),
      schoolNameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 4),
      
      // Setup DatabaseNumberLabel
      databaseNumberLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -4),
      databaseNumberLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 4),
    ])
    containerView.layer.cornerRadius = 8
  }
  
}
