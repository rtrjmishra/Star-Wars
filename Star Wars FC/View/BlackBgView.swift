//
//  BlackBackgroundView.swift
//  Star Wars FC
//
//  Created by Rituraj Mishra on 29/01/22.
//  Copyright © 2022 rtrjmishra. All rights reserved.
//

import UIKit

class BlackBgView: UIView
{
    override func awakeFromNib()
    {
        layer.backgroundColor = BLACK_BG
        layer.cornerRadius = 15
    }
}

class BlackBgButton: UIButton
{
    override func awakeFromNib()
    {
        layer.backgroundColor = BLACK_BG
        layer.cornerRadius = 15
    }
}
