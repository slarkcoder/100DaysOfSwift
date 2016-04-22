//
//  ViewController.swift
//  1.TapCounter
//
//  Created by zhangchao on 16/4/22.
//  Copyright © 2016年 slark. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    var count = 0
    var labCount = UILabel()
    
    
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

