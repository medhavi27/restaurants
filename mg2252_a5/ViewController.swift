//
//  ViewController.swift
//  mg2252_a5
//
//  Created by Medhavi Gandhi on 11/3/18.
//  Copyright © 2018 Medhavi Gandhi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var restaurantCollectionView: UICollectionView!
    var filterCollectionView: UICollectionView!
    var refreshControl: UIRefreshControl!
    var restArray: [Restaurant]!
    
    let padding: CGFloat = 8
    let headingHeight: CGFloat = 50
    let photoCellReuseIdentifier = "photoCellReuseIdentifier"
    let searchCellReuiseIdentifier = "searchCellReuseIdentifier"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "Restaurants"
        view.backgroundColor = .white
        
        let aladdins = Restaurant(imageName: "Aladdins", restType: "Mediterranean", restRating: 7, restName: "Aladdins")
        let viva = Restaurant(imageName: "Viva", restType: "Mexican", restRating: 8, restName: "Viva")
        let wingsOver = Restaurant(imageName: "Wings", restType: "Fast Food", restRating: 6, restName: "Wings over Ithaca")
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
        restaurantCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        restaurantCollectionView.translatesAutoresizingMaskIntoConstraints = false
        restaurantCollectionView.backgroundColor = .white
        restaurantCollectionView.dataSource = self
        restaurantCollectionView.delegate = self
        restaurantCollectionView.refreshControl = refreshControl
        restaurantCollectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: photoCellReuseIdentifier)
        view.addSubview(restaurantCollectionView)
        
        let searchlayout = UICollectionViewFlowLayout()
        searchlayout.scrollDirection = .horizontal
        filterCollectionView = UICollectionView(frame: .zero, collectionViewLayout: searchlayout)
        filterCollectionView.translatesAutoresizingMaskIntoConstraints = false
        filterCollectionView.backgroundColor = .white
        filterCollectionView.dataSource = self
        filterCollectionView.delegate = self
        filterCollectionView.refreshControl = refreshControl
        filterCollectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: searchCellReuiseIdentifier)
        view.addSubview(filterCollectionView)
        
        setupConstraints()
        
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            filterCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            filterCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             filterCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             filterCollectionView.heightAnchor.constraint(equalToConstant: 50)
            ])
        NSLayoutConstraint.activate([
            restaurantCollectionView.topAnchor.constraint(equalTo: filterCollectionView.bottomAnchor, constant: 5),
            restaurantCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            restaurantCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            restaurantCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
    }

    @objc func pulledToRefresh() {
        // Place some code here that fetches new data
        // Then call refreshControl.endRefreshing() once we get that data back
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.refreshControl.endRefreshing()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == restaurantCollectionView{
        return restArray.count
    }
        else {
            return Category.allCases.count
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // We want || padding IMAGE padding IMAGE padding IMAGE padding ||
        if collectionView == restaurantCollectionView{
        let length = (collectionView.frame.width - padding * 4) / 2.0
        return CGSize(width: length, height: length)
        }
        else {
            let length = (collectionView.frame.width - padding) / 10.0
            return CGSize(width: length, height: length)
        }
    }
    

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == restaurantCollectionView{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: photoCellReuseIdentifier, for: indexPath) as! PhotoCollectionViewCell
        let restaurant = restArray[indexPath.item]
        cell.configure(for: restaurant)
        cell.setNeedsUpdateConstraints()
        
        return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: searchCellReuiseIdentifier, for: indexPath) as! SearchCollectionViewCell
            cell.configure(for: Category.allCases[indexPath.item])
            cell.setNeedsUpdateConstraints()
            
            return cell
        }
    }
}
