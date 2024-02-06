//
//  WidgetsViewController.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 25/01/24.
//

import UIKit

final class WidgetsViewController: UIViewController {
    
    //MARK: - UIElements
    private let widgetsView = WidgetsView()
    private let presenter: WidgetsViewPresenterable
    
    init(presenter: WidgetsViewPresenterable) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
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
        
        view = widgetsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        widgetsView.collectionView.dataSource = self
        widgetsView.collectionView.delegate = self
        
        setUpBackButton()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - extension to WidgetsViewController
extension WidgetsViewController: UIScrollViewDelegate {
    
    private func setUpNvigation() {
        
        title = "Widgets"
        setUpBackButton()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let color = UIColor.white
        
        navigationController?.navigationBar.barTintColor = color
    }
}

//MARK: - extension to collectionView Delegate and DataSource
extension WidgetsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
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
        presenter.collectionView(collectionView, viewForSupplementaryElementOfKind: kind, at: indexPath)
    }
}
