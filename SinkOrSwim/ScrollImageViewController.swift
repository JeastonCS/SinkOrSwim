//
//  ViewController.swift
//  SinkOrSwim
//
//  Created by Jack Easton on 9/14/22.
//

import UIKit

class ScrollImageViewController: UIViewController, UIScrollViewDelegate {

    lazy var imageModel = {
        return ImageModel.sharedInstance()
    }()
    
    lazy private var imageView: UIImageView? = {
        return UIImageView.init(image: self.imageModel.getImageWithName(displayImageName))
    }()
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    
    var displayImageName = "Day"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let size = self.imageView?.image?.size{
            self.scrollView.addSubview(self.imageView!)
            self.scrollView.contentSize = size
            self.scrollView.minimumZoomScale = 0.1
            self.scrollView.delegate = self
        }
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }


}

