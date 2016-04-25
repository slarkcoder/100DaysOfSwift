//
//  ViewController.swift
//  3.SwiftAD
//
//  Created by zhangchao on 16/4/25.
//  Copyright © 2016年 slark. All rights reserved.
//

import UIKit
import SnapKit
import iAd

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let iAD = ADBannerView()
        self.view.addSubview(iAD)
        
        iAD.snp_makeConstraints { (make) in
            make.top.equalTo(self.view.snp_bottom).offset(-50)
            make.left.right.equalTo(self.view)
            make.bottom.equalTo(self.view)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

