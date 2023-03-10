//
//  NYCSchoolDetailSchoolInfoCell.swift
//  NYCSchools
//
//  Created by Dhruvil Vyas on 2/13/23.
//

import UIKit

class NYCSchoolDetailSchoolInfoCell: UITableViewCell {
    
  private let schoolNameLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.preferredFont(forTextStyle: .title3)
    return label
  }()
  
  private let idLabel: UILabel = {
    let label = UILabel()
    label.text = "ID:"
    label.textColor = .systemGray
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.preferredFont(forTextStyle: .caption1)
    return label
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupViews()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupViews()
  }

  private func setupViews() {
    contentView.addSubview(schoolNameLabel)
    contentView.addSubview(idLabel)

    NSLayoutConstraint.activate([
      schoolNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
      schoolNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Spacing.medium.rawValue),
      schoolNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Spacing.medium.rawValue),
      idLabel.topAnchor.constraint(equalTo: schoolNameLabel.bottomAnchor, constant: Spacing.small.rawValue),
      idLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Spacing.medium.rawValue),
      idLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Spacing.medium.rawValue),
      idLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Spacing.large.rawValue),
    ])
  }

  func configure(name: String, id: String) {
    schoolNameLabel.text = name
    idLabel.text = "ID: \(id)"
  }
}
