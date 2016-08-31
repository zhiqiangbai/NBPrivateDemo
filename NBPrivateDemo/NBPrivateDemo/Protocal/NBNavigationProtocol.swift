//
//  NBNavigationProtocol.swift
//  NBPrivateDemo
//
//  Created by NapoleonBai on 16/8/30.
//  Copyright © 2016年 NapoleonBai. All rights reserved.
//

import Foundation

typealias VoidClosures = ()->()

protocol NBNavigationProtocol {
    
    func pushViewModel(viewModel:NBViewModel , animated:Bool) -> Void
    func pushViewModel(animated:Bool) -> Void
    func popViewModel(animated:Bool) -> Void
    func popToRootViewModel(animated:Bool) -> Void
    func presentViewModel(viewModel:NBViewModel , animated:Bool , completion:VoidClosures) -> Void
    func dismissViewModel(animated:Bool , completion:VoidClosures) -> Void
    func resetRootViewModel(viewModel:NBViewModel)->Void
}