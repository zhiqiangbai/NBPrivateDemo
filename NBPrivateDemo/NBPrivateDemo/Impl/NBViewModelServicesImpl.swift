//
//  NBViewModelServicesImpl.swift
//  NBPrivateDemo
//
//  Created by NapoleonBai on 16/8/30.
//  Copyright © 2016年 NapoleonBai. All rights reserved.
//

import UIKit
/// 对NBViewModelseServices的实现
class NBViewModelServicesImpl : NBViewModelServices{
    let appdelegate  = UIApplication.sharedApplication().delegate as! AppDelegate
    
    func pushViewModel(viewModel: NBViewModel, animated: Bool) {
        let viewController = NBRouter.defaultRouter.viewControllerFor(viewModel);
        viewController.mViewModel = viewModel
        self.appdelegate.navigationControlllerStack?.topNavigationController().pushViewController(viewController, animated: animated)
    }
    
    func pushViewModel(animated: Bool) {}
    
    func popViewModel(animated: Bool) {}
    
    func popToRootViewModel(animated: Bool) {}
    
    func presentViewModel(viewModel: NBViewModel, animated: Bool, completion: VoidClosures) {}
    
    func dismissViewModel(animated: Bool, completion: VoidClosures) {}
    
    func resetRootViewModel(viewModel: NBViewModel) {
        appdelegate.navigationControlllerStack?.navigationControllers.removeAll()
        let viewController = NBRouter.defaultRouter.viewControllerFor(viewModel);
        viewController.mViewModel = viewModel
        
        if !viewController.isKindOfClass(UINavigationController.classForCoder()){
            let nav : UINavigationController = UINavigationController(rootViewController: viewController)
            appdelegate.window?.rootViewController = nav
            appdelegate.navigationControlllerStack?.push(nav)
        }else{
            appdelegate.window?.rootViewController = viewController
        }
    }
}
