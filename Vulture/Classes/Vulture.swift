//
//  Vulture.swift
//  Vulture
//
//  Created by 王荣庆 on 2019/8/4.
//  Copyright © 2019 RyukieSama. All rights reserved.
//

import Foundation

public class Vulture {
    
    /// 通过API路由
    ///
    /// - Parameter api:
    /// - Returns:
    @discardableResult
    public static func route(api: VultureNativeAPIProtocol?) -> Bool {
        guard let api = api else {
            return false
        }
//        let des = String(format: "\(api.typed).\(api)")
        api.excute()
        
        return true
    }
    
    /// 打开URL
    ///
    /// - Parameter url:
    /// - Returns: 是否成功
    @discardableResult
    public static func open(url: URL?, errorClosure: VultureErrorClosure? = nil) -> Bool {
        guard
            let pathURL = url,
            let scheme = pathURL.scheme,
            scheme == "Vulture",
            let moduleName = pathURL.host,
            let startIndex = pathURL.path.range(of: "/")
        else {
            errorClosure?(.invalidURL)
            return false
        }
        
        let apiName = String(pathURL.path.suffix(from: startIndex.upperBound))
        open(module: moduleName, api: apiName, pramas: pathURL.queryItems, errorClosure: errorClosure)
        return true
    }
    
    /// open URL
    ///
    /// - Parameters:
    ///   - module:
    ///   - api:
    static func open(module: String, api: String, pramas: [String: Any]? = nil, errorClosure: VultureErrorClosure? = nil) {
        guard
            let mappingType = (VultureURLAPI.self as? URLModuleMapping.Type),
            let moduleType = mappingType.moduleType(name: module)
        else {
            errorClosure?(.invalidModule)
            return
        }
        guard let api = moduleType.api(rawValue: api) else {
            errorClosure?(.invalidAPI)
            return
        }
        api.excute(params: pramas)
    }

    @discardableResult
    @available(iOSApplicationExtension, unavailable)
    public static func topViewController(base: UIViewController? = UIApplication.shared.windows.first?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            return topViewController(base: tab.selectedViewController)
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
    
}

/// 原生接口
public enum VultureNativeAPI {
    
}

/// URL 接口
public enum VultureURLAPI {
    
}

