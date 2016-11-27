//
//  ViewController.swift
//  WeiBo_Swift3.0
//
//  Created by 李明禄 on 2016/11/24.
//  Copyright © 2016年 SocererGroup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var weibos = [Weibo]()
    var weiBoView: UITableView!
    let screenBounds = UIScreen.main.bounds

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView.init(frame: screenBounds)
        self.weiBoView = tableView
        self.view.addSubview(tableView)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func plistToWeibos() -> [Weibo] {
        let path = Bundle.main.path(forResource: "weibos.plist", ofType: nil)
        
        let plistArray = NSArray(contentsOfFile: path!)
        
        let weiboArray: [Weibo] = Weibo.dictModel(list: plistArray! as! [[String : AnyObject]])
        
        return weiboArray
        
    }
}

