//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        
        let view = UIView()
        view.backgroundColor = .white
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildBeauitfulFont()
        
        buildCoordinateSystemImgView()
    }
    
    private func buildBeauitfulFont() {
        
        // 整个渐变字的“底托”
        let holdView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 200.0, height: 100.0))
        view.addSubview(holdView)
        
        // 渐变层
        let gradient = CAGradientLayer()
        gradient.frame = holdView.bounds
        gradient.startPoint = CGPoint(x: 0.0, y: 0.2)       // 渐变起始点
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)         // 渐变结束点
        gradient.colors = [UIColor.red.cgColor,
                           UIColor.yellow.cgColor,
                           UIColor.purple.cgColor]
        gradient.locations = [NSNumber(0.0),                // 渐变节点，应与colors中对应
                              NSNumber(0.5),
                              NSNumber(1.0)]
        holdView.layer.addSublayer(gradient)
        
        // 显示内容
        let label = UILabel(frame: holdView.bounds)
        label.text = "cishing"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.boldSystemFont(ofSize: 60)
        holdView.addSubview(label)
        holdView.mask = label   // 遮罩，只能显示maskView中非透明部分内容
        
//        gradient.mask = label.layer
    }
    
    private func buildCoordinateSystemImgView() {
        
        let imageView = UIImageView(frame: CGRect(x: 0.0, y: 150.0, width: 400.0, height: 300.0))
        imageView.image = UIImage(named: "iOS_layer_coordinate system")
        view.addSubview(imageView)
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
