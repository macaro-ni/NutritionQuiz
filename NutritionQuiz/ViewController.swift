//
//  ViewController.swift
//  NutritionQuiz
//
//  Created by 墨田萌 on 2023/08/15.
//

import UIKit
import AppTrackingTransparency  //追加
import AdSupport  //追加


class ViewController: UIViewController {
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startButton.layer.borderWidth = 2
        startButton.layer.borderColor = UIColor.white.cgColor
    }

//以下ATT対応
    
    //ライフサイクルて最後の方のやつ ↓↓↓
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //ATT対応
        if #available(iOS 14, *) {
            switch ATTrackingManager.trackingAuthorizationStatus {
            case .authorized:
                print("Allow Tracking")
                print("IDFA: \(ASIdentifierManager.shared().advertisingIdentifier)")
            case .denied:
                print("拒否")
            case .restricted:
                print("制限")
            case .notDetermined:
                showRequestTrackingAuthorizationAlert()
            @unknown default:
                fatalError()
            }
        } else {// iOS14未満
            if ASIdentifierManager.shared().isAdvertisingTrackingEnabled {
                print("Allow Tracking")
                print("IDFA: \(ASIdentifierManager.shared().advertisingIdentifier)")
            } else {
                print("制限")
            }
        }
    }
    
    ///Alert表示
        private func showRequestTrackingAuthorizationAlert() {
            if #available(iOS 14, *) {
                ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
                    switch status {
                    case .authorized:
                        print("🎉")
                        //IDFA取得
                        print("IDFA: \(ASIdentifierManager.shared().advertisingIdentifier)")
                    case .denied, .restricted, .notDetermined:
                        print("😥")
                    @unknown default:
                        fatalError()
                    }
                })
            }
        }
    
}

