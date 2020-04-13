//
//  PlanetsCollectionViewController.swift
//  CodePlanets
//
//  Created by Ben Gohlke on 4/13/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class PlanetsCollectionViewController: UIViewController, UICollectionViewDataSource {

    // MARK: - Properties
    let planetController = PlanetController()
    private var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Our Planets"
        
        configureCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }
    
    private func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 160, height: 190)
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        
        let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        
        view.addSubview(collectionView)
        
        collectionView.register(PlanetCollectionViewCell.self, forCellWithReuseIdentifier: "PlanetCell")
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        
        self.collectionView = collectionView
    }

    // MARK: - UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return planetController.planets.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlanetCell", for: indexPath) as! PlanetCollectionViewCell

        let planet = planetController.planets[indexPath.item]
        
        cell.planet = planet
    
        return cell
    }

    // MARK: - Action Handlers
    
   

}
