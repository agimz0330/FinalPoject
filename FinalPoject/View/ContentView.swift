//
//  ContentView.swift
//  FinalPoject
//
//  Created by User23 on 2022/5/4.
//

import SwiftUI


struct ContentView: View {
    @StateObject var authUser = AuthUser()
    @State private var isLogin: Bool = true
    
    var body: some View {
        ZStack{
            TabView{
                ZStack{
                    
                }
                .tabItem {
                    Text("HOME")
                    Image(systemName: "house")
                }
                ProfileView()
                    .tabItem{
                        Text("Profile")
                        Image(systemName: "person.crop.circle")
                    }
            }
            .accentColor(orange_dark)
            if !isLogin{
                LoginView()
            }
        }
        .alert(isPresented: $authUser.showAlert, content: {
            Alert(title: Text("\(authUser.alertTitle)"))
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.fixed(width: 812, height: 375))
    }
}
