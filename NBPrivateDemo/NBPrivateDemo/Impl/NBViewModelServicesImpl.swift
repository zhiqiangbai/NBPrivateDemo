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
    
    /**
     push到指定界面
     
     - parameter viewModel: 指定界面的viewmodel
     - parameter animated:  是否需要动画
     */
    func push(viewModel: NBViewModel, animated: Bool) {
        let viewController = NBRouter.defaultRouter.viewControllerFor(viewModel);
        viewController.mViewModel = viewModel
        self.appdelegate.navigationControlllerStack?.topNavigationController().pushViewController(viewController, animated: animated)
    }

    /**
     pop到指定界面
     
     - parameter viewModel: 指定界面的viewmodel
     */
    func popTo(viewModel: NBViewModel , animated: Bool){
        let viewController = NBRouter.defaultRouter.viewControllerFor(viewModel);
        viewController.mViewModel = viewModel
        self.appdelegate.navigationControlllerStack?.topNavigationController().popToViewController(viewController, animated: animated)
    }
    
    /**
     离开当前界面
     
     - parameter animated: 是否需要动画
     */
    func pop(animated: Bool) {
        let viewController = self.appdelegate.navigationControlllerStack?.topNavigationController()

        if viewController?.viewControllers.count>1 {
            viewController?.popViewControllerAnimated(animated)
        }
    }
    /**
     导航栏跳转回到首页
     
     - parameter animated: 是否需要动画
     */
    func popToRoot(animated: Bool) {
        let viewController = self.appdelegate.navigationControlllerStack?.topNavigationController()
        if viewController?.viewControllers.count>1 {
            viewController?.popToRootViewControllerAnimated(animated)
        }
    }
    /**
     模态跳转到指定界面
     
     - parameter viewModel:  指定界面ViewModel
     - parameter animated:   是否需要动画
     - parameter completion: 回调
     */
    func present(viewModel: NBViewModel, animated: Bool, completion: VoidClosures) {
        let viewController = NBRouter.defaultRouter.viewControllerFor(viewModel);
        viewController.mViewModel = viewModel
        self.appdelegate.navigationControlllerStack?.topNavigationController().presentViewController(viewController, animated: animated, completion: completion)
    }
    /**
     模态跳转离开当前界面
     
     - parameter animated:   是否需要动画
     - parameter completion: 回调
     */
    func dismiss(animated: Bool, completion: VoidClosures) {
        self.appdelegate.navigationControlllerStack?.topNavigationController().dismissViewControllerAnimated(animated, completion: completion)
    }
    
    /**
     设置根控制器
     
     - parameter viewModel: 根控制器ViewModel
     */
    func resetRoot(viewModel: NBViewModel) {
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
