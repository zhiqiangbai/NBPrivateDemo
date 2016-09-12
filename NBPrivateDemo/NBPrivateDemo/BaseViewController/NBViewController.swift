//
//  NBViewController.swift
//  NBPrivateDemo
//
//  Created by NapoleonBai on 16/8/31.
//  Copyright © 2016年 NapoleonBai. All rights reserved.
//

import UIKit
import ReactiveCocoa


class NBViewController: UIViewController {
    
    
    var signal :RACSignal?
    var dispose : RACDisposable?
    var residenceTime : Double = 0

    var mViewModel : NBViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        self.signal = RACSignal.interval(1, onScheduler: RACScheduler(priority: RACSchedulerPriorityBackground))
        self.dispose = self.signal?.subscribeNext({[weak self] _ in
            self!.residenceTime += 1
        })
        
    }
    
    override func viewDidDisappear(animated: Bool) {
        self.dispose?.dispose()
        print("页面停留时间为:\(self.residenceTime). class = \(self.classForCoder)")
    }

}

