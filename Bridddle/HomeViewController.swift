//
//  HomeViewController.swift
//  Bridddle
//
//  Created by nguyen.thanh.hai on 6/8/17.
//  Copyright © 2017 Hai Nguyen. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    //MARK: Properties
    fileprivate let reuseIdentifier = "ImageCell"
    var shots = [Shot]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleData()
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
        cell.imageView.downloadedFrom(link: shot.url!)
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
        var keys: NSDictionary?
        if let path = Bundle.main.path(forResource: "Keys", ofType: "plist") {
            keys = NSDictionary(contentsOfFile: path)
        }
        if let dict = keys {
            let accessToken = dict["clientAccessToken"] as? String
            
            
            let URL = "https://api.dribbble.com/v1/shots?access_token=\(accessToken!)"
            
            Alamofire.request(URL).responseArray { (response: DataResponse<[Shot]>) in
                
                let shotArray = response.result.value
                self.shots.removeAll()
                if let shotArray = shotArray {
                    for shot in shotArray {
                        self.shots.append(shot)
                    }
                }
                self.collectionView?.reloadData()
            }
        }
    }
}
