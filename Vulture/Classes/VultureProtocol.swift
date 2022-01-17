//
//  VultureProtocol.swift
//  Vulture
//
//  Created by 王荣庆 on 2019/8/4.
//  Copyright © 2019 RyukieSama. All rights reserved.
//

import Foundation

public protocol URLModuleMapping {
    static func moduleType(name: String) -> URLAPIModule.Type?
}

public protocol URLAPIModule {
    static func api(rawValue: String) -> VultureURLApiProtocol?
}

/// 接口协议
public protocol VultureNativeAPIProtocol {
    func excute()
}

/// OpenURL接口协议
public protocol VultureURLApiProtocol {
    func excute(params: [String: Any]?)
}

extension VultureNativeAPIProtocol {
    var typed: String {
        return "\(Self.self)"
    }
}
