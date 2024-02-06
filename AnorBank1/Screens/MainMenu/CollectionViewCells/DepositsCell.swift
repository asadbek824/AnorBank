//
//  DepositsCell.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 22/01/24.
//

import UIKit

final class DepositsCell: UICollectionViewCell {
    
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 15
        clipsToBounds = true
        
        setUpImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DepositsCell {
    
    private func setUpImageView() {
        
        addSubview(imageView)
        
        imageView.setConstraint(.top, from: self, 0)
        imageView.setConstraint(.bottom, from: self, 0)
        imageView.setConstraint(.left, from: self, 0)
        imageView.setConstraint(.right, from: self, 0)
    }
}
