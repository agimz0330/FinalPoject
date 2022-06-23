//
//  ProfileView.swift
//  FinalPoject
//
//  Created by User23 on 2022/6/10.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfileView: View {
    @ObservedObject var game: Game
    @State private var showMakeRoleView: Bool = false
    
    var body: some View {
        NavigationView{
            
            ZStack{
                bg_color
                    .edgesIgnoringSafeArea(.all)
                
                HStack(alignment: .top){
                    VStack(alignment: .leading){
                        ZStack{
                            Circle()
                                .fill(LinearGradient(gradient: Gradient(colors: [orange_light, orange_dark, red, purple]),
                                                     startPoint: UnitPoint(x: 0, y: 0),
                                                     endPoint: UnitPoint(x: 1, y: 1)))
                                .frame(width: 150, height: 150)
                            
                            Circle()
                                .fill(Color.white)
                                .frame(width: 135, height: 135)
                            
                            Button(action: {
                                showMakeRoleView = true
                            }, label: {
                                WebImage(url: game.user.imgUrl)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 135, height: 135)
                                    .clipShape(Circle())
                            })
                        }
                        
                        Text("\(game.user.name)")
                            .foregroundColor(purple)
                            .font((.custom("PinclloDemo", size: 30)))
                        
                        Text("\(game.user.description)")
                            .foregroundColor(purple)
                            .frame(width: 180)
                    }
                    .padding()
                    
                    Divider()
                    
                    VStack{
                        HStack(alignment: .top){
                            VStack{
                                if game.user.gender == "woman"{
                                    Image("womanIcon")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 60, height: 60)
                                    
                                    Text("I'm a girl.")
                                        .foregroundColor(pink_dark)
                                }
                                else{
                                    Image("manIcon")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 60, height: 60)
                                    
                                    Text("I'm a boy.")
                                        .foregroundColor(pink_dark)
                                }
                            }
                            .frame(width: 120)
                            
                            Divider()
                            
                            VStack(alignment: .trailing){
                                Image("time")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                
                                Text("活躍時間")
                                    .foregroundColor(red)
                                Text("\(game.user.activeTime) 'clock")
                                    .foregroundColor(pink_dark)
                            }
                            .frame(width: 120)
                            
                            Divider()
                            
                            VStack{
                                Image("money")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                
                                VStack(alignment: .trailing){
                                    Text("擁有財產")
                                        .foregroundColor(red)
                                    Text("$ \(game.user.money)")
                                        .foregroundColor(pink_dark)
                                }
                            }
                            .frame(width: 120)
                        }
                        
                        HStack(alignment: .top){
                            VStack{
                                Image("email")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                
                                VStack(alignment: .trailing){
                                    Text("電子信箱")
                                        .foregroundColor(red)
                                    Text("\(game.user.mail)")
                                        .foregroundColor(pink_dark)
                                }
                            }
                            .frame(width: 120)
                            
                            Divider()
                            
                            VStack{
                                Image("date")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                
                                VStack(alignment: .trailing){
                                    Text("加入時間")
                                        .foregroundColor(red)
                                    Text("2022/ 6/ 10")
                                        .foregroundColor(pink_dark)
                                }
                            }
                            .frame(width: 120)
                            
                            Divider()
                            
                            VStack{
                                Button(action: {
                                    game.logOut()
                                }, label: {
                                    Image("logout")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 60, height: 60)
                                    
                                    Text("Log out")
                                        .foregroundColor(red)
                                        .font((.custom("PinclloDemo", size: 25)))
                                })
                                
                            }
                            .frame(width: 120)
                        }
                    }
                
                    Divider()
                    
                    NavigationLink(
                        destination: EditProfileView(game: game),
                        label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(pink_dark)
                                    .frame(width: 85, height: 40)

                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.white, lineWidth: 3)
                                    .frame(width: 85, height: 40)
                                
                                HStack(spacing: 3){
                                    Image(systemName: "pencil.and.outline")
                                        .accentColor(Color.white)
                                    Text("Edit ")
                                        .foregroundColor(Color.white)
                                        .font((.custom("PinclloDemo", size: 30)))
                                }
                            }
                        })
                }
                .padding()
            }
            .navigationBarHidden(true)
            
            .fullScreenCover(isPresented: $showMakeRoleView, content: {
                MakeRoleView(game: game, showMakeRoleView: $showMakeRoleView)
            })
        }
    }
}

