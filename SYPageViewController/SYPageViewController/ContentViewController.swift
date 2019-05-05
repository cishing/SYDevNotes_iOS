//
//  ContentViewController.swift
//  SYPageViewController
//
//  Created by DDL-027 on 2019/4/30.
//  Copyright © 2019 cishing. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    @IBOutlet weak var pageLbl: UILabel!
    
    var page = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(red: CGFloat.random(in: 0.0...255.0) / 255.0, green: CGFloat.random(in: 0.0...255.0) / 255.0, blue: CGFloat.random(in: 0.0...255.0) / 255.0, alpha: 1)
        pageLbl.text = "第\(page)页"
    }
    
    @IBAction func dissmiss(_ sender: Any) {
        
        parent?.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
