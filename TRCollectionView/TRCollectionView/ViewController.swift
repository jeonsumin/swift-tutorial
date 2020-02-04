//
//  ViewController.swift
//  TRCollectionView
//
//  Created by iMac on 2020. 2. 4..
//  Copyright © 2020년 iMac. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    //Assets iamge 가져오기
    let images = [#imageLiteral(resourceName: "bg1"), #imageLiteral(resourceName: "bg2") ,#imageLiteral(resourceName: "bg3"),#imageLiteral(resourceName: "bg1"), #imageLiteral(resourceName: "bg2") ,#imageLiteral(resourceName: "bg3"),#imageLiteral(resourceName: "bg1"), #imageLiteral(resourceName: "bg2") ,#imageLiteral(resourceName: "bg3")]
    
    
    //count funcion
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    //이미지를 넣는 funcfion
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RowCell", for: indexPath) as! CustomCell
        
        cell.imageView.image = images[indexPath.row]
        
        return cell
    }
 
    // collectionView Image 사이즈 지정
    func collectionView(_ collectionView: UICollectionView, layoutcollectionViewLayout:UICollectionViewLayout, sizeForItemAt
        indexPath:IndexPath) -> CGSize {
        
        let width = collectionView.frame.width/3
        
        return CGSize(width: width, height: width)
    }
    
    //컬렉션뷰 행의 하단 여백
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
   
    
    
    //컬랙션뷰 컬럼 사이 여백
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
   

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

class CustomCell: UICollectionViewCell{
    
    @IBOutlet weak var imageView: UIImageView!
    
}

