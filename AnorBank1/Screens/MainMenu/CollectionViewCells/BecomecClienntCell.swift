//
//  BecomecClienntCell.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 22/01/24.
//

import UIKit

final class BecomecClienntCell: UICollectionViewCell {
    
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        
        setUpImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BecomecClienntCell {
    
    private func setUpImageView() {
        
        addSubview(imageView)
        
        imageView.setConstraint(.top, from: self, 0)
        imageView.setConstraint(.bottom, from: self, 0)
        imageView.setConstraint(.left, from: self, 0)
        imageView.setConstraint(.right, from: self, 0)
        
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
    }
}
