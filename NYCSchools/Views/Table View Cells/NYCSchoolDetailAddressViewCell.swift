//
//  NYCSchoolDetailAddressViewCell.swift
//  NYCSchools
//
//  Created by Dhruvil Vyas on 2/12/23.
//

import UIKit

class NYCSchoolDetailAddressViewCell: UITableViewCell {
    
  private let addressLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 2
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
    contentView.addSubview(addressLabel)

    NSLayoutConstraint.activate([
      addressLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Spacing.small.rawValue),
      addressLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Spacing.medium.rawValue),
      addressLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Spacing.medium.rawValue),
      addressLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Spacing.small.rawValue)
    ])
  }

  func configure(address: String) {
      addressLabel.text = address
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    addressLabel.text = ""
  }
}
