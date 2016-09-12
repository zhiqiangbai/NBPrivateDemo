//
//  NBRouter.swift
//  NBPrivateDemo
//
//  Created by NapoleonBai on 16/8/31.
//  Copyright © 2016年 NapoleonBai. All rights reserved.
//

import UIKit
/// 存放ViewModel以及对应的Controller, 包含通过ViewModel找到Controller对象等
class NBRouter:NSObject{
    ///私有化构造方法
    private override init() {
        super.init()
    }
    //单例对象
    static let defaultRouter = NBRouter()
    //此处必须保证ViewController继承自 NBViewController
    let viewModelViewMappings : Dictionary<String,String>=[
                                                            "HomeViewModel":"ViewController"
                                                        ];
    
    func viewControllerFor(viewModel:NBViewModel)->NBViewController{
        let classPath:String = NSStringFromClass(viewModel.classForCoder)
        var projectName : String?
        var className : String?
        //是否包含'.'
        if classPath.containsString(".") {
            var array = classPath.componentsSeparatedByString(".")
            className = array.last
            array.removeLast()
            projectName = array.joinWithSeparator(".")
        }else{
            className = classPath
        }
        
        let viewController:String = self.viewModelViewMappings[className!]!
        let vc =  NSClassFromString((projectName==nil ? "" : projectName!) + "." + viewController) as! NBViewController.Type
        
        return vc.init()
    }
}
