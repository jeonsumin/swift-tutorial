//
//  ViewController.swift
//  TRMusicPlayer
//
//  Created by Sumin Jeon on 2020/01/12.
//  Copyright © 2020 Sumin Jeon. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

    var player : AVAudioPlayer!
    var timer :Timer!
    
    @IBOutlet var Playbtn: UIButton!
    @IBOutlet var TimeLable: UILabel!
    @IBOutlet var progressSlider: UISlider!
    
    //슬라이더 초기화 메소드
    func initializePlayer(){
        guard let soundAsset: NSDataAsset = NSDataAsset(name: "sound") else {
            print("음원파일을 가져올 수 없습니다.")
            return
        }
        do {
            try self.player = AVAudioPlayer(data:soundAsset.data)
            self.player.delegate = self
        }catch let error as NSError{
            print("플레이어 초기화 실패")
            print("코드 : \(error), 메시지 : \(error.localizedDescription)")
        }
        self.progressSlider.maximumValue = Float(self.player.duration)
        self.progressSlider.minimumValue = 0
        self.progressSlider.value = Float(self.player.currentTime)
    }
    //label 을 매초마다 업데이트해주는 메소드
    func UpdateTimeLableText(Time:TimeInterval){
        let minute: Int = Int(Time/60)
        let second: Int = Int(Time.truncatingRemainder(dividingBy: 60))
        let milisecond: Int = Int(Time.truncatingRemainder(dividingBy: 1) * 100)
        
        let TimeText : String = String(format: "%02ld:%02ld:%02ld", minute, second, milisecond)
        
        self.TimeLable.text = TimeText
    }
    
    func makeAndFireTimer(){
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: {[unowned self] (timer:Timer) in
            if self.progressSlider.isTracking{return}
            
            self.UpdateTimeLableText(Time: self.player.currentTime)
            self.progressSlider.value=Float(self.player.currentTime)
        })
        self.timer.fire()
    }
    
    //timer해제
    func invaliDateTimer(){
        self.timer.invalidate()
        self.timer = nil
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.initializePlayer()
    }
    //플레이어 버튼 클릭 액션 메소드
    @IBAction func TouchUpPlayBtn(_ sender: UIButton) {
        //print("플레이버튼 클릭!")
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected{
            self.player?.play()
        }else{
            self.player?.pause()
        }
        
        if sender.isSelected{
            self.makeAndFireTimer()
        }else{
            self.initializePlayer()
        }
    }
    //슬라이더 변경 액션 메소드
    @IBAction func SliderValueChange(_ sender: UISlider) {
        // print("Slider Value Change")
        self.UpdateTimeLableText(Time: TimeInterval(sender.value))
        if sender.isTracking{return}
        self.player.currentTime = TimeInterval(sender.value)
    }
}

