//
//  NYCSchoolDetailSATScoresViewCell.swift
//  NYCSchools
//
//  Created by Dhruvil Vyas on 2/13/23.
//

import UIKit

class NYCSchoolDetailSATScoresViewCell: UITableViewCell {
  
  private let criticalReadingScoreLabel: UILabel = {
    let label = UILabel()
    label.textColor = .lightGray
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.preferredFont(forTextStyle: .callout)
    label.text = "Avg. Critical Reading Score: "
    return label
  }()
  
  private let mathScoreLabel: UILabel = {
    let label = UILabel()
    label.textColor = .lightGray
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.preferredFont(forTextStyle: .callout)
    label.text = "Avg. Math Score: "
    return label
  }()
  private let writingScoreLabel: UILabel = {
    let label = UILabel()
    label.textColor = .lightGray
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.preferredFont(forTextStyle: .callout)
    label.text = "Avg. Writing Score: "
    return label
  }()

  // MARK: - Initializer
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupViews()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupViews()
  }
  
  // MARK: - Methods

  private func setupViews() {
    contentView.addSubview(criticalReadingScoreLabel)
    contentView.addSubview(mathScoreLabel)
    contentView.addSubview(writingScoreLabel)

    NSLayoutConstraint.activate([
      //databaseNumberLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
      //databaseNumberLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      criticalReadingScoreLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
      criticalReadingScoreLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      mathScoreLabel.topAnchor.constraint(equalTo: criticalReadingScoreLabel.bottomAnchor, constant: 8),
      mathScoreLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      writingScoreLabel.topAnchor.constraint(equalTo: mathScoreLabel.bottomAnchor, constant: 8),
      writingScoreLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      writingScoreLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
    ])
  }
  
  func configure(criticalReadingScore: String, mathScore: String, writingScore: String) {
    criticalReadingScoreLabel.text = "Avg. Critical Reading Score: \(criticalReadingScore)"
    mathScoreLabel.text = "Avg. Math Score: \(mathScore)"
    writingScoreLabel.text = "Avg. Writing Score: \(writingScore)"
  }
}
