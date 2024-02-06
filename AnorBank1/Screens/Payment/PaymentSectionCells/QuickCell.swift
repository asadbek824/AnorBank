//
//  QuickCell.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 04/02/24.
//

import UIKit

final class QuickCell: UICollectionViewCell {
    
    //MARK: - UIElements
    let imageView = UIImageView()
    let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        setUpImageView()
        setUpTitleLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension QuickCell {
    
    private func setUpImageView() {
        
        addSubview(imageView)
        
        imageView.setConstraint(.top, from: self, 0)
        imageView.setConstraint(.left, from: self, 0)
        imageView.setConstraint(.right, from: self, 0)
        imageView.setConstraint(.haight, from: self, contentView.bounds.height / 2 + 20)
        imageView.layer.cornerRadius = 20
        imageView.backgroundColor = .blue
    }
    
    private func setUpTitleLabel() {
        
        addSubview(titleLabel)
        
        titleLabel.setConstraint(.bottom, from: self, 0)
        titleLabel.setConstraint(.left, from: self, 5)
        titleLabel.setConstraint(.right, from: self, 5)
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.font = .systemFont(ofSize:  14)
        titleLabel.text = "Transfer to the card"
    }
}
