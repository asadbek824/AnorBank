//
//  SegmentBankView.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 02/02/24.
//

import UIKit

final class SegmentBankView: UIView {
    
    //MARK: - UIElements
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            // Здесь вы можете определить ваш макет
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(UIScreen.main.bounds.width - 100), heightDimension: .absolute(UIScreen.main.bounds.height - 400))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 20
            section.contentInsets = NSDirectionalEdgeInsets(top: 70, leading: 0, bottom: 0, trailing: 0)
            section.orthogonalScrollingBehavior = .groupPagingCentered
            
            return section
        }
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collectionView.backgroundColor = .white
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    private let pageControl = UIPageControl()
    
    
    private let numberOfItemsInSection = 10
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(collectionView)
        
        collectionView.setConstraint(.top, from: self, 0)
        collectionView.setConstraint(.bottom, from: self, 0)
        collectionView.setConstraint(.left, from: self, 0)
        collectionView.setConstraint(.right, from: self, 0)
        
        addSubview(pageControl)
        
        pageControl.setConstraint(.bottom, from: self, 70)
        pageControl.setConstraint(.left, from: self, 100)
        pageControl.setConstraint(.right, from: self, 100)
        
        pageControl.numberOfPages = numberOfItemsInSection
        pageControl.pageIndicatorTintColor = .red
        pageControl.currentPageIndicatorTintColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SegmentBankView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        numberOfItemsInSection
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        cell.backgroundColor = .red
        
        pageControl.currentPage = Int(collectionView.contentOffset.x / UIScreen.main.bounds.width)
        
        return cell
    }
}
