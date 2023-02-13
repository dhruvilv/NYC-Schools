//
//  TableHeaderView.swift
//  NYCSchools
//
//  Created by Dhruvil Vyas on 2/12/23.
//

import UIKit

class TableHeaderView: UIView {
  
  private let label = UILabel()
  private let line = UIView()
  
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
    addSubview(label)
    addSubview(line)

    label.translatesAutoresizingMaskIntoConstraints = false
    line.translatesAutoresizingMaskIntoConstraints = false

    label.textColor = .systemBlue
    label.font = UIFont.preferredFont(forTextStyle: .body)

    line.backgroundColor = .systemBlue
    line.heightAnchor.constraint(equalToConstant: 1).isActive = true

    NSLayoutConstraint.activate([
      label.topAnchor.constraint(equalTo: topAnchor, constant: 16),
      label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
      label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

      line.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8),
      line.leadingAnchor.constraint(equalTo: leadingAnchor),
      line.trailingAnchor.constraint(equalTo: trailingAnchor),
      line.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }

  func configure(text: String) {
    label.text = text
  }
}
