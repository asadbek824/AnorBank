//
//  WidgetsCell.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 27/01/24.
//

import UIKit

protocol WidgetsCellDelegate: AnyObject {
    func plusMinusButtonTapped(in cell: WidgetsCell,_ collectionView: UICollectionView)
}

final class WidgetsCell: UICollectionViewCell {
    
    //MARK: - UIElements
    private let titleLabel = UILabel()
    private let imageView = UIImageView()
    let plusMinusButton = UIButton(type: .system)
    
    weak var delegate: WidgetsCellDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        setUpImageView()
        setUpTitleLabel()
        setUpPlusMinusButton()
    }
    
    func configure(data: CollectionData) {
        imageView.image = data.image
        titleLabel.text = data.title
    }
    
    @objc private func plusMinusButtonTapped() {
        if let collectionView = self.superview as? UICollectionView {
            delegate?.plusMinusButtonTapped(in: self, collectionView)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WidgetsCell {
    
    private func setUpImageView() {
        
        contentView.addSubview(imageView)
        
        imageView.setConstraint(.top, from: contentView, 10)
        imageView.setConstraint(.left, from: contentView, 10)
        imageView.setConstraint(.right, from: contentView, 10)
        imageView.setConstraint(.haight, from: contentView, contentView.bounds.height * 0.6)
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.backgroundColor = .rgb(183, 38, 80)
    }
    
    private func setUpTitleLabel() {
        
        contentView.addSubview(titleLabel)
        
        titleLabel.setConstraint(.bottom, from: contentView, 0)
        titleLabel.setConstraint(.left, from: contentView, 10)
        titleLabel.setConstraint(.right, from: contentView, 10)
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        titleLabel.numberOfLines = 0
        titleLabel.font = .boldSystemFont(ofSize: 10)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
    }
    
    private func setUpPlusMinusButton() {
        
        contentView.addSubview(plusMinusButton)
        
        plusMinusButton.setConstraint(.top, from: contentView, 0)
        plusMinusButton.setConstraint(.right, from: contentView, 0)
        plusMinusButton.setConstraint(.haight, from: contentView, 30)
        plusMinusButton.setConstraint(.width, from: contentView, 30)
        plusMinusButton.addTarget(self, action: #selector(plusMinusButtonTapped), for: .touchUpInside)
        
        plusMinusButton.layer.cornerRadius = 15
    }
}
