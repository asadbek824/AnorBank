//
//  MainView.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 21/01/24.
//

import UIKit

enum Constants {
    static let transferItemContentInset = NSDirectionalEdgeInsets(top: -20, leading: 10, bottom: 10, trailing: 10)
    static let itemContentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 20, trailing: 20)
    static let groupContentInsets = NSDirectionalEdgeInsets(top: 50, leading: 30, bottom: 20, trailing: 30)
    static let bDContentInsetsBecomecCliennt = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: -20, trailing: 0)
    static let itemContentInsetsPromtView = NSDirectionalEdgeInsets(top: 20, leading: 16, bottom: 50, trailing: 0)
    static let bDContentInsetsPV = NSDirectionalEdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0)
    static let itemContentInsetsCredits = NSDirectionalEdgeInsets(top: 10, leading: 8, bottom: 20, trailing: 8)
    static let itemContentInsetsDeposits = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 20, trailing: 0)
    static let itemContentInsetsHome = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
    static let fractionalWidth: CGFloat = 1.0
    static let fractionalWidthHalf: CGFloat = 0.5
    static let fractionalHeight: CGFloat = 1.0
    static let fractionalWidthTransferView = 0.25
    static let absolute: CGFloat = 100
    static let estimated: CGFloat = 150
    static let absoluteBecomecClient: CGFloat = 170
    static let groupWidthDimensionPV: CGFloat = 120
    static let groupHeightDimensionPV: CGFloat = 190
    static let headerHeightDimensionPV: CGFloat = 40
    static let cashbackAbsolute: CGFloat = 130
    static let groupSizeHome: CGFloat = 200
}

final class MainView: UIView {
    
    //MARK: - UIElements
    lazy var collectionView: UICollectionView = {
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(TransferViewCell.self, forCellWithReuseIdentifier: "cell1")
        collectionView.register(BecomecClienntCell.self, forCellWithReuseIdentifier: "cell2")
        collectionView.register(PromtViewCell.self, forCellWithReuseIdentifier: "cell3")
        collectionView.register(CashbackCell.self, forCellWithReuseIdentifier: "cell4")
        collectionView.register(MyCardsCell.self, forCellWithReuseIdentifier: "cell5")
        collectionView.register(SavedCell.self, forCellWithReuseIdentifier: "cell6")
        collectionView.register(CreditsCell.self, forCellWithReuseIdentifier: "cell7")
        collectionView.register(DepositsCell.self, forCellWithReuseIdentifier: "cell8")
        collectionView.register(MyHomeCell.self, forCellWithReuseIdentifier: "cell9")
        collectionView.register(MainBalanceReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerView")
        collectionView.register(SectionHeaders.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerView1")
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpCollectinView()
    }
    
    private func createLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout{ (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            let section: NSCollectionLayoutSection
            
            guard let sectionType = MainViewSectionTypes(rawValue: sectionIndex) else { return nil }
            
            switch sectionType {
            case .transferView:
                
                
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Constants.fractionalWidthTransferView), heightDimension: .fractionalHeight(Constants.fractionalHeight))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = Constants.transferItemContentInset
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(UIScreen.main.bounds.width), heightDimension: .absolute(Constants.absolute))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let headerFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Constants.fractionalWidth), heightDimension: .estimated(Constants.estimated))
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerFooterSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                
                section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .none
                section.boundarySupplementaryItems = [sectionHeader]
                
                
                
                
            case .becomecCliennt:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Constants.fractionalWidth), heightDimension: .fractionalHeight(Constants.fractionalHeight))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(UIScreen.main.bounds.width), heightDimension: .absolute(Constants.absoluteBecomecClient))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = Constants.groupContentInsets
                
                let bacgroundDecaration = NSCollectionLayoutDecorationItem.background(elementKind: "backgroundWhite1")
                bacgroundDecaration.contentInsets = Constants.bDContentInsetsBecomecCliennt
                
                section = NSCollectionLayoutSection(group: group)
                section.decorationItems = [bacgroundDecaration]
            case .promtView:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Constants.fractionalWidth), heightDimension: .fractionalHeight(Constants.fractionalHeight))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = Constants.itemContentInsetsPromtView
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(Constants.groupWidthDimensionPV), heightDimension: .absolute(Constants.groupHeightDimensionPV))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let headerFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Constants.fractionalWidth), heightDimension: .absolute(Constants.headerHeightDimensionPV))
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerFooterSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                
                let bacgroundDecaration = NSCollectionLayoutDecorationItem.background(elementKind: "backgroundWhite")
                bacgroundDecaration.contentInsets = Constants.bDContentInsetsPV
                
                section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.boundarySupplementaryItems = [sectionHeader]
                section.decorationItems = [bacgroundDecaration]
            case .cashback:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Constants.fractionalWidth), heightDimension: .fractionalHeight(Constants.fractionalHeight))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = Constants.itemContentInsets
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(UIScreen.main.bounds.width), heightDimension: .absolute(Constants.cashbackAbsolute))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let headerFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Constants.fractionalWidth), heightDimension: .absolute(Constants.headerHeightDimensionPV))
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerFooterSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                
                let bacgroundDecaration = NSCollectionLayoutDecorationItem.background(elementKind: "backgroundWhite")
                
                section = NSCollectionLayoutSection(group: group)
                section.boundarySupplementaryItems = [sectionHeader]
                section.decorationItems = [bacgroundDecaration]
            case .cards:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Constants.fractionalWidth), heightDimension: .fractionalHeight(Constants.fractionalHeight))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = Constants.itemContentInsets
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(UIScreen.main.bounds.width), heightDimension: .absolute(Constants.absolute))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let headerFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Constants.fractionalWidth), heightDimension: .absolute(Constants.headerHeightDimensionPV))
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerFooterSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                
                let bacgroundDecaration = NSCollectionLayoutDecorationItem.background(elementKind: "backgroundWhite")
                
                section = NSCollectionLayoutSection(group: group)
                section.boundarySupplementaryItems = [sectionHeader]
                section.decorationItems = [bacgroundDecaration]
            case .saved:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Constants.fractionalWidth), heightDimension: .fractionalHeight(Constants.fractionalHeight))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = Constants.itemContentInsets
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(UIScreen.main.bounds.width), heightDimension: .absolute(Constants.absolute))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let headerFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Constants.fractionalWidth), heightDimension: .absolute(Constants.headerHeightDimensionPV))
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerFooterSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                
                let bacgroundDecaration = NSCollectionLayoutDecorationItem.background(elementKind: "backgroundWhite")
                bacgroundDecaration.contentInsets = .init(top: .zero, leading: .zero, bottom: .zero, trailing: .zero)
                
                section = NSCollectionLayoutSection(group: group)
                section.boundarySupplementaryItems = [sectionHeader]
                section.decorationItems = [bacgroundDecaration]
            case .credits:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Constants.fractionalWidthHalf), heightDimension: .fractionalHeight(Constants.fractionalHeight))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = Constants.itemContentInsetsCredits
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(UIScreen.main.bounds.width), heightDimension: .absolute(Constants.estimated))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let headerFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Constants.fractionalWidth), heightDimension: .absolute(Constants.headerHeightDimensionPV))
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerFooterSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                
                let bacgroundDecaration = NSCollectionLayoutDecorationItem.background(elementKind: "backgroundWhite")
                bacgroundDecaration.contentInsets = .init(top: .zero, leading: .zero, bottom: .zero, trailing: .zero)
                
                section = NSCollectionLayoutSection(group: group)
                section.boundarySupplementaryItems = [sectionHeader]
                section.decorationItems = [bacgroundDecaration]
            case .deposits:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Constants.fractionalWidthHalf), heightDimension: .fractionalHeight(Constants.fractionalHeight))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = Constants.itemContentInsetsDeposits
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(UIScreen.main.bounds.width), heightDimension: .absolute(Constants.estimated))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let headerFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Constants.fractionalWidth), heightDimension: .absolute(Constants.headerHeightDimensionPV))
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerFooterSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                
                let bacgroundDecaration = NSCollectionLayoutDecorationItem.background(elementKind: "backgroundWhite")
                bacgroundDecaration.contentInsets = .init(top: .zero, leading: .zero, bottom: .zero, trailing: .zero)
                
                section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPaging
                section.boundarySupplementaryItems = [sectionHeader]
                section.decorationItems = [bacgroundDecaration]
            case .home:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Constants.fractionalWidth), heightDimension: .fractionalHeight(Constants.fractionalHeight))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = Constants.itemContentInsetsHome
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(UIScreen.main.bounds.width), heightDimension: .absolute(Constants.groupSizeHome))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let headerFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Constants.fractionalWidth), heightDimension: .absolute(Constants.headerHeightDimensionPV))
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerFooterSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                
                let bacgroundDecaration = NSCollectionLayoutDecorationItem.background(elementKind: "backgroundWhite")
                bacgroundDecaration.contentInsets = .init(top: .zero, leading: .zero, bottom: .zero, trailing: .zero)
                
                section = NSCollectionLayoutSection(group: group)
                section.boundarySupplementaryItems = [sectionHeader]
                section.decorationItems = [bacgroundDecaration]
            case .exchange:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Constants.fractionalWidth), heightDimension: .fractionalHeight(Constants.fractionalHeight))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = Constants.itemContentInsets
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(UIScreen.main.bounds.width), heightDimension: .absolute(Constants.cashbackAbsolute))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                section = NSCollectionLayoutSection(group: group)
            }
            return section
        }
        
        layout.register(BackgrounViewWhiteBecomecCliennt.self, forDecorationViewOfKind: "backgroundWhite1")
        layout.register(BackgrounViewWhite.self, forDecorationViewOfKind: "backgroundWhite")
        
        return layout
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainView {
    
    private func setUpCollectinView() {
        
        self.addSubview(collectionView)
        
//        collectionView.backgroundColor = .appColor.primary
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: .zero).isActive = true
        collectionView.setConstraint(.bottom, from: self, .zero)
        collectionView.setConstraint(.left, from: self, .zero)
        collectionView.setConstraint(.right, from: self, .zero)
    }
}
