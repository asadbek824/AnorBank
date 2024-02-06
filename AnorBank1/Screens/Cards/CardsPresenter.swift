//
//  CardsPresenter.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 04/02/24.
//

import UIKit

protocol CardsPresenterable {
    func numberOfItems(In section: Int) -> Int
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView
}

final class CardsPresenter: CardsPresenterable {
    
    func numberOfItems(In section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CardsCell else { return UICollectionViewCell() }
            
            cell.titleLabel.text = "Asosiy"
            
            let attributedText = NSMutableAttributedString(string: "123.23 UZS")
            attributedText.addAttribute(.font, value: UIFont.systemFont(ofSize: 22), range: NSRange(location: 0, length: 3))
            attributedText.addAttribute(.font, value: UIFont.systemFont(ofSize: 16), range: NSRange(location: 4, length: 5))
            cell.balanceLabel.attributedText = attributedText
            cell.cardNumber.text = "**9696"
            cell.cardTermLabel.text = "08/25"
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellOrder", for: indexPath)
            
            let titleLable = UILabel()
            
            cell.addSubview(titleLable)
            
            titleLable.setConstraint(.xCenter, from: cell, 0)
            titleLable.setConstraint(.yCenter, from: cell, 0)
            
            titleLable.text = "Order a card"
            titleLable.textColor = .white
            
            cell.layer.cornerRadius = 10
            cell.backgroundColor = .appColor.primary
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            
            guard let headerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: "headerView",
                for: indexPath
            ) as? CardsReusableView else { return UICollectionReusableView() }
            
            headerView.titleLabel.text = "Cards"
            headerView.squareFourButton.setImage(UIImage(systemName: "square.grid.2x2.fill"), for: .normal)
            headerView.squareTwoButton.setImage(UIImage(systemName: "rectangle.grid.1x2"), for: .normal)
            headerView.arrowButton.setImage(UIImage(systemName: "arrow.clockwise"), for: .normal)
            
            return headerView
        }
        return UICollectionReusableView()
    }
}
