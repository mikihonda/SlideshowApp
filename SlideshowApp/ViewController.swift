//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 外間美希 on 2018/02/17.
//  Copyright © 2018年 miki.honda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func onNext(_ sender: Any) {
        // 1つ進む
        dispImageNo += 1
        
        displayImage()
    }
    
    @IBAction func onReturn(_ sender: Any) {
        
        dispImageNo -= 1
        
        displayImage()
    }

    @IBAction func onPlayPause(_ sender: Any) {
        if self.timer! = nil {
            
            onPlayPause.setTitle("Play")
            timer?.invalidate()
            timer = nil
            
        } else {
            
            onPlayPause.setTitle("Pause")
            
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.onPlayPause(_:)), userInfo: nil, repeats: true)
            onNext.isEnabled = false
            onReturn.isEnabled = false
            
        }
    }
    
    // 表示している画像の番号
    var dispImageNo = 0
    
    // 一定の間隔で処理するタイマー
    var timer: Timer?
    
    // Timerによって一定の間隔で呼び出される関数
    func onTimer(timer: Timer) {
        
        // 関数が呼び出されていることを確認
        print("onTimer")
        
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
        
    }
    
    func displayImage() {
        
        // 画像の配列
        let imageNameArray = [
            "1.jpg",
            "2.jpg",
            "3.jpg",
            ]
        
        if dispImageNo < 0 {
            dispImageNo = 2
        }
        
        if dispImageNo > 2 {
            dispImageNo = 0
        }
        
        // 表示している画像の番号から名前を取り出す
        let name = imageNameArray[dispImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // ImageViewに読み込んだ画像をセット
        imageView.image = image
    }
    
    // セグエを使用して画面遷移 segueID"result"
    performSegueWithIdentifier("result", sender: nil)
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        displayImage()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}

