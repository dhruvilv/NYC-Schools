//
//  TableHeaderView.swift
//  NYCSchools
//
//  Created by Dhruvil Vyas on 2/12/23.
//

import UIKit

class TableHeaderView: UIView {
  
  private let label: UILabel = {
    let label = UILabel()
    label.textColor = .systemBlue
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.preferredFont(forTextStyle: .headline)
    return label
  }()
  
  private let line: UIView = {
    let label = UILabel()
    label.backgroundColor = .systemBlue
    label.heightAnchor.constraint(equalToConstant: 1).isActive = true
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  // MARK: - Initializer

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupViews()
  }
  
  // MARK: - Methods

  private func setupViews() {
    backgroundColor = .systemGray5
    addSubview(label)
    addSubview(line)

    NSLayoutConstraint.activate([
      label.topAnchor.constraint(equalTo: topAnchor, constant: 4),
      label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
      label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

      line.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 4),
      line.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
      line.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
      line.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }

  func configure(text: String) {
    label.text = text
  }
}
