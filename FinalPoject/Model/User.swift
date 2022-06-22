//
//  User.swift
//  FinalPoject
//
//  Created by User23 on 2022/6/7.
//

import Foundation
import SwiftUI
import FirebaseFirestoreSwift

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

struct User: Codable, Identifiable{
    @DocumentID var id: String? = nil
    var name: String = "" // 暱稱
    var description: String = "Hello..." // 自我介紹
    var gender: String = "woman" // "man" or "woman"
    var mail: String = "" // 信箱
    var imgUrl: String = "" // 頭像
    var money: Int = 0
    var activeTime: Int = 12 // 活躍時間
    var joinedDate: Date = Date()
    
    var backgroundImgIndex: Int = 1
    var headImgIndex: Int = 1
    var faceImgIndex: Int = 1
    var otherImgIndex: Int = 1
}
