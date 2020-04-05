//
//  ViewController.swift
//  FriendsCollection
//
//  Created by Terry on 2020/04/04.
//  Copyright © 2020 Terry. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
    
//    var numberOfCell: Int = 10
    let cellIdentifier: String = "cell"
    var frinds:[Friend] = []
    @IBOutlet weak var collectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return self.numberOfCell
        return self.frinds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //강제 캐스팅은 안좋은 방법이라 더 좋은 방법 강구
        let cell: FriendCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath) as! FriendCollectionViewCell
        
        let friend: Friend = self.frinds[indexPath.item]
        cell.nameAgeLabel.text = friend.nameAndAge
        cell.adressLabel.text = friend.fullAddress
        return cell
    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
//        self.numberOfCell += 1
//        collectionView.reloadData()
//    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let flowLayout: UICollectionViewFlowLayout //인스턴스생성
        //프로퍼티값 세팅
        flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets.zero
        
        flowLayout.minimumLineSpacing = 10//아이템간의 거리
        flowLayout.minimumInteritemSpacing = 10
        
        let halfWidth: CGFloat = UIScreen.main.bounds.width / 2.0
        flowLayout.estimatedItemSize = CGSize(width: halfWidth - 30 , height: 90) //예상사이즈 오토레이아웃을 적용해 놔서 가변적일 수 있어서 예상사이즈 세팅
        
        self.collectionView.collectionViewLayout = flowLayout //컬렉션뷰 레이아웃에 세팅 하기

        
        //json 호출
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset:NSDataAsset = NSDataAsset(name: "friends") else {
            return
        }
        
        do{
            self.frinds = try jsonDecoder.decode([Friend].self, from: dataAsset.data)
        }catch{
            print(error.localizedDescription)
        }
        self.collectionView.reloadData()
    }


}

