//
//  NYCSchoolDetailAddressCell.swift
//  NYCSchools
//
//  Created by Dhruvil Vyas on 2/12/23.
//

import UIKit

class AddressTableViewCell: UITableViewCell {
    
  private let addressLabel = UILabel()

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
    addressLabel.translatesAutoresizingMaskIntoConstraints = false
    addressLabel.numberOfLines = 2
    addressLabel.font = .systemFont(ofSize: 17)

    NSLayoutConstraint.activate([
        addressLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
        addressLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
        addressLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        addressLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
    ])
  }

  func configure(address: String) {
      addressLabel.text = address
  }
}
