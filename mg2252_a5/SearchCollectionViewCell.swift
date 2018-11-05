//
//  SearchCollectionViewCell.swift
//  mg2252_a5
//
//  Created by Medhavi Gandhi on 11/4/18.
//  Copyright © 2018 Medhavi Gandhi. All rights reserved.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    var search: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        search = UILabel()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.font = UIFont(name: search.font.fontName, size: 11)
        search.backgroundColor = .gray
        contentView.addSubview(search)
    }
    override func updateConstraints() {
        NSLayoutConstraint.activate([
            search.leadingAnchor.constraint(equalTo: contentView.leadingAnchor ),
            search.topAnchor.constraint(equalTo: contentView.topAnchor),
            search.trailingAnchor.constraint(equalTo: contentView.trailingAnchor ),
            search.heightAnchor.constraint(equalToConstant: 25)
            ])
        super.updateConstraints()
        
    }
    override var isSelected: Bool{
        didSet{
            if self.isSelected
            {
                
                for (restaurant: restArray) {
                    
                }
        
            }
            else
            {
                //This block will be executed whenever the cell’s selection state is set to false (i.e For the rest of the cells)
            }
        }
    }
    func configure(for category: Category) {
       search.text = category.rawValue
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
