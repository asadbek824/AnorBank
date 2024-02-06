//
//  MyHomeCell.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 22/01/24.
//

import UIKit

final class MyHomeCell: UICollectionViewCell {
    
    let imageView = UIImageView()
    let addNewHomeButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setUpAddNewHomeButton()
        setUpImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MyHomeCell {
    
    private func setUpAddNewHomeButton() {
        
        addSubview(addNewHomeButton)
        
        addNewHomeButton.setConstraint(.bottom, from: self, 5)
        addNewHomeButton.setConstraint(.haight, from: self, 45)
        addNewHomeButton.setConstraint(.left, from: self, 5)
        addNewHomeButton.setConstraint(.right, from: self, 5)
        
        addNewHomeButton.backgroundColor = .appColor.primary
        addNewHomeButton.layer.cornerRadius = 10
        addNewHomeButton.setTitleColor(.white, for: .normal)
    }
    
    private func setUpImageView() {
        
        addSubview(imageView)
        
        imageView.setConstraint(.top, from: self, 0)
        imageView.setConstraint(.right, from: self, 0)
        imageView.setConstraint(.left, from: self, 0)
        imageView.bottomAnchor.constraint(equalTo: addNewHomeButton.topAnchor).isActive = true
    }
}
