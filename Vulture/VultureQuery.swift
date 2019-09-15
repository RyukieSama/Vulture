//
//  VultureQuery.swift
//  Vulture
//
//  Created by 王荣庆 on 2019/8/4.
//  Copyright © 2019 RyukieSama. All rights reserved.
//

import Foundation

extension URL {
    public var queryItems: [String: Any] {
        var params = [String: String]()
        
        return URLComponents(url: self, resolvingAgainstBaseURL: false)?
            .queryItems?
            .reduce([:], { (_, item) -> [String: Any] in
                params[item.name] = item.value
                return params
            }) ?? [:]
    }
}
