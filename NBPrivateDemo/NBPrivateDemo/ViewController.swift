//
//  ViewController.swift
//  NBPrivateDemo
//
//  Created by NapoleonBai on 16/8/30.
//  Copyright © 2016年 NapoleonBai. All rights reserved.
//

import RxSwift
import RxCocoa

class ViewController: NBViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = arc4random()%2==0 ? UIColor.blueColor() : UIColor.greenColor()
        
        
        let button : UIButton = UIButton(type: .Custom)
        button.frame = CGRectMake(100, 100, 100, 100)
        button.setTitle("click", forState: .Normal)
        
        button.setTitleColor(UIColor.redColor(), forState: .Normal)
        button.layer.borderColor = UIColor.yellowColor().CGColor
        button.layer.borderWidth = 1
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 5
        
        self.view.addSubview(button)
        _ = button.rx_tap.subscribeNext {
            print("点击===>>>>>>>")
            let homeViewModel : HomeViewModel = HomeViewModel(service:self.mViewModel!.services,parmas: ["title":"home"])
            self.mViewModel?.services?.pushViewModel(homeViewModel, animated: true)
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

