//
//  MailLogin.swift
//  FinalPoject
//
//  Created by User23 on 2022/6/1.
//

import Foundation
import SwiftUI

import FirebaseAuth
import FirebaseStorage
//import FirebaseStorageSwift

func createUser(){ // 註冊
    // 從程式建立帳號: 傳入帳密建立新的使用者，成功時可取得使用者的 email & uid
    Auth.auth().createUser(withEmail: "peter@neverland.com", password: "123456") { result, error in
                
         guard let user = result?.user,
               error == nil else { // 若 有使用者 && 沒有error，否則(slse)
             print(error?.localizedDescription)
             return // 建立失敗要返回
         }
         print(user.email, user.uid) // 建立成功，印出使用者資訊
    }
}

func logIn(){ // 登入
    Auth.auth().signIn(withEmail: "peter@neverland.com", password: "123456") { result, error in
         guard error == nil else {
            print(error?.localizedDescription)
            return
         }
    }
    // 登入後使用者將維持登入狀態，就算重新啟動 App ，使用者還是能保持登入。
}

func isLogIn(){ // 判斷使用者是否已經登入
    if let user = Auth.auth().currentUser { // 當 Auth.auth().currentUser 有值時代表使用者已登入
        print("\(user.uid) login")
    } else {
        print("not login")
    }
}

func uploadPhoto(image: UIImage, completion: @escaping (Result<URL, Error>) -> Void) {
        
    let fileReference = Storage.storage().reference().child(UUID().uuidString + ".jpg") // 取得路徑
    if let data = image.jpegData(compressionQuality: 0.9) { // 將 UIImage 轉成 data，壓縮成0.9倍
        
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
