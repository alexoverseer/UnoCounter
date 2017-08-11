//
//  ShadowView.swift
//  Rosenthal
//
//  Created by Alexandr Pavlov on 7/27/17.
//  Copyright © 2017 Rosenthal. All rights reserved.
//

import UIKit

@IBDesignable
class ShadowView: UIView {

    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        addShadow(view: self)
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        addShadow(view: self)
    }
    
    func addShadow(view: UIView) -> Void {
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 4
    }
}
