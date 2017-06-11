//
//  AssetFacade.swift
//  AlbumPicker
//
//  Created by Shintaro Kaneko on 6/11/17.
//  Copyright © 2017 kaneshin.co. All rights reserved.
//

import Foundation
import Photos

class AssetFacade {
    
    func fetchAlbums() -> [PHAssetCollection] {
        var list: [PHAssetCollection] = []
        
        var collectionTypes: [(PHAssetCollectionType, PHAssetCollectionSubtype)] = []

        collectionTypes.append((.smartAlbum, .smartAlbumUserLibrary))
        if #available(iOS 9.0, *) {

            collectionTypes.append((.smartAlbum, .smartAlbumSelfPortraits))
        }
        collectionTypes.append((.smartAlbum, .smartAlbumPanoramas))
        collectionTypes.append((.smartAlbum, .smartAlbumFavorites))
        collectionTypes.append((.smartAlbum, .smartAlbumGeneric))

        collectionTypes.append((.album, .albumRegular))

        for type in collectionTypes {

            PHAssetCollection.fetchAssetCollections(with: type.0, subtype: type.1, options: nil).enumerateObjects({ (collection, _, _) in

                list.append(collection)
            })
        }
 
        return list
    }

}
