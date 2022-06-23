//
//  ContentView.swift
//  FinalPoject
//
//  Created by User23 on 2022/5/4.
//

import SwiftUI


struct ContentView: View {
    @StateObject var game = Game()
    
    var body: some View {
        ZStack{
            TabView{
                ZStack{
                    
                }
                .tabItem {
                    Text("HOME")
                    Image(systemName: "house")
                }
                ProfileView(game: game)
                    .tabItem{
                        Text("Profile")
                        Image(systemName: "person.crop.circle")
                    }
            }
            .accentColor(orange_dark)
            if !game.isLogin{
                LoginView(game: game)
            }
        }
        .alert(isPresented: $game.showAlert, content: {
            Alert(title: Text("\(game.alertTitle)"))
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.fixed(width: 812, height: 375))
    }
}
