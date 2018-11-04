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
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        restPhotoView = UIImageView(frame: .zero)
        restPhotoView.translatesAutoresizingMaskIntoConstraints = false
        restPhotoView.contentMode = .scaleAspectFit
        contentView.addSubview(restPhotoView)

    }
    override func updateConstraints() {
        NSLayoutConstraint.activate([
        restPhotoView.topAnchor.constraint(equalTo: contentView.topAnchor),
        restPhotoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        restPhotoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        restPhotoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)])
        super.updateConstraints()
    }
    func configure(for restaurant: Restaurant) {
        restPhotoView.image = UIImage(named: restaurant.profileimgName)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
   }
}
