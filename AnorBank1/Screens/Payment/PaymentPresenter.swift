//
//  PaymentPresenter.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 04/02/24.
//

import UIKit

protocol PaymentPresenterabel {
    func numberOfSections(in collectionView: UICollectionView) -> Int
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView
}

final class PaymentPresenter: PaymentPresenterabel {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        PaymentSectionTypes.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let sectionType = PaymentSectionTypes(rawValue: section) else { return .zero }
        
        return sectionType.getNumberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let sectionType = PaymentSectionTypes(rawValue: indexPath.section) else { return UICollectionViewCell() }
        
        switch sectionType {
        case .quick:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as? QuickCell else { return UICollectionViewCell() }
            
            cell.backgroundColor = .clear
            
            return cell
        case .categories:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as? CategoriesCell else { return UICollectionViewCell() }
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            
            guard let headerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: "header",
                for: indexPath
            ) as? SectionHeader else { return UICollectionReusableView() }
            
            if indexPath.section == 0 {
                
                headerView.allButton.isHidden = true
                headerView.installmentButton.isHidden = true
                headerView.cashbackButton.isHidden = true
                headerView.titleLabel.text = "Quick Actions"
            } else {
                
                headerView.titleLabel.text = "Categories"
                headerView.allButton.setTitle("All", for: .normal)
                headerView.installmentButton.setTitle("Installment", for: .normal)
                headerView.cashbackButton.setTitle("Cashback", for: .normal)
            }
            
            return headerView
        }
        return UICollectionReusableView()
    }
}
