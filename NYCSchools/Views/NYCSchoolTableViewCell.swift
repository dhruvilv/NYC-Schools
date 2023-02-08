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

  let schoolNameLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
 }()

 let databaseNumberLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 16)
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

    contentView.addSubview(schoolNameLabel)
    contentView.addSubview(databaseNumberLabel)

    NSLayoutConstraint.activate([
       schoolNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
       schoolNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
       databaseNumberLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
       databaseNumberLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
       schoolNameLabel.trailingAnchor.constraint(lessThanOrEqualTo: databaseNumberLabel.leadingAnchor, constant: -16)
    ])
    contentView.layer.cornerRadius = 8
    contentView.layer.borderWidth = 1
    contentView.layer.borderColor = UIColor.lightGray.cgColor

    contentView.layer.shadowColor = UIColor.black.cgColor
    contentView.layer.shadowOpacity = 0.1
    contentView.layer.shadowOffset = CGSize(width: 0, height: 1)
    contentView.layer.shadowRadius = 4
  }
  
  
}
