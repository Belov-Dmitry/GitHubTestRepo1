//
//  FriendsCollectionViewController.swift
//  VKClient
//
//  Created by Dmitry Belov on 14.11.2021.
//

import UIKit


class FriendsCollectionViewController: UICollectionViewController {

    private var photosAPI = PhotosAPI()
    private var photos: [Photos] = []
//    private var size: [Size] = []

    override func viewDidLoad() {
        super.viewDidLoad()

       print("=================")
        //cell.textLabel?.text = "\(friend.firstName) \(friend.lastName)"
        print(size)
        print("=================")
        
        
//        collectionView.register(UICollectionViewCell.self, forCellReuseIdentifier: "Cell")

        photosAPI.getPhotos { [weak self] photos in
            guard let self = self else { return }

            self.photos = photos
            self.collectionView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count

    }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)

            let photos: Photos = photos[indexPath.row]

//            cell.textLabel?.text = "\(photos.name)"

//
//            if let url = URL(string: photos.photo100) {
//                cell.imageView?.sd_setImage(with: url, completed: nil)
//            }


        return cell
    }

}
}
