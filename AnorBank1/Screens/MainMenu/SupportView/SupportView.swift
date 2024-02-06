//
//  SupportView.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 25/01/24.
//

import UIKit

final class SupportView: UIView {
    
    //MARK: - UIElements
    lazy var collectionView: UICollectionView = {
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(SupportCell.self, forCellWithReuseIdentifier: "cell")
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpCollectionView()
    }
    
    private func createLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            let section: NSCollectionLayoutSection
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(UIScreen.main.bounds.width), heightDimension: .absolute(150))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            group.contentInsets = .init(top: 10, leading: 10, bottom: 0, trailing: 10)
            
            section = NSCollectionLayoutSection(group: group)
            
            return section
        }
        return layout
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - extension to SupportView
extension SupportView {
    
    private func setUpCollectionView() {
        
        self.addSubview(collectionView)
        
        collectionView.setConstraint(.bottom, from: self, 0)
        collectionView.setConstraint(.left, from: self, 0)
        collectionView.setConstraint(.right, from: self, 0)
        collectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
    }
}
