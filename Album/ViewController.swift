//
//  ViewController.swift
//  Album
//
//  Created by 梁雅軒 on 2017/2/20.
//  Copyright © 2017年 zoaks. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    var arrData = [String]()
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //註冊cell
        collectionView.register(UINib(nibName: "MyCell", bundle: nil), forCellWithReuseIdentifier: "MyCell")
        //資料
        for i in 1...4 {
            arrData.append("\(i)")
        }
        //每個cell的大小
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height/2)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // collectionViewDelegate
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! MyCell
        cell.imgvPhoto.image = UIImage.init(named: "\(arrData[indexPath.row]).jpg")
        
        return cell
    }
    

}
