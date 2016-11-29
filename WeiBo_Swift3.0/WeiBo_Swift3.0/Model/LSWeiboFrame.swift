//
//  LSWeiboFrame.swift
//  WeiBo_Swift3.0
//
//  Created by 李明禄 on 2016/11/28.
//  Copyright © 2016年 SocererGroup. All rights reserved.
//

import UIKit

class LSWeiboFrame: NSObject {
    //1.定义添加的属性
    var iconFrame: CGRect! = nil
    var nameFrame: CGRect! = nil
    var vipFrame: CGRect! = nil
    var textFrame: CGRect! = nil
    var picFrame: CGRect? = nil
    
    //3.添加其它属性
    let screenBounds = UIScreen.main.bounds
    let fontLbName =  UIFont.systemFont(ofSize: 15)
    let fontTextName = UIFont.systemFont(ofSize: 13)
    
    //cell的高度
    var cellHeight: CGFloat = 0.0
    //2.添加微博属性
    var weiBo: Weibo! {
        didSet {
            let margin: CGFloat = 10
            //头像
            let iconX = margin
            let iconY = iconX
            
            let iconWidth: CGFloat = 30
            let iconHeight = iconWidth
            
            self.iconFrame = CGRect(x: iconX, y: iconY, width: iconWidth, height: iconHeight)
            
            //昵称
            
            let nameSize = sizeWithText(weiBo.name! as NSString, font: fontLbName, maxSize: CGSize(width: screenBounds.width, height: CGFloat(MAXFLOAT)))
            let nameW = nameSize.width
            let nameH = nameSize.height
            let nameX = self.iconFrame.maxX + margin
            let nameY = margin + (iconHeight - nameH) * 0.5
            self.nameFrame = CGRect(x: nameX, y: nameY, width: nameW, height: nameH)
            //vip
            let vipW: CGFloat = 15
            let vipH: CGFloat = 15
            let vipX = self.nameFrame.maxX + margin
            let vipY = margin + (iconHeight - vipH) * 0.5
            self.vipFrame = CGRect(x: vipX, y: vipY, width: vipW, height: vipH)
            
            //正文
            
            let contentX = iconX
            let contentY = self.iconFrame.maxY + margin
            let maxW = screenBounds.width - 2 * margin
            
            let contentSize = sizeWithText(weiBo.text! as NSString, font: fontTextName, maxSize: CGSize(width: maxW, height: CGFloat(MAXFLOAT)))
            let contentW = contentSize.width
            let contentH = contentSize.height
            
            self.textFrame = CGRect(x: contentX, y: contentY, width: contentW, height: contentH)
            
            let picX = margin
            let picW:CGFloat = 100
            let picH:CGFloat = 100
            let picY = textFrame!.maxY + margin
            self.picFrame = CGRect(x: picX, y: picY, width: picW, height: picH)
            
            if weiBo.picture == nil{
                self.cellHeight = self.textFrame!.maxY + margin
            } else {
                
                self.cellHeight = self.picFrame!.maxY + margin
                
            }
        }

    
    }
    
    //计算文本大小
    func sizeWithText(_ text: NSString, font: UIFont, maxSize: CGSize)->CGSize {
        //定义一个字体
        let attrs: NSDictionary = [font: NSFontAttributeName]
        
        let size = text.boundingRect(with: maxSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attrs as? [String : AnyObject], context: nil).size
        return size
    }
    
    override init() { }

}
