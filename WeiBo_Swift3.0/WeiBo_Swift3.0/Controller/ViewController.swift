//
//  ViewController.swift
//  WeiBo_Swift3.0
//
//  Created by 李明禄 on 2016/11/24.
//  Copyright © 2016年 SocererGroup. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var weibos = [Weibo]()
    var weiBoView: UITableView!
    let screenBounds = UIScreen.main.bounds
    
    let identifier = "weiBoCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let tableView = UITableView.init(frame: screenBounds)
        
        self.view.addSubview(tableView)
        self.weiBoView = tableView
        
        
        //注册cell
        self.weiBoView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        
        // MARK: --  让控制器成为代理--
        self.weiBoView.delegate = self
        self.weiBoView.dataSource = self
        
        self.weibos = plistToWeibos()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: 实现tableView代理的方法
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        print ("**********" + "\(self.weibos.count)")
        return self.weibos.count
        
    }
    
    
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        //获取模型
        let weibo = self.weibos[indexPath.row]
        cell.textLabel!.text = weibo.name!
     
     // Configure the cell...
       
     return cell
     }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */

    
    func plistToWeibos() -> [Weibo] {
        let path = Bundle.main.path(forResource: "weibos.plist", ofType: nil)
        
        let plistArray = NSArray(contentsOfFile: path!)
        
        let weiboArray: [Weibo] = Weibo.dictModel(list: plistArray! as! [[String : AnyObject]])
        
        return weiboArray
        
    }
}

