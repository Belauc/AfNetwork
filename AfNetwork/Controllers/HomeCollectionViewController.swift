//
//  HomeCollectionViewController.swift
//  AfNetwork
//
//  Created by Sergey on 26.01.2022.
//

import UIKit
import Alamofire


class HomeCollectionViewController: UICollectionViewController {
    
    let numberOfItemsInLine: CGFloat = 2
    let edgeInserts: UIEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    var animeList = [Anime]()
    let networkManager = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()
    
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


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return animeList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! animeCell
        cell.labelAnime.text = animeList[indexPath.item].anime_name
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        networkManager.fetchAnimeList { [weak self] (animeList) in
            self?.animeList = animeList
            DispatchQueue.main.async { [weak self] in
                self?.collectionView.reloadData()
            }
        }
        
    }

}

extension HomeCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let avilabaleSize = collectionView.frame.width - (numberOfItemsInLine + 1) * edgeInserts.left
        let widhtOneItem = avilabaleSize / numberOfItemsInLine
        return CGSize(width: widhtOneItem, height: widhtOneItem * 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: edgeInserts.left, left: edgeInserts.left, bottom: edgeInserts.left, right: edgeInserts.left)
    }
}
