//
//  ViewController.swift
//  mg2252_a5
//
//  Created by Medhavi Gandhi on 11/3/18.
//  Copyright © 2018 Medhavi Gandhi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return restArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: photoCellReuseIdentifier, for: indexPath) as! PhotoCollectionViewCell
        let restaurant = restArray[indexPath.item]
        cell.configure(for: restaurant)
        cell.setNeedsUpdateConstraints()
        
        return cell
    }
    
    var collectionView: UICollectionView!
    var refreshControl: UIRefreshControl!
    var restArray: [Restaurant]!
    
    let padding: CGFloat = 8
    let headingHeight: CGFloat = 50
    let photoCellReuseIdentifier = "photoCellReuseIdentifier"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "Restaurants"
        view.backgroundColor = .white
        
        let aladdins = Restaurant(imageName: "Aladdins", restType: "Mediterranean", restRating: 9, restName: "Aladdins")
        let viva = Restaurant(imageName: "Viva", restType: "Mexican", restRating: 8, restName: "Viva")
        let wingsOver = Restaurant(imageName: "Wings", restType: "Fast Food", restRating: 9, restName: "Wings over Ithaca")
        let asiacuisine = Restaurant(imageName: "AsiaCuisine", restType: "Korean", restRating: 10, restName: "Asia Cuisine")
        let sopoong = Restaurant(imageName: "Sopoong", restType: "Korean", restRating: 8, restName: "So Poong")
        let plumtree = Restaurant(imageName: "Plumtree", restType: "Japanese", restRating: 7, restName: "Plum Tree")
        let ctb = Restaurant(imageName: "CTB", restType: "American", restRating: 5, restName: "CollegeTown Bagels")
        let saigon = Restaurant(imageName: "Saigon", restType: "Vietnamese", restRating: 9, restName: "Saigon Kitchen")
        let chipotle = Restaurant(imageName: "Chipotle", restType: "Fast Food", restRating: 7, restName: "Chipotle")
        let mehak = Restaurant(imageName: "Mehak", restType: "Indian", restRating: 8, restName: "Mehak")
        restArray = [mehak, aladdins, viva, chipotle, wingsOver, saigon, ctb, plumtree, asiacuisine, sopoong]
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(pulledToRefresh), for: .valueChanged)

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = padding
        layout.minimumLineSpacing = padding
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.refreshControl = refreshControl
        view.addSubview(collectionView)
        
        setupConstraints()
        
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
    }

    @objc func pulledToRefresh() {
        // Place some code here that fetches new data
        // Then call refreshControl.endRefreshing() once we get that data back
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.refreshControl.endRefreshing()
        }
    }

}

