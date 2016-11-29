//
//  LSWeiboCell.swift
//  WeiBo_Swift3.0
//
//  Created by 李明禄 on 2016/11/28.
//  Copyright © 2016年 SocererGroup. All rights reserved.
//

import UIKit

class LSWeiboCell: UITableViewCell {
    var iconImageView: UIImageView!
    var nameLabel: UILabel!
    var vipView: UIImageView!
    var picView: UIImageView!
    var textView: UILabel!
    
    let fontLbName = UIFont.systemFont(ofSize: 15)
    let fontLbText = UIFont.systemFont(ofSize: 13)
    
    //2.重写frame的方法
    var weiBoFrame: LSWeiboFrame! {
        didSet {
            
            let weiBo = weiBoFrame.weiBo!
            //设置frame
            self.iconImageView.frame = weiBoFrame.iconFrame
            self.nameLabel.frame = weiBoFrame.nameFrame
            self.vipView.frame = weiBoFrame.vipFrame
            self.textView.frame = weiBoFrame.textFrame!
            self.picView.frame = weiBoFrame.picFrame!
            
            //设置data
            self.iconImageView.image = UIImage.init(named: weiBo.icon!)
            self.nameLabel.text = weiBo.name!
            self.textView.text = weiBo.text!
            if weiBo.vip {
                self.nameLabel!.textColor = UIColor.red
                self.vipView.isHidden = false
            }else {
                self.nameLabel!.textColor = UIColor.blue
                self.vipView.isHidden = true
            }
            
            if (weiBo.picture == nil) {
                self.picView.isHidden = true
            } else {
                self.picView.image = UIImage.init(named: weiBo.picture!)
                self.picView.isHidden = false
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: 1.重写initWithStyle
   override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        if !self.isEqual(nil) {
    
            let icon = UIImageView.init()
            self.iconImageView = icon
            self.addSubview(iconImageView)
        
            let name = UILabel.init()
            name.sizeToFit()
            name.adjustsFontSizeToFitWidth = true
            nameLabel = name
            name.font = fontLbName
            self.addSubview(self.nameLabel)
        
            let vipView = UIImageView.init(image: UIImage.init(named: "vip"))
            self.vipView = vipView
        
            self.addSubview(self.vipView)
        
            let textView = UILabel.init()
            textView.font = fontLbText
            textView.sizeToFit()
            textView.numberOfLines = 0
            textView.adjustsFontSizeToFitWidth = true
            self.textView = textView
            self.addSubview(self.textView)
        
            let picView = UIImageView()
            self.picView = picView
            self.addSubview(self.picView)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
