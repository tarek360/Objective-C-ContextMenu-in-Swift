//
//  Cell.swift
//  SwiftContextMenu
//
//  Created by tarek on 8/1/15.
//  Copyright (c) 2015 tarek. All rights reserved.
//

import UIKit

class ContextMenuCell : UITableViewCell, YALContextMenuCell {
    
    @IBOutlet weak var menuImageView: UIImageView!
    @IBOutlet weak var menuTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    func animatedIcon() ->  UIView{
    return self.menuImageView;
    }
    
    func animatedContent() ->  UIView{
        return self.menuTitleLabel;
    }

}
