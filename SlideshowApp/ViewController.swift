//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 外間美希 on 2018/02/17.
//  Copyright © 2018年 miki.honda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    // セグエを使用して画面遷移 segueID"result"
    // performSegueWithIdentifier("result", sender: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 表示している画像の番号
        var dispImageNo = 0
        
        func displayImage() {
            
            // 画像の配列
            let imageNameArray = [
                "1.jpg",
                "2.jpg",
                "3.jpg",
                ]
            
            // 表示している画像の番号から名前を取り出す
            let name = imageNameArray[dispImageNo]
            
            // 画像を読み込み
            let image = UIImage(named: name)
            
            // ImageViewに読み込んだ画像をセット
            imageView.image = image
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

