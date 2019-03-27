//
//  ViewController.swift
//  App评分及评论功能
//
//  Created by XiaShiyang on 2019/3/27.
//  Copyright © 2019 cishing. All rights reserved.
//

import UIKit
import StoreKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

// MARK: - 应用内评分
extension ViewController {
    
    @IBAction func function1(_ sender: UIButton) {
        
        if #available(iOS 10.3, *) {
            
            // 系统自动限制在365天的时间内，每个应用程序的提示显示为3次
            // 由于系统限制了评级提示的频率，因此评论提示可能不会发生，所以避免使用按钮等控件来请求反馈
            // 开发模式下“提交”按钮不可用，并始终显示评论提示
            // 存在延时，需要考虑弹出场景
            SKStoreReviewController.requestReview()
        } else {
            // Use function2 or function3
        }
    }
}

// MARK: - 应用内跳转App Store
extension ViewController: SKStoreProductViewControllerDelegate {
    
    @IBAction func function2(_ sender: UIButton) {
        
        // 只能跳转到App主页，不能直接进入评论区
        // 存在延时，需要考虑弹出场景
        let productVC = SKStoreProductViewController()
        productVC.delegate = self
        productVC.loadProduct(withParameters: [SKStoreProductParameterITunesItemIdentifier: NSNumber(value: 414478124)]) { (success, error) in
            
            if success {
                
                self.present(productVC, animated: true, completion: nil)
            }else {
                
                print("error: \(error)")
            }
        }
    }
    
    // App Store页面点击“完成”按钮回调
    func productViewControllerDidFinish(_ viewController: SKStoreProductViewController) {
        
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: - 直接跳转App Store
extension ViewController {
    
    @IBAction func function3(_ sender: UIButton) {
        
        // 加&action=write-review直接跳转到评论区
        // 不加展示效果同function2，但无“完成”按钮
        if let appUrl = URL(string: "https://itunes.apple.com/cn/app/id\(414478124)?mt=8&action=write-review"), UIApplication.shared.canOpenURL(appUrl) {
            
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(appUrl, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(appUrl)
            }
        }
    }
}
