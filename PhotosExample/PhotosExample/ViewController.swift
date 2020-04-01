//
//  ViewController.swift
//  PhotosExample
//
//  Created by Terry on 2020/04/01.
//  Copyright © 2020 Terry. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController,UITableViewDataSource{
 
    @IBOutlet weak var tableView: UITableView!
    var fetchResult: PHFetchResult<PHAsset>!
    let imageManager: PHCachingImageManager = PHCachingImageManager()
    let cellIdentifier: String = "cell"
    
    func requestCollection() {
        let cameraRoll: PHFetchResult<PHAssetCollection> = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumUserLibrary, options: nil)
    
    
    guard let cameraRollCollection = cameraRoll.firstObject else{
        return
    }
    
    let fetchOptions = PHFetchOptions()
    fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
    self.fetchResult = PHAsset.fetchAssets(in: cameraRollCollection, options: fetchOptions)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let photoAurhorizationStatus = PHPhotoLibrary.authorizationStatus()
        
        //사진첩 접근 유무 확인
        switch photoAurhorizationStatus {
        case .authorized:
            print("접근허가됨")
            self.requestCollection()
            OperationQueue.main.addOperation {
                self.tableView.reloadData()
            }

        case .denied:
            print("접근 불허")
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization({(status) in
                switch status{
                case .authorized:
                    print("사용자가 허용함")
                    self.requestCollection()
                case .denied:
                    print("사용자가 불허함")
                default: break
                }
            })
        case .restricted:
            print("접근 제한")
        @unknown default: break
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.fetchResult?.count ?? 0
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        let asset: PHAsset = fetchResult.object(at: indexPath.row)
        
        imageManager.requestImage(for: asset, targetSize: CGSize(width: 30, height: 30), contentMode: .aspectFill, options: nil, resultHandler: {image, _ in cell.imageView?.image = image})
        return cell
    }
     


}

