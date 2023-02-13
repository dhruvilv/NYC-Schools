//
//  NYCSchoolListViewCell.swift
//  NYCSchools
//
//  Created by Dhruvil Vyas on 2/7/23.
//

import UIKit

class NYCSchoolListViewCell: UITableViewCell {
  
  var viewModel: NYCSchoolInfo? {
    didSet {
      schoolNameLabel.text = viewModel?.name
    }
  }
  
  let containerView: UIView = {
    let view = UIView()
    view.backgroundColor = .systemGray5
    view.layer.cornerRadius = 8
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
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    selectionStyle = .none
    let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(containerViewTapped))
    tapGestureRecognizer.cancelsTouchesInView = false
    containerView.addGestureRecognizer(tapGestureRecognizer)

    contentView.addSubview(containerView)
    containerView.addSubview(schoolNameLabel)

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
      schoolNameLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -4),
      schoolNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
    ])
  }
    
  @objc func containerViewTapped() {
    UIView.animate(withDuration: 0.1, animations: {
      self.containerView.backgroundColor = .systemGray3
    }) { (_) in
      UIView.animate(withDuration: 0.1) {
        self.containerView.backgroundColor = .systemGray5
      }
    }
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    viewModel = nil
    schoolNameLabel.text = ""    
  }
}
