//
//  CardsView.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 04/02/24.
//

import UIKit

final class CardsView: UIView {
    
    //MARK: - UIElements
    private let myCardView = UIView()
    private let allButton = UIButton(type: .system)
    private let debitButton = UIButton(type: .system)
    private let transportButton = UIButton(type: .system)
    private let plusButton = UIButton(type: .system)
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: createLayout()
        )
        
        collectionView.register(CardsCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellOrder")
        collectionView.register(
            CardsReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "headerView"
        )
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        setUpMyCardView()
        setUpAllButton()
        setUpDebitButton()
        setUpTransportButton()
        setUpPlusButton()
        setUpCollectionView()
    }
    
    private func createLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            let section: NSCollectionLayoutSection
            
            if sectionIndex == 0 {
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(UIScreen.main.bounds.width / 2 ), heightDimension: .absolute(150))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = .init(top: 10, leading: 10, bottom: 0, trailing: 0)
                
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(70))
                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                
                section = NSCollectionLayoutSection(group: group)
                section.boundarySupplementaryItems = [header]
            } else {
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(UIScreen.main.bounds.width), heightDimension: .absolute(80))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = .init(top: 30, leading: 20, bottom: 0, trailing: 20)
                
                section = NSCollectionLayoutSection(group: group)
            }
            
            return section
        }
        return layout
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CardsView {
    
    private func setUpMyCardView() {
        
        addSubview(myCardView)
        
        myCardView.setConstraint(.top, from: self, 100)
        myCardView.setConstraint(.left, from: self, 0)
        myCardView.setConstraint(.right, from: self, 0)
        myCardView.setConstraint(.bottom, from: self, 0)
        
        myCardView.layer.cornerRadius = 20
        myCardView.backgroundColor = .white
    }
    
    private func setUpAllButton() {
        
        myCardView.addSubview(allButton)
        
        allButton.setConstraint(.top, from: myCardView, 20)
        allButton.setConstraint(.left, from: myCardView, 16)
        allButton.setConstraint(.width, from: myCardView, 70)
        
        allButton.setTitle("All", for: .normal)
        allButton.setTitleColor(.white, for: .normal)
        allButton.layer.cornerRadius = 15
        allButton.backgroundColor = .appColor.primary
    }
    
    private func setUpDebitButton() {
        
        myCardView.addSubview(debitButton)
        
        debitButton.setConstraint(.top, from: myCardView, 20)
        debitButton.setConstraint(.width, from: myCardView, 70)
        debitButton.leadingAnchor.constraint(equalTo: allButton.trailingAnchor, constant: 5).isActive = true
        
        debitButton.setTitle("Debit", for: .normal)
        debitButton.setTitleColor(.black, for: .normal)
        debitButton.layer.cornerRadius = 15
        debitButton.backgroundColor = .systemGray6
    }
    
    private func setUpTransportButton() {
        
        myCardView.addSubview(transportButton)
        
        transportButton.setConstraint(.top, from: myCardView, 20)
        transportButton.setConstraint(.width, from: myCardView, 90)
        transportButton.leadingAnchor.constraint(equalTo: debitButton.trailingAnchor, constant: 5).isActive = true
        
        transportButton.setTitle("Transport", for: .normal)
        transportButton.setTitleColor(.black, for: .normal)
        transportButton.layer.cornerRadius = 15
        transportButton.backgroundColor = .systemGray6
    }
    
    private func setUpPlusButton() {
        
        myCardView.addSubview(plusButton)
        
        plusButton.setConstraint(.top, from: myCardView, 20)
        plusButton.setConstraint(.right, from: myCardView, 10)
        plusButton.setConstraint(.width, from: myCardView, 25)
        plusButton.setConstraint(.haight, from: myCardView, 25)
        
        plusButton.setImage(UIImage(systemName: "plus"), for: .normal)
        plusButton.tintColor = .white
        plusButton.layer.cornerRadius = 12.5
        plusButton.backgroundColor = .appColor.primary
    }
    
    private func setUpCollectionView() {
        
        myCardView.addSubview(collectionView)
        
        collectionView.setConstraint(.top, from: myCardView, 50)
        collectionView.setConstraint(.left, from: myCardView, 0)
        collectionView.setConstraint(.right, from: myCardView, 0)
        collectionView.setConstraint(.bottom, from: myCardView, 0)
    }
}
