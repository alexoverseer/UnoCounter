//
//  CustomColor.swift
//  Uno Counter
//
//  Created by Alexandr Pavlov on 8/10/17.
//  Copyright © 2017 Softintercom. All rights reserved.
//

import UIKit

class CustomColor: NSObject {
    
    var name: String!
    var color: UIColor!
    
    init(name: String, color: UIColor) {
        self.name = name
        self.color = color
    }
}
