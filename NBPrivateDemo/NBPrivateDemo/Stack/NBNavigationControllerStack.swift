//
//  NBNavigationControllerStack.swift
//  NBPrivateDemo
//
//  Created by NapoleonBai on 16/8/31.
//  Copyright © 2016年 NapoleonBai. All rights reserved.
//

import RxSwift


/// NavigationController堆栈管理
class NBNavigationControllerStack : NSObject{
    
    private var services : NBViewModelServices?
    var navigationControllers : Array<UINavigationController> = []
    
    
    init(services:NBViewModelServices){
        self.services = services
    }
    
    /**
     push 到对应的控制器中
     
     - parameter navigationController: 需要展示的控制器
     */
    func push(navigationController:UINavigationController) -> Void {
        guard self.navigationControllers.contains(navigationController) else{
            self.navigationControllers.append(navigationController)
            return
        }
    }
    /**
     离开当前控制器
     
     - returns:离开时的那个控制器
     */
    func popNavigationController()->UINavigationController {
        assert(self.navigationControllers.last != nil, "popNavigationController Error:the self.navigationControllers.last = nil")
        let navigateionController = self.navigationControllers.last!
        self.navigationControllers.removeLast()
        return navigateionController
    }
    
    /**
     获取当前控制器
     
     - returns: 当前控制器
     */
    func topNavigationController() -> UINavigationController {
        assert(self.navigationControllers.last != nil, "topNavigationController Error:the self.navigationControllers.last = nil")
        let navigateionController = self.navigationControllers.last!
        return navigateionController
    }
    
}