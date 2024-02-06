//
//  SupportCell.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 25/01/24.
//

import UIKit

extension SupportCell {
    enum Constants {
        static let cellCornerRadius: CGFloat = 20
    }
}

final class SupportCell: UICollectionViewCell {
    
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemPink
        layer.cornerRadius = Constants.cellCornerRadius
        
        setUpImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SupportCell {
    
    private func setUpImageView() {
        
        addSubview(imageView)
        
        imageView.setConstraint(.top, from: self, .zero)
        imageView.setConstraint(.bottom, from: self, .zero)
        imageView.setConstraint(.left, from: self, 0)
        imageView.setConstraint(.right, from: self, 0)
    }
}
