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
    var bFirstViewDidPost = true
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //註冊cell
        collectionView.register(UINib(nibName: "MyCell", bundle: nil), forCellWithReuseIdentifier: "MyCell")
        //資料
        changeData()
        //每個cell的大小
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height/2)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews();
        if (bFirstViewDidPost) {
            bFirstViewDidPost = false;
            collectionView.reloadData()
            collectionView.contentOffset = CGPoint(x: UIScreen.main.bounds.size.width, y: 0)
        }
    }
    
    func changeData() {
        for i in 1...4 {
            arrData.append("\(i)")
        }
        let firstObject = arrData.first!
        let lastObject = arrData.last!
        arrData.insert(firstObject, at: arrData.count)
        arrData.insert(lastObject, at: 0)
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
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset.x == 0 {
            scrollView.scrollRectToVisible(CGRect(x: scrollView.frame.size.width * CGFloat((arrData.count - 2)), y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height), animated: false)
        }else if scrollView.contentOffset.x == scrollView.frame.size.width * CGFloat((arrData.count - 1)){
            scrollView.scrollRectToVisible(CGRect(x: scrollView.frame.size.width , y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height), animated: false)
        }
    }

}
