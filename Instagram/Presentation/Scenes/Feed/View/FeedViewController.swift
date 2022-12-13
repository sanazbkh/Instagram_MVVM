//
//  FeedViewController.swift
//  Instagram
//
//  Created by sanaz bahmankhah on 08/12/2022.
//

import Foundation
import UIKit

final class FeedViewController: UIViewController {
    private let layout = UICollectionViewFlowLayout()
    private var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        registerCell()
    }
    
    func setupCollectionView() {
        self.collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        guard let collectionView = self.collectionView else { return }
        self.view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func registerCell() {
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "reuseIdentifier")
    }
}

extension FeedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reuseIdentifier", for: indexPath)
        cell.backgroundColor = .green
        return cell
    }
}
