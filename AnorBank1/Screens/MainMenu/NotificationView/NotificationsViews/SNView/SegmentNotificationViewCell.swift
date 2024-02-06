//
//  SegmentNotificationViewCell.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 02/02/24.
//

import UIKit

final class SegmentNotificationViewCell: UICollectionViewCell {
    
    let imageView = UIImageView()
    let timeLabel = UILabel()
    let titleLabel = UILabel()
    let classificationLabel = UILabel()
    let xButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.init(white: 0.7, alpha: 1).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowOpacity = 1
        layer.shadowRadius = 5
        layer.masksToBounds = false
        
        setUpImageView()
        setUpTimeLabel()
        setUpTitleLabel()
        setUpClassificationLabel()
        setUpXButton()
    }
    
    @objc private func xButtonTapped() {
        
        guard let collectionView = self.superview as? UICollectionView,
              let indexPath = collectionView.indexPath(for: self) else {
            return
        }
        
        NotificationCenter.default.post(name: Notification.Name("RemoveItem"), object: indexPath)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SegmentNotificationViewCell {
    
    private func setUpImageView() {
        
        addSubview(imageView)
        
        imageView.setConstraint(.top, from: contentView, 0)
        imageView.setConstraint(.left, from: contentView, 10)
        imageView.setConstraint(.width, from: contentView, 50)
        imageView.setConstraint(.haight, from: contentView, 50)
        imageView.backgroundColor = .white
    }
    
    private func setUpTimeLabel() {
        
        addSubview(timeLabel)
        
        timeLabel.setConstraint(.top, from: contentView, 20)
        timeLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 5).isActive = true
        timeLabel.font = .systemFont(ofSize: 13)
        timeLabel.textColor = .gray
    }
    
    private func setUpTitleLabel() {
        
        addSubview(titleLabel)
        
        titleLabel.setConstraint(.left, from: self, 10)
        titleLabel.setConstraint(.right, from: self, 5)
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5).isActive = true
        titleLabel.font = .systemFont(ofSize: 15)
        titleLabel.textColor = .appColor.primary
        titleLabel.numberOfLines = 0
    }
    
    private func setUpClassificationLabel() {
        
        addSubview(classificationLabel)
        
        classificationLabel.setConstraint(.left, from: self, 10)
        classificationLabel.setConstraint(.right, from: self, 5)
        classificationLabel.setConstraint(.bottom, from: self, 5)
        classificationLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0).isActive = true
        classificationLabel.font = .systemFont(ofSize: 14)
        classificationLabel.numberOfLines = 0
    }
    
    private func setUpXButton() {
        
        addSubview(xButton)
        
        xButton.setConstraint(.top, from: self, 16)
        xButton.setConstraint(.right, from: self, 10)
        xButton.setConstraint(.width, from: self, 25)
        xButton.setConstraint(.haight, from: self, 25)
        xButton.tintColor = .appColor.primary
        xButton.addTarget(self, action: #selector(xButtonTapped), for: .touchUpInside)
    }
}
