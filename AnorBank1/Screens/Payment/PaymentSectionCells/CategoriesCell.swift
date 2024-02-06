//
//  CategoriesCell.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 04/02/24.
//

import UIKit

final class CategoriesCell: UICollectionViewCell {
    
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .brown
        
        layer.cornerRadius = 20
        
        setUpImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CategoriesCell {
    
    private func setUpImageView() {
        
        addSubview(imageView)
        
        imageView.setConstraint(.top, from: self, 0)
        imageView.setConstraint(.bottom, from: self, 0)
        imageView.setConstraint(.left, from: self, 0)
        imageView.setConstraint(.right, from: self, 0)
    }
}
