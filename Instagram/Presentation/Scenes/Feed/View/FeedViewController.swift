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
        collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: FeedCell.identifier)
    }
}

extension FeedViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCell.identifier, for: indexPath) as? FeedCell else { fatalError("Unexpected indexPath") }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 200)
    }
}
