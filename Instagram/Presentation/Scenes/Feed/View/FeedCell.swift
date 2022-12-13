//
//  FeedCell.swift
//  Instagram
//
//  Created by sanaz bahmankhah on 13/12/2022.
//

import Foundation
import UIKit

final class FeedCell: UICollectionViewCell {
    static let identifier = "feedCell"
    
    private let profile = UIImageView()
    private let postImage = UIImageView()
    private let stackView = UIStackView()
    private let name = UIButton()
    private let like = UIButton()
    private let comment = UIButton()
    private let share = UIButton()
    private let likeNumber = UILabel()
    private let captionLabel = UILabel()
    private let lastUpdatedLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configButtons()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        setupProfile()
        setupUsernameButton()
        setupPostImage()
        setupButtons()
        setupLikeNumber()
        setupCaptionLabel()
        setupLastUpdatedLabel()
    }
    
    func setupProfile() {
        profile.image = UIImage(named: "profile")
        addSubview(profile)
        profile.contentMode = .scaleAspectFill
        profile.clipsToBounds = true
        profile.layer.cornerRadius = 40/2
        profile.translatesAutoresizingMaskIntoConstraints = false
        profile.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        profile.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        profile.widthAnchor.constraint(equalToConstant: 40.0).isActive = true
        profile.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
    }
    
    func setupUsernameButton() {
        addSubview(name)
        name.addTarget(self, action: #selector(didTapUsername), for: .touchUpInside)
        name.setTitle("venom", for: .normal)
        name.setTitleColor(.black, for: .normal)
        name.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        name.leadingAnchor.constraint(equalTo: profile.trailingAnchor, constant: 10).isActive = true
    }
    
    @objc func didTapUsername() {
        print("tapped on username")
    }
    
    func setupPostImage() {
        addSubview(postImage)
        postImage.image = UIImage(named: "profile")
        postImage.translatesAutoresizingMaskIntoConstraints = false
        postImage.topAnchor.constraint(equalTo: profile.bottomAnchor, constant: 5).isActive = true
        postImage.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        postImage.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    func configButtons() {
        like.setImage(UIImage(systemName: "heart"), for: .normal)
        like.tintColor = .black
        comment.setImage(UIImage(systemName: "message"), for: .normal)
        comment.tintColor = .black
        share.setImage(UIImage(systemName: "arrowshape.turn.up.right"), for: .normal)
        share.tintColor = .black
    }
    
    func setupButtons() {
        addSubview(stackView)
        stackView.addArrangedSubview(like)
        stackView.addArrangedSubview(comment)
        stackView.addArrangedSubview(share)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 5).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50).isActive = true
    }
    
    func setupLikeNumber() {
        addSubview(likeNumber)
        likeNumber.text = "1 like"
        likeNumber.font = UIFont.boldSystemFont(ofSize: 12)
        likeNumber.translatesAutoresizingMaskIntoConstraints = false
        likeNumber.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10).isActive = true
        likeNumber.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
    }
    
    func setupCaptionLabel() {
        addSubview(captionLabel)
        captionLabel.text = "Some caption for now ..."
        captionLabel.font = UIFont.boldSystemFont(ofSize: 12)
        captionLabel.translatesAutoresizingMaskIntoConstraints = false
        captionLabel.topAnchor.constraint(equalTo: likeNumber.bottomAnchor, constant: 5).isActive = true
        captionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
    }
    
    func setupLastUpdatedLabel() {
        addSubview(lastUpdatedLabel)
        lastUpdatedLabel.text = "2 days ago"
        lastUpdatedLabel.font = UIFont.systemFont(ofSize: 12)
        lastUpdatedLabel.textColor = .systemGray
        lastUpdatedLabel.translatesAutoresizingMaskIntoConstraints = false
        lastUpdatedLabel.topAnchor.constraint(equalTo: captionLabel.bottomAnchor, constant: 5).isActive = true
        lastUpdatedLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
    }
}
