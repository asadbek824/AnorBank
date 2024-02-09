//
//  ViewCell.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 08/02/24.
//

import UIKit

final class ViewCell: UITableViewCell {
    
    private let view = UIView()
    let newsImageView = UIImageView()
    let titleLabel = UILabel()
    let classificationLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        selectionStyle = .none
        
        setUpView()
        setUpNewsImageView()
        setUpTitleLabel()
        setUpClassificationLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ViewCell {
    
    private func setUpView() {
        
        addSubview(view)
        
        view.setConstraint(.top, from: self, 10)
        view.setConstraint(.bottom, from: self, 10)
        view.setConstraint(.left, from: self, 10)
        view.setConstraint(.right, from: self, 10)
        
        view.layer.cornerRadius = 20
        view.backgroundColor = .systemGray4
    }
    
    private func setUpNewsImageView() {
        
        addSubview(newsImageView)
        
        newsImageView.setConstraint(.top, from: self, 30)
        newsImageView.setConstraint(.bottom, from: self, 30)
        newsImageView.setConstraint(.left, from: self, 30)
        newsImageView.setConstraint(.width, from: self, 60)
        
        newsImageView.backgroundColor = .clear
        newsImageView.layer.cornerRadius = 15
        newsImageView.layer.borderWidth = 1
        newsImageView.layer.borderColor = .init(gray: 0.5, alpha: 1)
    }
    
    private func setUpTitleLabel() {
        
        addSubview(titleLabel)
        
        titleLabel.setConstraint(.top, from: self, 30)
        titleLabel.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: 10).isActive = true
    }
    
    private func setUpClassificationLabel() {
        
        addSubview(classificationLabel)
        
        classificationLabel.translatesAutoresizingMaskIntoConstraints = false
        classificationLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        classificationLabel.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: 10).isActive = true
        classificationLabel.setConstraint(.right, from: self, 10)
        
        classificationLabel.numberOfLines = 0
        classificationLabel.font = .systemFont(ofSize: 12)
        classificationLabel.textColor = .gray
    }
}
