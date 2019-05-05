//
//  PageCurlViewController.swift
//  SYPageViewController
//
//  Created by DDL-027 on 2019/4/30.
//  Copyright © 2019 cishing. All rights reserved.
//

import UIKit

class PageCurlViewController: UIPageViewController {

    lazy var controllerSource: [ContentViewController] = {
        
        var source = [ContentViewController]()
        
        for index in 0...5 {
            
            let contentViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ContentViewController") as! ContentViewController
            contentViewController.page = index
            source.append(contentViewController)
        }
        
        return source
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        self.delegate = self
        self.dataSource = self
        
        self.setViewControllers([controllerSource[0]], direction: .forward, animated: false) { (completed) in
        }
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

extension PageCurlViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        
        print("line:\(#line) function:\(#function)")
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        print("line:\(#line) function:\(#function)")
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, spineLocationFor orientation: UIInterfaceOrientation) -> UIPageViewController.SpineLocation {
        
        print("line:\(#line) function:\(#function)")
        
        return .min
    }
    
    func pageViewControllerSupportedInterfaceOrientations(_ pageViewController: UIPageViewController) -> UIInterfaceOrientationMask {
        
        print("line:\(#line) function:\(#function)")
        
        return .all
    }
    
    func pageViewControllerPreferredInterfaceOrientationForPresentation(_ pageViewController: UIPageViewController) -> UIInterfaceOrientation {
        
        print("line:\(#line) function:\(#function)")
        
        return .portrait
    }
}

extension PageCurlViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        print("line:\(#line) function:\(#function)")
        
        guard let index = controllerSource.firstIndex(of: viewController as! ContentViewController) else {
            
            return nil
        }
        
        if index == 0 {
            
            return controllerSource[controllerSource.count - 1]
        }else {
            
            return controllerSource[index - 1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        print("line:\(#line) function:\(#function)")
        
        guard let index = controllerSource.firstIndex(of: viewController as! ContentViewController) else {
            
            return nil
        }
        
        if index == controllerSource.count - 1 {
            
            return controllerSource[0]
        }else {
            
            return controllerSource[index + 1]
        }
    }
}
