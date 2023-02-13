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
    label.font = UIFont.preferredFont(forTextStyle: .callout).withSize(14)
    label.text = "Avg. Critical Reading Score: "
    return label
  }()
  
  private let mathScoreLabel: UILabel = {
    let label = UILabel()
    label.textColor = .lightGray
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.preferredFont(forTextStyle: .callout).withSize(14)
    label.text = "Avg. Math Score: "
    return label
  }()
  
  private let writingScoreLabel: UILabel = {
    let label = UILabel()
    label.textColor = .lightGray
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.preferredFont(forTextStyle: .callout).withSize(14)
    label.text = "Avg. Writing Score: "
    return label
  }()
  
  private let numberOfTestTakers: UILabel = {
    let label = UILabel()
    label.textColor = .lightGray
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.preferredFont(forTextStyle: .callout).withSize(14)
    label.text = "Number Of Test Takers: "
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
    contentView.addSubview(numberOfTestTakers)

    NSLayoutConstraint.activate([
      criticalReadingScoreLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Spacing.medium.rawValue),
      criticalReadingScoreLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Spacing.medium.rawValue),
      
      mathScoreLabel.topAnchor.constraint(equalTo: criticalReadingScoreLabel.bottomAnchor, constant: Spacing.small.rawValue),
      mathScoreLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Spacing.medium.rawValue),
      
      writingScoreLabel.topAnchor.constraint(equalTo: mathScoreLabel.bottomAnchor, constant: Spacing.small.rawValue),
      writingScoreLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Spacing.medium.rawValue),
      
      numberOfTestTakers.topAnchor.constraint(equalTo: writingScoreLabel.bottomAnchor, constant: Spacing.small.rawValue),
      numberOfTestTakers.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Spacing.medium.rawValue),
      numberOfTestTakers.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Spacing.medium.rawValue)
    ])
  }
  
  func configure(
    criticalReadingScore: String,
    mathScore: String,
    writingScore: String,
    testTakerCount: String
  ) {
    criticalReadingScoreLabel.text = "Avg. Critical Reading Score: \(criticalReadingScore)"
    mathScoreLabel.text = "Avg. Math Score: \(mathScore)"
    writingScoreLabel.text = "Avg. Writing Score: \(writingScore)"
    numberOfTestTakers.text = "Number Of Test Takers: \(testTakerCount)"
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    criticalReadingScoreLabel.text = "Avg. Critical Reading Score:"
    mathScoreLabel.text = "Avg. Math Score:"
    writingScoreLabel.text = "Avg. Writing Score:"
    numberOfTestTakers.text = "Number Of Test Takers: "
  }
}
