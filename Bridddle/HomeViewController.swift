//
//  HomeViewController.swift
//  Bridddle
//
//  Created by nguyen.thanh.hai on 6/8/17.
//  Copyright © 2017 Hai Nguyen. All rights reserved.
//

import UIKit



class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    //MARK: Properties
    fileprivate let reuseIdentifier = "ImageCell"
    var shots = [Shot]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shots.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 0
        let collectionCellSize = collectionView.frame.size.width - padding
        let width = collectionCellSize/2
        let height = width*3/4
        
        return CGSize(width: width, height: height)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                for: indexPath) as? ImageViewCell else {
            fatalError("Not an instance of ImageViewCell")
        }
        
        // Configure the cell
        let shot = shots[indexPath.row]
        cell.imageView.downloadedFrom(link: shot.url)
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

    //MARK: Private Methods
    func loadSampleData() {
        let shot1: Shot = Shot(url: "https://cdn.dribbble.com/users/31752/screenshots/3551078/asana_summer_of_love.jpg")
        let shot2: Shot = Shot(url: "https://cdn.dribbble.com/users/31752/screenshots/3551035/cover_new_hire_book_comp.jpg")
        let shot3 = Shot(url: "https://cdn.dribbble.com/users/35381/screenshots/3550771/bike.png")
        
        shots += [shot1, shot2, shot3]
        
    }
}
