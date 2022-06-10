//
//  ProfileView.swift
//  FinalPoject
//
//  Created by User23 on 2022/6/10.
//

import SwiftUI

struct ProfileView: View {
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
                            
                            Image("background15")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 140, height: 140)
                                .clipShape(Circle())
                            
                        }
                        
                        Text("Nick Name")
                            .foregroundColor(purple)
                            .font((.custom("PinclloDemo", size: 30)))
                        
                        Text("Some introduce of myself...\nI'm a banana;)")
                            .foregroundColor(purple)
                            .frame(width: 180)
                    }
                    .padding()
                    
                    Divider()
                    
                    VStack{
                        HStack(alignment: .top){
                            VStack{
                                Image("womanIcon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                
                                Text("I'm a girl.")
                                    .foregroundColor(pink_dark)
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
                                Text(" 3 p.m.")
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
                                    Text("$ 50")
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
                                    Text("00757015@ntou.mail.edu.tw")
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
                                Image("logout")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                
                                Text("Log out")
                                    .foregroundColor(red)
                                    .font((.custom("PinclloDemo", size: 25)))
                            }
                            .frame(width: 120)
                        }
                    }
                
                    Divider()
                    
                    NavigationLink(
                        destination: EditProfileView(),
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
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .previewLayout(.fixed(width: 812, height: 375))
    }
}
