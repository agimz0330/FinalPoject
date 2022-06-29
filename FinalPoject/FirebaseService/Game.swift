//
//  Game.swift
//  FinalPoject
//
//  Created by User23 on 2022/6/21.
//

import Foundation
import SwiftUI

import FirebaseAuth

import FirebaseFirestore
import FirebaseFirestoreSwift

class Game: ObservableObject{
    @AppStorage("userMail") var userMail: Data?
    @AppStorage("userPassword") var userPassword: Data?
    
    @Published var user: User = User()
    
    @Published var isLogin: Bool = false
    @Published var showAlert: Bool = false
    @Published var alertTitle: String = ""
    
    func getLoginState(){
        // 從UserDefaults讀出
        if let userMail = userMail,
           let userPassword = userPassword{
            let decoder = JSONDecoder()
            if let decodeMail = try? decoder.decode(String.self, from: userMail),
               let decodePassWord = try? decoder.decode(String.self, from: userPassword){
                logIn(mail: decodeMail, password: decodePassWord)
            }
        }
    }
    
    func saveLoginState(mail: String, password: String){
        let encoder = JSONEncoder()
        if let encodeMail = try? encoder.encode(mail),
           let encodePassword = try? encoder.encode(password){
            userMail = encodeMail
            userPassword = encodePassword
        }
    }
    
    func signUp(name: String, mail: String, password: String){
        authCreateUser(mail: mail, password: password){ result in
            switch result{
            case .failure(let err):
                switch err.code{
                case AuthErrorCode.emailAlreadyInUse.rawValue:
                    self.alertTitle = "此信箱已經註冊過了"
                case AuthErrorCode.networkError.rawValue:
                    self.alertTitle = "網路連線錯誤"
                default:
                    self.alertTitle = "Unknown error: \(err.localizedDescription)"
                }
                self.showAlert = true
                return
                
            case .success(let id):
                print(id)
                self.createUser(uid: id, mail: mail, name: name)
                self.logIn(mail: mail, password: password) // 註冊完自動登入
                // user. adduser(id, name, email, password)
                // user.listen to user data  change(id)
            }
        }
    }
    
    func createUser(uid: String, mail: String, name: String){
        let db = Firestore.firestore()
        user.id = uid
        user.mail = mail
        user.name = name
        user.joinedDate = Date()
        do{
            try db.collection("users").document(self.user.id!).setData(from: user)
        }catch{
            print(error)
        }
        
    }
    
    func logIn(mail: String, password: String){
        authLogIn(mail: mail, password: password){ result in
            switch result{
            case .failure(let err):
                switch err.code{
                case AuthErrorCode.wrongPassword.rawValue:
                    self.alertTitle = "密碼錯誤"
                case AuthErrorCode.invalidEmail.rawValue:
                    self.alertTitle = "無此信箱"
                case AuthErrorCode.networkError.rawValue:
                    self.alertTitle = "網路連線錯誤"
                default:
                    self.alertTitle = "Unknown error: \(err.localizedDescription)"
                }
                self.showAlert = true
                return
                
            case .success(let id):
                print(id)
                if authIsLogInFunc(){
                    self.isLogin = true
                }
                self.readUserData(uid: id)
                // user.listen to user data  change(id)
            }
            
        }
    }
    
    func logOut(){
        authLogOut()
        if !authIsLogInFunc(){
            self.isLogin = false
        }
        else{
            self.alertTitle = "登出失敗"
            self.showAlert = true
        }
    }

    func setUserData(){
        let db = Firestore.firestore()
        do{
            try db.collection("users").document(user.id!).setData(from: user)
        }catch{
            print(error)
        }
        
    }
    
    func readUserData(uid: String){
        let db = Firestore.firestore()
        
        db.collection("users").document(uid).getDocument { document, error in
            guard let document = document,
                  document.exists,
                  let userrr = try? document.data(as: User.self) else{
                return
            }
            self.user = userrr
            if self.user.gender == "man"{
                if self.user.headImgIndex>30 || self.user.faceImgIndex>23 || self.user.otherImgIndex>11{
                    self.user.headImgIndex = 1
                    self.user.faceImgIndex = 1
                    self.user.otherImgIndex = 1
                    self.setUserData()
                }
            }
            else{
                if self.user.headImgIndex>37 || self.user.faceImgIndex>17 || self.user.otherImgIndex>7{
                    self.user.headImgIndex = 1
                    self.user.faceImgIndex = 1
                    self.user.otherImgIndex = 1
                    self.setUserData()
                }
            }
        }
    }
    
    func editUserData(){
        let db = Firestore.firestore()
        do{
            try db.collection("users").document(user.id!).setData(from: user)
        }catch{
            print(error)
        }
    }
    
    func saveImgURL(img: UIImage){
        imgToURL(img: img) { result in
            switch result{
            case .success(let url):
                self.user.imgUrl = url
                self.editUserData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

