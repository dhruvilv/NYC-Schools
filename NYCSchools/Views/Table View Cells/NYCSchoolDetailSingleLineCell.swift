//
//  NYCSchoolDetailSingleLineCell.swift
//  NYCSchools
//
//  Created by Dhruvil Vyas on 2/12/23.
//

import UIKit

class NYCSchoolDetailSingleLineCell: UITableViewCell {
    
  private let labelView: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.preferredFont(forTextStyle: .callout).withSize(14)
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
    contentView.addSubview(labelView)

    NSLayoutConstraint.activate([
      labelView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      labelView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Spacing.medium.rawValue),
      labelView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Spacing.medium.rawValue)
    ])
  }

  func configure(text: String) {
    labelView.text = text
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    labelView.text = ""
  }
}
