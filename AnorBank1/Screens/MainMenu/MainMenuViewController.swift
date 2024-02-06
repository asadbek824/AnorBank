//
//  MainMenuViewController.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 21/01/24.
//

import UIKit

final class MainMenuViewController: UIViewController {
    
    //MARK: - UIElements
    private let mainView = MainView()
    private let presenter: MainViewPresenterable
    private let mainReesableView = MainBalanceReusableView()
    
    init(presenter: MainViewPresenterable) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        super.loadView()
        
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .appColor.primary
        
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
        
        mainReesableView.delegate = self
        
        setUpNavigationBar()
    }
    
    //MARK: - @objc functions
    @objc private func leftBarButtonTapped() {
        
        pushVC(with: ProfileViewController(profilePresenter: ProfilePresenter()))
    }
    
    @objc private func rightBellBarButtonTapped() {
        
        pushVC(with:  NotificationViewController())
    }
    
    @objc private func rightMassageBarButtonTapped() {
        
        pushVC(with: SupportViewController())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - extension to MainMenuViewController
extension MainMenuViewController: UIScrollViewDelegate {
    
    private func setUpNavigationBar() {
        
        navigationItem.title = "ANORBANK"
        navigationController?.navigationBar.barTintColor = .appColor.primary
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        let rightBellBarButton = UIBarButtonItem(
            image: UIImage(systemName: "bell.fill"),
            style: .plain,
            target: self,
            action: #selector(rightBellBarButtonTapped)
        )
        let rightMassageBarButton = UIBarButtonItem(image: UIImage(systemName: "ellipsis.message.fill"), style: .plain, target: self, action: #selector(rightMassageBarButtonTapped))
        let leftBarButton = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(leftBarButtonTapped))
        
        leftBarButton.tintColor = .white
        rightBellBarButton.tintColor = .white
        rightMassageBarButton.tintColor = .white
        navigationItem.leftBarButtonItem = leftBarButton
        navigationItem.rightBarButtonItems = [rightBellBarButton, rightMassageBarButton]
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let color = UIColor.appColor.primary
        
        navigationController?.navigationBar.barTintColor = color
    }
}

//MARK: - extension to MainMenuViewController UICollectionViewDelegateFlowLayout, UICollectionViewDataSource
extension MainMenuViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        presenter.numberOfSections(in: collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.numberOfItemsInSection(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        presenter.cellForItemAt(collectionView: collectionView, at: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            
            
            guard let sectionType = MainViewSectionTypes(rawValue: indexPath.section) else { return UICollectionViewCell() }
            
            switch sectionType {
            case .transferView:
                guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerView", for: indexPath) as? MainBalanceReusableView else {
                    return UICollectionReusableView()
                }
                
                headerView.titleLabel.text = "Total Balance"
                headerView.totalBalanceButton.setImage(UIImage(systemName: "arrow.up.right.bottomleft.rectangle"), for: .normal)
                headerView.balanceButton.setTitle("0.00 UZS", for: .normal)
                headerView.settingsButton.setImage(UIImage(systemName: "text.line.first.and.arrowtriangle.forward"), for: .normal)
                headerView.seeButton.setImage(UIImage(systemName: "eye"), for: .normal)
                headerView.backgroundColor = .clear
                headerView.delegate = self
                
                return headerView
            case .becomecCliennt:
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerView", for: indexPath)
                
                return headerView
            case .promtView:
                guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerView1", for: indexPath) as? SectionHeaders else {
                    return UICollectionReusableView()
                }
                
                headerView.titleLabel.text = "Prompt"
                headerView.chevronButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
                headerView.allButton.isHidden = true
                headerView.layer.cornerRadius = 20
                
                headerView.applyShadow(withHeight: headerView.bounds.height / 2)
                
                return headerView
            case .cashback:
                guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerView1", for: indexPath) as? SectionHeaders else {
                    return UICollectionReusableView()
                }
                
                headerView.titleLabel.text = "Cashback"
                headerView.chevronButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
                headerView.allButton.isHidden = true
                headerView.layer.cornerRadius = 20
                
                headerView.applyShadow(withHeight: headerView.bounds.height / 2)
                
                return headerView
            case .cards:
                guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerView1", for: indexPath) as? SectionHeaders else {
                    return UICollectionReusableView()
                }
                
                headerView.titleLabel.text = "My cards"
                headerView.chevronButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
                headerView.allButton.setTitle("All", for: .normal)
                headerView.layer.cornerRadius = 20
                
                headerView.applyShadow(withHeight: headerView.bounds.height / 2)
                
                return headerView
            case .saved:
                guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerView1", for: indexPath) as? SectionHeaders else {
                    return UICollectionReusableView()
                }
                
                headerView.titleLabel.text = "Saved"
                headerView.chevronButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
                headerView.allButton.setTitle("All", for: .normal)
                headerView.layer.cornerRadius = 20
                
                headerView.applyShadow(withHeight: headerView.bounds.height / 2)
                
                return headerView
            case .credits:
                guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerView1", for: indexPath) as? SectionHeaders else { return UICollectionReusableView() }
                
                headerView.titleLabel.text = "Credits"
                headerView.chevronButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
                headerView.allButton.setTitle("All", for: .normal)
                headerView.layer.cornerRadius = 20
                
                headerView.applyShadow(withHeight: headerView.bounds.height / 2)
                
                return headerView
            case .deposits:
                guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerView1", for: indexPath) as? SectionHeaders else { return UICollectionReusableView() }
                
                headerView.titleLabel.text = "Deposits"
                headerView.chevronButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
                headerView.allButton.setTitle("All", for: .normal)
                headerView.allButton.isHidden = false
                headerView.layer.cornerRadius = 20
                
                headerView.applyShadow(withHeight: headerView.bounds.height / 2)
                
                return headerView
            case .home:
                guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerView1", for: indexPath) as? SectionHeaders else { return UICollectionReusableView() }
                
                headerView.titleLabel.text = "My home"
                headerView.chevronButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
                headerView.allButton.setTitle("All", for: .normal)
                headerView.allButton.isHidden = false
                headerView.layer.cornerRadius = 20
                
                headerView.applyShadow(withHeight: headerView.bounds.height / 2)
                
                return headerView
            case .exchange:
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerView", for: indexPath)
                
                return headerView
            }
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        presenter.willDisplay(cell)
    }
}

extension MainMenuViewController: MainBalanceReusableViewDelegate {
    
    func settingsButtonTapped() {
        let WidgetsViewController = WidgetsViewController(presenter: WidgetsPresenter())
        navigationController?.pushViewController(WidgetsViewController, animated: true)
     }
}
