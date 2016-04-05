//
//  ViewController.swift
//  demo
//
//  Created by Serhii Syrotynin on 12/21/15.
//  Copyright © 2015 appus.me. All rights reserved.
//

import UIKit
//import AppusPageControl

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var pageControl: APPageControl!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pageControl.addTarget(self, action: "testAction:", forControlEvents: UIControlEvents.ValueChanged)
        pageControl.selectedColour = UIColor.whiteColor()
        
        for index in (1...pageControl.pages){
            let imageName = NSString(format: "%d.JPG", index)
            let image = UIImage(named: imageName as String)
            let imageView = UIImageView(image: image!)
            imageView.contentMode = UIViewContentMode.ScaleAspectFill
            imageView.clipsToBounds = true;
            let value = CGFloat(index - 1)
            
            imageView.frame = CGRect(x: value * self.view.frame.size.width, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
            
            scrollView.addSubview(imageView)
        }
        
        self.scrollView.contentSize = CGSizeMake(3*self.view.frame.size.width, self.view.frame.size.height)
    }

    func testAction(control: APPageControl){
        let offset = CGFloat(control.currentPage) * self.view.frame.size.width
        self.scrollView.scrollRectToVisible(CGRectMake(offset, 0, self.view.frame.size.width, self.view.frame.size.height), animated: true)
    }
    
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView){
        let scrollOffset = round(Float(scrollView.contentOffset.x/self.view.frame.size.width));
        pageControl.currentPage = Int(scrollOffset);
    }

}

