//
//  SegmentNotificationView.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 02/02/24.
//

import UIKit

struct CellData {
    
    let image: UIImage
    let title: String
    let time: String
    let classification: String
    let button: String
}

final class SegmentNotificationView: UIView {
    
    //MARK: - UIElement
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: UIScreen.main.bounds.width - 32, height: 130)
        layout.minimumLineSpacing = 20
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(SegmentNotificationViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    
    //MARK: - Data
    private var cellData: [CellData] = [
        CellData.init(image: UIImage(named: "anorIcon")!, title: "!! ANORBANK ajoyib aksiya tugashiga juda oz fursat qoldi!", time: "13.04.2023", classification: " Eslatib o‘tamiz, 17-martdan 17-aprelgacha hamkorlarimizdan mahsulotlarni xarid qilsangiz, ajoyib Aksiyamiz ishtirokchisiga aylanishingiz mumkin bo'ladi. Aksiya shartlarigako'ra  5 nafar g'oliblar muddatli to'lov summasini bank ", button: "xmark"),
        CellData.init(image: UIImage(named: "anorIcon")!, title: "!! ANORBANK ajoyib aksiya tugashiga juda oz fursat qoldi!", time: "13.04.2023", classification: " Eslatib o‘tamiz, 17-martdan 17-aprelgacha hamkorlarimizdan mahsulotlarni xarid qilsangiz, ajoyib Aksiyamiz ishtirokchisiga aylanishingiz mumkin bo'ladi. Aksiya shartlarigako'ra  5 nafar g'oliblar muddatli to'lov summasini bank ", button: "xmark"),
        CellData.init(image: UIImage(named: "anorIcon")!, title: "!! ANORBANK ajoyib aksiya tugashiga juda oz fursat qoldi!", time: "13.04.2023", classification: " Eslatib o‘tamiz, 17-martdan 17-aprelgacha hamkorlarimizdan mahsulotlarni xarid qilsangiz, ajoyib Aksiyamiz ishtirokchisiga aylanishingiz mumkin bo'ladi. Aksiya shartlarigako'ra  5 nafar g'oliblar muddatli to'lov summasini bank ", button: "xmark"),
        CellData.init(image: UIImage(named: "anorIcon")!, title: "!! ANORBANK ajoyib aksiya tugashiga juda oz fursat qoldi!", time: "13.04.2023", classification: " Eslatib o‘tamiz, 17-martdan 17-aprelgacha hamkorlarimizdan mahsulotlarni xarid qilsangiz, ajoyib Aksiyamiz ishtirokchisiga aylanishingiz mumkin bo'ladi. Aksiya shartlarigako'ra  5 nafar g'oliblar muddatli to'lov summasini bank ", button: "xmark"),
        CellData.init(image: UIImage(named: "anorIcon")!, title: "!! ANORBANK ajoyib aksiya tugashiga juda oz fursat qoldi!", time: "13.04.2023", classification: " Eslatib o‘tamiz, 17-martdan 17-aprelgacha hamkorlarimizdan mahsulotlarni xarid qilsangiz, ajoyib Aksiyamiz ishtirokchisiga aylanishingiz mumkin bo'ladi. Aksiya shartlarigako'ra  5 nafar g'oliblar muddatli to'lov summasini bank ", button: "xmark"),
        CellData.init(image: UIImage(named: "anorIcon")!, title: "!! ANORBANK ajoyib aksiya tugashiga juda oz fursat qoldi!", time: "13.04.2023", classification: " Eslatib o‘tamiz, 17-martdan 17-aprelgacha hamkorlarimizdan mahsulotlarni xarid qilsangiz, ajoyib Aksiyamiz ishtirokchisiga aylanishingiz mumkin bo'ladi. Aksiya shartlarigako'ra  5 nafar g'oliblar muddatli to'lov summasini bank ", button: "xmark"),
        CellData.init(image: UIImage(named: "anorIcon")!, title: "!! ANORBANK ajoyib aksiya tugashiga juda oz fursat qoldi!", time: "13.04.2023", classification: " Eslatib o‘tamiz, 17-martdan 17-aprelgacha hamkorlarimizdan mahsulotlarni xarid qilsangiz, ajoyib Aksiyamiz ishtirokchisiga aylanishingiz mumkin bo'ladi. Aksiya shartlarigako'ra  5 nafar g'oliblar muddatli to'lov summasini bank ", button: "xmark")
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(collectionView)
        
        collectionView.setConstraint(.top, from: self, 10)
        collectionView.setConstraint(.bottom, from: self, 0)
        collectionView.setConstraint(.left, from: self, 0)
        collectionView.setConstraint(.right, from: self, 0)
        
        NotificationCenter.default.addObserver(self, selector: #selector(removeItem(_:)), name: Notification.Name("RemoveItem"), object: nil)
           
    }
    
    @objc func removeItem(_ notification: Notification) {
            guard let indexPath = notification.object as? IndexPath else {
                return
            }
            
            // Удаление элемента из массива cellData
            if indexPath.item < cellData.count {
                cellData.remove(at: indexPath.item)
                // Обновление коллекции
                collectionView.deleteItems(at: [indexPath])
            }
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SegmentNotificationView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cellData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? SegmentNotificationViewCell else { return UICollectionViewCell() }
        
        let data = cellData[indexPath.item]
        
        cell.imageView.image = data.image
        cell.timeLabel.text = data.time
        cell.titleLabel.text = data.title
        cell.classificationLabel.text = data.classification
        cell.xButton.setImage(UIImage(systemName: data.button), for: .normal)
        
        return cell
    }
}
