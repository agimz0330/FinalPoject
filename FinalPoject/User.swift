//
//  User.swift
//  FinalPoject
//
//  Created by User23 on 2022/6/7.
//

import Foundation
import SwiftUI

struct ImgSize {
    var height: CGFloat = 0
    var offset: CGSize = .zero
    
    init(h: CGFloat, x: CGFloat, y: CGFloat){
        self.height = h
        self.offset = CGSize(width: x, height: y)
    }
}

let part_count = ["background": 15, "man_head": 30, "man_face": 23, "man_bread": 11,
                  "woman_head": 37, "woman_face": 17, "woman_glass": 7
]
