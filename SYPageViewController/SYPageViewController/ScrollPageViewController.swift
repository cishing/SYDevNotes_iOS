//
//  ScrollPageViewController.swift
//  SYPageViewController
//
//  Created by DDL-027 on 2019/4/30.
//  Copyright © 2019 cishing. All rights reserved.
//

import UIKit

class ScrollPageViewController: UIPageViewController {

    lazy var controllerSource: [ContentViewController] = {
        
        var source = [ContentViewController]()
        
        for index in 0...5 {
            
            let contentViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ContentViewController") as! ContentViewController
            contentViewController.page = index
            source.append(contentViewController)
        }
        
        return source
    }()
    
    var currentIndex = 0    // 当前控制器index
    var pendingIndex = 0    // 即将展示控制器index
    
    /// 初始化方法（以下属性均可在storyboard中直接设置）
    ///
    /// - Parameters:
    ///   - style: 样式（scroll：滑动，pageCurl：翻页效果）
    ///   - navigationOrientation: 方向（horizontal：横向，vertical：纵向）
    ///   - options: 选项（UIPageViewController.OptionsKey.interPageSpacing：页间距，当style为scroll时生效，值为NSNumber类型，UIPageViewController.OptionsKey.spineLocation：页面位置，当style为pageCurl时生效，值为NSNumber类型；当值等于mid时，需要两个viewController）
//    init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
//        
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .black
        
        self.delegate = self
        self.dataSource = self
    
        // 设置当前显示页面，当style类型为pageCurl时，需要两个viewController
        // direction：动画方向
        // animated：是否带有动画
        // 尾随闭包：完成
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

extension ScrollPageViewController: UIPageViewControllerDelegate {
    
    /// 将要过渡页面时调用
    ///
    /// - Parameters:
    ///   - pageViewController: 当前pageViewController
    ///   - pendingViewControllers: 即将展示的viewControllers
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        
        print("line:\(#line) function:\(#function)")
        
        // 计算将要显示的控制器index
        if let viewController = pendingViewControllers.first as? ContentViewController, let index = controllerSource.firstIndex(of: viewController) {
            
            pendingIndex = index
        }
    }
    
    /// 页面过渡结束时调用
    ///
    /// - Parameters:
    ///   - pageViewController: 当前pageViewController
    ///   - finished: 动画是否结束
    ///   - previousViewControllers: 过渡之前的viewControllers
    ///   - completed: 过渡是否完成（滑动边缘距离较小时候，会弹回当前viewControllers）
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        print("line:\(#line) function:\(#function)")
        
        if completed {  // 如果过渡完成，将即将显示控制器index赋给当前控制器index
            
            currentIndex = pendingIndex
        }
        
        print("currentIndex: \(currentIndex)")
    }
    
    // 根据界面方向决定页面方向，当style为pageCurl时生效，当style为scroll时返回none
    func pageViewController(_ pageViewController: UIPageViewController, spineLocationFor orientation: UIInterfaceOrientation) -> UIPageViewController.SpineLocation {
        
        print("line:\(#line) function:\(#function)")
        
        return .none
    }
    
    // 支持界面方向
    func pageViewControllerSupportedInterfaceOrientations(_ pageViewController: UIPageViewController) -> UIInterfaceOrientationMask {
        
        print("line:\(#line) function:\(#function)")
        
        return .allButUpsideDown
    }
    
    // 优选界面方向
    func pageViewControllerPreferredInterfaceOrientationForPresentation(_ pageViewController: UIPageViewController) -> UIInterfaceOrientation {
        
        print("line:\(#line) function:\(#function)")
        
        return .portrait
    }
}

extension ScrollPageViewController: UIPageViewControllerDataSource {
    
    // 当前页面前一页面
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
    
    // 当前页面后一页面
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
    
    // 当style为scroll时，以下两个方法同时实现将会在页面底部增加一个pageControl，对于style为pageCurl无效
    func presentationCount(for pageViewController: UIPageViewController) -> Int {

        return controllerSource.count       // 返回导航点个数
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {

        return 0    // 通过滑动调整页面无需处理，系统自动增减，通过setViewControllers调整页面，需要自己处理返回选中导航点的位置
    }
}
