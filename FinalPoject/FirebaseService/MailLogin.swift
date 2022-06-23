//
//  MailLogin.swift
//  FinalPoject
//
//  Created by User23 on 2022/6/1.
//

import Foundation
import FirebaseAuth

func authCreateUser(mail: String, password: String, completion: @escaping(Result<String, NSError>) -> Void){ // 註冊
    // 從程式建立帳號: 傳入帳密建立新的使用者，成功時可取得使用者的 email & uid
    Auth.auth().createUser(withEmail: mail, password: password) { result, error in
        // withEmail: "peter@neverland.com", password: "123456"
         guard let user = result?.user,
               error == nil else { // 若 有使用者 && 沒有error，否則(slse)
            if let error = error{
                let err = error as NSError
                completion(.failure(err))
            }
            print(error?.localizedDescription)
            return // 建立失敗要返回
         }
        completion(.success(user.uid))
         // print(user.email, user.uid) // 建立成功，印出使用者資訊
    }
}

func authLogIn(mail: String, password: String, completion: @escaping(Result<String, NSError>) -> Void){ // 登入
    // password: "123456"
    Auth.auth().signIn(withEmail: mail, password: password) { result, error in
         guard error == nil else {
            if let error = error{
                let err = error as NSError
                completion(.failure(err))
            }
            return
         }
        if let uid = result?.user.uid{
            completion(.success(uid))
        }
    }
    // 登入後使用者將維持登入狀態，就算重新啟動 App ，使用者還是能保持登入。
}

func authIsLogInFunc() -> Bool{ // 判斷使用者是否已經登入
    if let user = Auth.auth().currentUser { // 當 Auth.auth().currentUser 有值時代表使用者已登入
        print("\(user.uid) login")
        return true
    } else {
        print("not login")
        return false
    }
}

func authLogOut(){
    do{
        try Auth.auth().signOut()
    }catch{
        print(error)
    }
}
