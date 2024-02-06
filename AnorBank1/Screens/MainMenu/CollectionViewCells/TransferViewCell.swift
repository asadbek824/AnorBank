//
//  TransferViewCell.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 22/01/24.
//

import UIKit

final class TransferViewCell: UICollectionViewCell {
    
    let imageView = UIImageView()
    let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        backgroundColor = .rgb(180, 37, 79)
        
        setUpImageView()
        setUpTitleLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TransferViewCell {
    
    private func setUpImageView() {
        
        contentView.addSubview(imageView)
        
        imageView.setConstraint(.top, from: contentView, 0)
        imageView.setConstraint(.left, from: contentView, 0)
        imageView.setConstraint(.right, from: contentView, 0)
        imageView.setConstraint(.haight, from: contentView, contentView.bounds.height * 0.7)
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.backgroundColor = .rgb(183, 38, 80)
    }
    
    private func setUpTitleLabel() {
        
        contentView.addSubview(titleLabel)
        
        titleLabel.setConstraint(.bottom, from: contentView, 0)
        titleLabel.setConstraint(.left, from: contentView, 0)
        titleLabel.setConstraint(.right, from: contentView, 0)
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 0).isActive = true
        
        titleLabel.numberOfLines = 0
        titleLabel.font = .systemFont(ofSize: 12)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
    }
}

