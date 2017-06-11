// AlbumController.swift

import UIKit
import Photos

class AlbumController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var albums: [PHAssetCollection] = []
    private let assetFacade: AssetFacade = AssetFacade()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.albums = self.assetFacade.fetchAlbums()

        self.collectionView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.albums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: AlbumCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumCollectionViewCell", for: indexPath) as! AlbumCollectionViewCell
        
        let album: PHAssetCollection = self.albums[indexPath.row]
        cell.titleLabel.text = album.localizedTitle
        cell.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)

        return cell
    }
}

class AlbumCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
}
