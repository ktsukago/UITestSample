//
//  ViewController.swift
//  UITestSample
//
//  Created by 塚越啓介 on 2015/06/09.
//  Copyright © 2015年 ktsukago. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var extraView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didTapExtraButton(sender: AnyObject) {
        if self.view.subviews.contains(self.extraView) {
            self.extraView.removeFromSuperview()
        } else {
            self.extraView.frame.origin = CGPointMake(
                sender.center.x - self.extraView.frame.size.width / 2.0,
                sender.frame.origin.y + sender.frame.size.height)
            self.view.addSubview(self.extraView)
        }
    }
    
    @IBAction func unwindToTop(segue: UIStoryboardSegue) {
    }
}

