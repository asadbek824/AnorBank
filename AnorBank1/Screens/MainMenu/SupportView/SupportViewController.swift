//
//  SupportViewController.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 25/01/24.
//

import UIKit

final class SupportViewController: UIViewController {
    
    //MARK: - UIElements
    let supportView = SupportView()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    override func loadView() {
        super.loadView()
        
        view = supportView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        supportView.collectionView.dataSource = self
        supportView.collectionView.delegate = self
        supportView.collectionView.delegate = self
        
        setNavigation()
    }
    
    @objc private func leftBarButtonTapped() {
        
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - extension to SupportViewController
extension SupportViewController: UIScrollViewDelegate {
    
    private func setNavigation() {
        
        navigationItem.title = "Support"
        
        let leftBarButton = UIBarButtonItem(
            image: UIImage(systemName: "chevron.left"),
            style: .plain,
            target: self,
            action: #selector(leftBarButtonTapped)
        )
        
        leftBarButton.tintColor = .appColor.primary
        navigationItem.leftBarButtonItem = leftBarButton
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let color = UIColor.white
        
        navigationController?.navigationBar.barTintColor = color
    }
}

//MARK: - collectionView Delegate and DataSource

extension SupportViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { 2 }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? SupportCell else { return UICollectionViewCell() }
        
        // TODO: To enum
        switch indexPath.row {
        case 0 :
            cell.imageView.image = UIImage(named: "writeToChat")
        case 1 :
            cell.imageView.image = UIImage(named: "callToBank")
        default :
            cell.imageView.isHidden = true
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0 :
            break
        case 1 :
            if let smsURL = URL(string: "map:") {
                UIApplication.shared.open(smsURL, options: [:], completionHandler: nil)
            } else {
                print("Не удалось открыть приложение для отправки сообщений.")
            }
        default :
            break
        }
    }
}
