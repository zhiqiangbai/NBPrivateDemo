//
//  NBNavigationProtocol.swift
//  NBPrivateDemo
//
//  Created by NapoleonBai on 16/8/30.
//  Copyright © 2016年 NapoleonBai. All rights reserved.
//

import Foundation

typealias VoidClosures = (()->())?

protocol NBNavigationProtocol {
    
    func push(viewModel:NBViewModel , animated:Bool) -> Void
    func pop(animated:Bool) -> Void
    func popTo(viewModel:NBViewModel , animated:Bool ) -> Void
    func popToRoot(animated:Bool) -> Void
    func present(viewModel:NBViewModel , animated:Bool , completion:VoidClosures) -> Void
    func dismiss(animated:Bool , completion:VoidClosures) -> Void
    func resetRoot(viewModel:NBViewModel)->Void
}