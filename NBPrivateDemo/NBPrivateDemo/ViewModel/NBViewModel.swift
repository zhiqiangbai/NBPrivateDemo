//
//  NBViewModel.swift
//  NBPrivateDemo
//
//  Created by NapoleonBai on 16/8/30.
//  Copyright © 2016年 NapoleonBai. All rights reserved.
//

import Foundation

/// 基类ViewModel,记录ViewController相关属性及参数配置
class NBViewModel : NSObject{

    private var mServices : NBViewModelServices?
    var services : NBViewModelServices? {
        get{
            return self.mServices
        }
        set{
            self.mServices = services
        }
    }
    
    /// 导航栏标题
    var nav_title : String?
    
    init(service:NBViewModelServices?, parmas:Dictionary<String,AnyObject>){
        super.init()
        self.mServices = service
        self.nav_title = parmas["title"] as? String
    }
}