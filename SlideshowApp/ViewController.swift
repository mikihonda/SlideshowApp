//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 外間美希 on 2018/02/17.
//  Copyright © 2018年 miki.honda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var playpauseButton: UIButton!
    @IBOutlet weak var returnButton: UIButton!
    
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
        
        if self.timer != nil {
            
            playpauseButton.setTitle("Play", for: .normal)
            timer?.invalidate()
            timer = nil
            
            nextButton.isEnabled = true
            nextButton.setTitleColor(UIColor.magenta, for: .normal)
            returnButton.isEnabled = true
            returnButton.setTitleColor(UIColor.magenta, for: .normal)
            
        } else {
            
            playpauseButton.setTitle("Pause", for: .normal)
            
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.onTimer), userInfo: nil, repeats: true)
            nextButton.isEnabled = false
            nextButton.setTitleColor(UIColor.lightGray, for: .normal)
            returnButton.isEnabled = false
            returnButton.setTitleColor(UIColor.lightGray, for: .normal)
            
        }
    }
    
    // 表示している画像の番号
    var dispImageNo = 0
    
    // 一定の間隔で処理するタイマー
    var timer: Timer?
    
    // Timerによって一定の間隔で呼び出される関数
    @objc func onTimer(timer: Timer) {

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
            "photo1.jpg",
            "photo2.jpg",
            "photo3.jpg",
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

    @IBOutlet weak var imageView: UIImageView!
    @IBAction func onClickBig(_ sender: UIButton) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destination as! ResultViewController

        resultViewController.imageView = self.imageView
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        displayImage()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
}


