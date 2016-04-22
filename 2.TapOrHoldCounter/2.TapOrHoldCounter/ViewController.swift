//
//  ViewController.swift
//  2.TapOrHoldCounter
//
//  Created by zhangchao on 16/4/22.
//  Copyright © 2016年 slark. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var count = 0
    var labCount = UILabel()
    var isBegain = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "Tap Counter";
        
        let btnRest = UIBarButtonItem(title: "Reset", style: .Plain, target: self, action: #selector(ViewController.resetCount))
        self.navigationItem.leftBarButtonItem = btnRest
        
        labCount = UILabel()
        labCount.textAlignment = .Center
        labCount.font = UIFont.systemFontOfSize(100)
        labCount.textColor = UIColor.blackColor()
        self.view.addSubview(labCount)
        
        let btnAddCount = UIButton()
        btnAddCount.setTitle("Tap", forState: .Normal)
        btnAddCount.setTitleColor(UIColor.blueColor(), forState: .Normal)
        btnAddCount.addTarget(self, action: #selector(ViewController.addCount), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnAddCount)
        
        let longTap = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longTapAction))
        longTap.minimumPressDuration = 1
        btnAddCount.addGestureRecognizer(longTap)
        
        labCount.snp_makeConstraints { (make) in
            make.width.equalTo(self.view)
            make.height.equalTo(100)
            make.center.equalTo(self.view)
        }
        
        btnAddCount.snp_makeConstraints { (make) in
            make.width.height.equalTo(60)
            make.top.equalTo(labCount.snp_bottom)
            make.centerX.equalTo(self.view)
        }
        
        self.updateCountView()
    }
    
    func updateCountView(){
        labCount.text = NSString(format: "%d",count) as String
    }
    
    func resetCount(){
        count = 0
        self.updateCountView()
    }
    
    func addCount(){
        count += 1
        self.updateCountView()
    }
    
    func longTapAction(tap:UILongPressGestureRecognizer){
        if tap.state == .Ended || tap.state == .Failed {
            self.isBegain = false
        } else if tap.state == .Began {
            self.isBegain = true
        }
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
            while self.isBegain {
                NSThread.sleepForTimeInterval(0.1)
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.count += 1
                    self.updateCountView()
                })
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
