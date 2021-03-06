//
//  UserControl.swift
//  FinalPoject
//
//  Created by User23 on 2022/6/15.
//

import Foundation
import SwiftUI

import FirebaseStorage
import FirebaseStorageSwift

func imgToURL(img: UIImage, completion: @escaping (Result<URL, Error>) -> Void) {
        
    let fileReference = Storage.storage().reference().child(UUID().uuidString + ".jpg") // 取得路徑
    if let data = img.jpegData(compressionQuality: 0.9) { // 將 UIImage 轉成 data，壓縮成0.9倍
        
        fileReference.putData(data, metadata: nil) { result in // metafata(圖片的額外資料)設為nil，使用putData上傳Storage
            switch result { // result Enum{ 成功(), 失敗 }
            case .success(_): // 成功, 不參考參數用_
                // 圖片上傳後，取得此圖片在 Storage 的連結
                fileReference.downloadURL { result in // 一樣有 result: Result{ sucess, failure } 成功狀態或失敗狀態
                    switch result {
                    case .success(let url):
                        completion(.success(url))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
