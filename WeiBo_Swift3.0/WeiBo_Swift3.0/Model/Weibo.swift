//
//  Weibo.swift
//  WeiBo_Swift3.0
//
//  Created by 李明禄 on 2016/11/26.
//  Copyright © 2016年 SocererGroup. All rights reserved.
//

import UIKit

class Weibo: NSObject {
    var text: String?
    var name: String?
    var icon: String?
    var vip: Bool = true
    var picture: String?
    
    let properties = ["text", "name", "icon", "vip", "picture"]
    override var description: String {
        let dict = dictionaryWithValues(forKeys: properties)
        return ("\(dict)")
    }
    // MARK: - 构造函数
    init(dict: [String: AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func  setValue(_ value: Any?, forUndefinedKey key: String) { }
    
    class func dictModel(list: [[String: AnyObject]]) -> [Weibo] {
        
        var models = [Weibo]()
        for dict in list {
            models.append(Weibo(dict: dict))
        }
        return models
    }
}
