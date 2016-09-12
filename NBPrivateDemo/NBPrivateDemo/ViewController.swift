//
//  ViewController.swift
//  NBPrivateDemo
//
//  Created by NapoleonBai on 16/8/30.
//  Copyright © 2016年 NapoleonBai. All rights reserved.
//

import RxSwift
import RxCocoa
import ReactiveCocoa


class ViewController: NBViewController {
    
    let totalSeconds:Double = 120
    dynamic var surplusSeconds:Double = 120
    let label : UILabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = arc4random()%2==0 ? UIColor.blueColor() : UIColor.greenColor()
    
        label.frame = CGRectMake(100, 210, 300, 20)
        label.text = "00:00:00"
        label.textColor=UIColor.redColor()
        
        self.view.addSubview(label)
        
        
        let button : UIButton = UIButton(type: .Custom)
        button.frame = CGRectMake(100, 100, 100, 100)
        button.setTitle("push", forState: .Normal)
        
        button.setTitleColor(UIColor.redColor(), forState: .Normal)
        button.layer.borderColor = UIColor.yellowColor().CGColor
        button.layer.borderWidth = 1
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 5
        
        self.view.addSubview(button)
//        _ = button.rx_tap.subscribeNext {
//            print("点击===>>>>>>>")
//            let homeViewModel : HomeViewModel = HomeViewModel(service:self.mViewModel!.services,parmas: ["title":"home"])
//            self.mViewModel?.services?.push(homeViewModel, animated: true)
//        }
        
    
//        RACObserve(self, keyPath: "surplusSeconds").subscribeNext { object in
//            let seconds = object as! Double
//            dispatch_async(dispatch_get_main_queue(), {
//                self.label.text = String(format:"%02.0f:%02.0f:%02.0f",seconds/60/60 , seconds/60 ,seconds%60)
//            })
//        }
        
        RAC(self.label,"text") <~ RACObserve(self, keyPath: "surplusSeconds").map({ object -> AnyObject! in
            let seconds = object as! Double
            return String(format:"%02.0f:%02.0f:%02.0f",seconds/60/60 , seconds/60 ,seconds%60)
        })
        
        button.rac_signalForControlEvents(UIControlEvents.TouchUpInside).subscribeNext {_ in
            
             RACSignal.interval(1, onScheduler: RACScheduler(priority: RACSchedulerPriorityHigh), withLeeway: self.totalSeconds).subscribeNext({ _ in
                self.surplusSeconds -= 1
                guard self.surplusSeconds > 0 else{
                    return
                }
            })
        }
        
        
        let button1 : UIButton = UIButton(type: .Custom)
        button1.frame = CGRectMake(250, 100, 100, 100)
        button1.setTitle("pop", forState: .Normal)
        
        button1.setTitleColor(UIColor.redColor(), forState: .Normal)
        button1.layer.borderColor = UIColor.yellowColor().CGColor
        button1.layer.borderWidth = 1
        button1.layer.masksToBounds = true
        button1.layer.cornerRadius = 5
        
        self.view.addSubview(button1)
//        _ = button1.rx_tap.subscribeNext {
//            self.mViewModel?.services?.pop(true)
//        }
//        

        RACSignal.createSignal { subscriber -> RACDisposable! in
            subscriber.sendNext("TEST")
            subscriber.sendCompleted()
            return nil
        } .subscribeNext({ (testStr) in
            print(testStr)
        }) {
            print("finish")
        }
        self.title = self.mViewModel?.nav_title
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
}



