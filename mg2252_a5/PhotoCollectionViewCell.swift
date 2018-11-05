//
//  PhotoCollectionViewCell.swift
//  mg2252_a5
//
//  Created by Medhavi Gandhi on 11/3/18.
//  Copyright © 2018 Medhavi Gandhi. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    var restPhotoView: UIImageView!
    var nameLabel: UILabel!
    var ratingLabel: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = .black
        ratingLabel = UILabel()
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        restPhotoView = UIImageView(frame: .zero)
        restPhotoView.translatesAutoresizingMaskIntoConstraints = false
        restPhotoView.contentMode = .scaleAspectFit
        contentView.addSubview(restPhotoView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(ratingLabel)

    }
    override func updateConstraints() {
        NSLayoutConstraint.activate([
            restPhotoView.topAnchor.constraint(equalTo: contentView.topAnchor ),
            restPhotoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor ),
            restPhotoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40),
            restPhotoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor )])
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: restPhotoView.leadingAnchor ),
            nameLabel.topAnchor.constraint(equalTo: restPhotoView.bottomAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor ),
            nameLabel.heightAnchor.constraint(equalToConstant: 25)
            ])
        NSLayoutConstraint.activate([
            ratingLabel.leadingAnchor.constraint(equalTo: restPhotoView.leadingAnchor),
            ratingLabel.topAnchor.constraint(equalTo: restPhotoView.bottomAnchor, constant: 10),
            ratingLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
            ratingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            ])
        
        super.updateConstraints()
    }
    func configure(for restaurant: Restaurant) {
        restPhotoView.image = UIImage(named: restaurant.profileimgName)
        nameLabel.text = restaurant.name
        ratingLabel.text = "\(restaurant.rating!)/10"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
   }
}
