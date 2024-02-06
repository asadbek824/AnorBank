//
//  MainPresenter.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 21/01/24.
//

import UIKit

protocol MainViewPresenterable: AnyObject {
    func numberOfSections(in collectionView: UICollectionView) -> Int
    func numberOfItemsInSection(in section: Int) -> Int
    func cellForItemAt(collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell
    func willDisplay(_ cell: UICollectionViewCell)
}

final class MainPresenter: MainViewPresenterable {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return MainViewSectionTypes.allCases.count
    }
    
    func numberOfItemsInSection(in section: Int) -> Int {
        guard let sectionType = MainViewSectionTypes(rawValue: section) else { return .zero }
        
        return sectionType.getNumberOfItems()
    }
    
    func cellForItemAt(collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        guard let sectionType = MainViewSectionTypes(rawValue: indexPath.section) else { return UICollectionViewCell() }
        
        switch sectionType {
        case .transferView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as? TransferViewCell else { return UICollectionViewCell() }
            
            switch indexPath.row {
            case 0 :
                cell.imageView.image = UIImage(named: "card")
                cell.titleLabel.text = "Transfer to the card"
            case 1 :
                cell.imageView.image = UIImage(named: "person")
                cell.titleLabel.text = "Phone number"
            case 2 :
                cell.imageView.image = UIImage(named: "money")
                cell.titleLabel.text = "Currency exchange"
            case 3 :
                cell.imageView.image = UIImage(named: "transfer")
                cell.titleLabel.text = "Transfer by bank details"
            default :
                cell.imageView.isHidden = true
                cell.titleLabel.isHidden = true
            }
            
            return cell
        case .becomecCliennt:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as? BecomecClienntCell else { return UICollectionViewCell() }
            
            cell.imageView.image = UIImage(named: "becomecCliennt")
            
            return cell
        case .promtView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath) as? PromtViewCell else { return UICollectionViewCell() }
            
            switch indexPath.row {
            case 0 :
                cell.imageView.image = UIImage(named: "more")
            case 1 :
                cell.imageView.image = UIImage(named: "duoCard")
            case 2 :
                cell.imageView.image = UIImage(named: "perAnnum")
            case 3 :
                cell.imageView.image = UIImage(named: "details")
            case 4 :
                cell.imageView.image = UIImage(named: "c4x")
            case 5 :
                cell.imageView.image = UIImage(named: "gifts")
            case 6 :
                cell.imageView.image = UIImage(named: "customer")
            case 7 :
                cell.imageView.image = UIImage(named: "exchange")
            case 8 :
                cell.imageView.image = UIImage(named: "balance")
            case 9 :
                cell.imageView.image = UIImage(named: "pini")
            case 10 :
                cell.imageView.image = UIImage(named: "settings")
            case 11 :
                cell.imageView.image = UIImage(named: "confirmation")
            case 12 :
                cell.imageView.image = UIImage(named: "devices")
            case 13 :
                cell.imageView.image = UIImage(named: "balanceSettings")
            default :
                cell.imageView.isHidden = true
            }
            
            return cell
        case .cashback:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell4", for: indexPath) as? CashbackCell else { return UICollectionViewCell() }
            
            cell.titleLabel.text = "Cashback"
            cell.earnedLabel.text = "Earned"
            cell.moneyLabel.text = "0.00 UZS"
            cell.upToLabel.text = "up to 25%"
            
            return cell
        case .cards:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell5", for: indexPath) as? MyCardsCell else { return UICollectionViewCell() }
            
            cell.addButton.setImage(UIImage(systemName: "plus.viewfinder"), for: .normal)
            cell.addButtonText.setTitle("ADD PAYMENT", for: .normal)
            
            return cell
        case .saved:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell6", for: indexPath) as? SavedCell else { return UICollectionViewCell() }
            
            cell.addButton.setImage(UIImage(systemName: "plus.viewfinder"), for: .normal)
            cell.addButtonText.setTitle("ADD PAYMENT", for: .normal)
            
            return cell
        case .credits:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell7", for: indexPath) as? CreditsCell else { return UICollectionViewCell() }
            
            switch indexPath.row {
            case 0 :
                cell.imageView.image = UIImage(named: "Convenient")
            case 1 :
                cell.imageView.image = UIImage(named: "Installment")
            default :
                cell.imageView.isHidden = true
            }
            
            return cell
        case .deposits:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell8", for: indexPath) as? DepositsCell else { return UICollectionViewCell() }
            
            switch indexPath.row {
            case 0 :
                cell.imageView.image = UIImage(named: "Shoshilmasdan")
            case 1 :
                cell.imageView.image = UIImage(named: "omonat")
            case 2 :
                cell.imageView.image = UIImage(named: "prime")
            case 3 :
                cell.imageView.image = UIImage(named: "goUsd")
            case 4 :
                cell.imageView.image = UIImage(named: "fly")
            case 5 :
                cell.imageView.image = UIImage(named: "smart")
            default :
                cell.imageView.isHidden = true
            }
            
            return cell
        case .home:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell9", for: indexPath) as? MyHomeCell else { return UICollectionViewCell() }
            
            cell.imageView.image = UIImage(named: "home")
            cell.addNewHomeButton.setTitle("Add a new home", for: .normal)
            
            return cell
        case .exchange:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            
            cell.backgroundColor = .red
            
            return cell
        }
    }
    
    func willDisplay(_ cell: UICollectionViewCell) {
        cell.alpha = 0
        cell.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        
        UIView.animate(withDuration: 0.5) {
            cell.alpha = 1
            cell.transform = CGAffineTransform.identity
        }
    }
}
