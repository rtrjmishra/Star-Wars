//
//  FadeEnabledButton.swift
//  Star Wars FC
//
//  Created by Rituraj Mishra on 30/01/22.
//  Copyright © 2022 rtrjmishra. All rights reserved.
//

import Foundation

import UIKit

class FadeEnabled: UIButton
{
    override var isEnabled: Bool
    {
        didSet
        {
            if isEnabled{
                UIView.animate(withDuration: 0.2){
                self.alpha = 1.0
                }
            }else{
                UIView.animate(withDuration: 0.2){
                self.alpha = 0.5
            }
            }
        }
    }
}
