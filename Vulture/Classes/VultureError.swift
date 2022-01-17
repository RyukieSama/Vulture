//
//  VultureError.swift
//  Vulture
//
//  Created by 王荣庆 on 2021/9/23.
//

import Foundation

public typealias VultureErrorClosure = ((VultureError) -> ())

public enum VultureError {
    /// 无效URL
    case invalidURL
    /// 无效模块
    case invalidModule
    /// 无效API
    case invalidAPI
}
