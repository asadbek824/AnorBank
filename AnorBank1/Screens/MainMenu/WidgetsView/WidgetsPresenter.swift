//
//  WidgetsPresenter.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 27/01/24.
//

import UIKit

struct CollectionData {
    
    let image: UIImage
    let title: String
}

protocol WidgetsViewPresenterable {
    func numberOfSections(in collectionView: UICollectionView) -> Int
    func numberOfItemsInSection(in section: Int) -> Int
    func cellForItemAt(collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView
}

final class WidgetsPresenter: WidgetsViewPresenterable, WidgetsCellDelegate {
    
    //MARK: - Data
    private var collectionData: [[CollectionData]] = [
        [ // Section 0: Active widgets
            CollectionData(image: UIImage(named: "card")!, title: "Transfer to the card"),
            CollectionData(image: UIImage(named: "person")!, title: "Phone number"),
            CollectionData(image: UIImage(named: "money")!, title: "Currency exchange"),
            CollectionData(image: UIImage(named: "transfer")!, title: "Transfer by bank details"),
            CollectionData(image: UIImage(named: "qr")!, title: "QR payment"),
            CollectionData(image: UIImage(named: "repayment")!, title: "Installment repayment"),
            CollectionData(image: UIImage(named: "loan")!, title: "Loan repayment"),
            CollectionData(image: UIImage(named: "international")!, title: "International"),
            CollectionData(image: UIImage(named: "cros")!, title: "Cross conversion"),
            CollectionData(image: UIImage(named: "anorChek")!, title: "AnorChek")
        ],
        [
            
        ]
    ]
    
    func plusMinusButtonTapped(in cell: WidgetsCell, _ collectionView: UICollectionView) {
        guard let indexPath = collectionView.indexPath(for: cell) else { return }
        
        if indexPath.section == 0 {
            let dataIndex = indexPath.row
            if dataIndex < collectionData[0].count {
                let data = collectionData[0].remove(at: dataIndex)
                collectionData[1].append(data)
                collectionView.reloadData()
            }
        } else if indexPath.section == 1 {
            let dataIndex = indexPath.row
            if dataIndex < collectionData[1].count {
                let data = collectionData[1].remove(at: dataIndex)
                collectionData[0].append(data)
                collectionView.reloadData()
            }
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return collectionData.count
    }
    
    func numberOfItemsInSection(in section: Int) -> Int {
        return collectionData[section].count
    }
    
    func cellForItemAt(collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? WidgetsCell else { return UICollectionViewCell() }
        
        cell.delegate = self
        
        let data = collectionData[indexPath.section][indexPath.row] // Получаем объект CollectionData по индексу секции и строки
        
        cell.configure(data: data) // Передаем объект CollectionData в метод configure(data:) ячейки
        
        if indexPath.section == 0 {
            cell.plusMinusButton.setTitle("-", for: .normal)
            cell.plusMinusButton.backgroundColor = .rgb(229, 209, 215)
            cell.plusMinusButton.setTitleColor(.appColor.primary, for: .normal)
        } else {
            cell.plusMinusButton.setTitle("+", for: .normal)
            cell.plusMinusButton.backgroundColor = .rgb(219, 236, 221)
            cell.plusMinusButton.setTitleColor(.rgb(81, 164, 90), for: .normal)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerView", for: indexPath) as? SectionHeaders else { return UICollectionReusableView() }

            switch indexPath.section {
            case 0 :
                if collectionData[0].isEmpty { // Проверяем, пуст ли массив данных для секции 0
                    headerView.isHidden = true // Если пуст, скрываем заголовок
                } else {
                    headerView.isHidden = false
                    headerView.titleLabel.text = "Active widgets"
                    headerView.allButton.isHidden = true
                    headerView.chevronButton.isHidden = true
                }
            case 1 :
                if collectionData[1].isEmpty { // Проверяем, пуст ли массив данных для секции 1
                    headerView.isHidden = true // Если пуст, скрываем заголовок
                } else {
                    headerView.isHidden = false
                    headerView.titleLabel.text = "Inactive widgets"
                    headerView.allButton.isHidden = true
                    headerView.chevronButton.isHidden = true
                }
            default :
                headerView.isHidden = true
            }
            return headerView
        }
        return UICollectionReusableView()
    }
}
