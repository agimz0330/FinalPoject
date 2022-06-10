//
//  LoginView.swift
//  FinalPoject
//
//  Created by User23 on 2022/6/9.
//

import SwiftUI

struct LoginView: View {
    @State private var showLogin: Bool = true // true: Log in, false: Sign up
    
    var body: some View {
        ZStack{
            bg_color
                .edgesIgnoringSafeArea(.all)
            
            HStack{
                Image("background2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                
                ZStack{
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.white)
                        .frame(width: 360, height: 340)
                    
                    if showLogin{
                        LoginContentView(showLogin: $showLogin)
                    }
                    else{
                        SignUpContentView(showLogin: $showLogin)
                    }
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .previewLayout(.fixed(width: 812, height: 375))
    }
}

struct LoginContentView: View{
    @Binding var showLogin: Bool
    
    @State private var mail: String = ""
    @State private var password: String = ""
    
    var body: some View{
        VStack{
            HStack{
                Text("還沒有帳號")
                    .foregroundColor(pink_light)
                Image(systemName: "arrow.turn.right.down")
                    .foregroundColor(pink_light)
                    .offset(x: -5, y: 5)
            }
            .offset(x: 25, y: 5)
            
            ZStack{
                Button(action: {
                    showLogin = false
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 30)
                            .fill(pink_light)
                            .frame(width: 150, height: 40)
                        
                        Text(" Sigh Up")
                            .foregroundColor(Color.white)
                            .font((.custom("PinclloDemo", size: 30)))
                            
                    }
                    .offset(x: 60, y: 0)
                })
                
                ZStack{
                    RoundedRectangle(cornerRadius: 30)
                        .fill(LinearGradient(gradient: Gradient(colors: [orange_light, pink_dark]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
                        .frame(width: 150, height: 40)
                    
                    Text("Log In")
                        .foregroundColor(Color.white)
                        .font((.custom("PinclloDemo", size: 30)))
                        
                }
                .offset(x: -60, y: 0)
            }
            Divider()
                .frame(width: 320)
                .padding(5)
            
            HStack{
                Image(systemName: "envelope")
                    .foregroundColor(pink_light)
                    .font(.title)
                    .background(RoundedRectangle(cornerRadius: 0)
                                    .stroke(pink_light, lineWidth: 3)
                                    .frame(width: 45, height: 45)
                    )
                
                TextField("Email@mail...", text: $mail)
                    .foregroundColor(purple)
                    .padding()
                    .frame(width: 220, height: 47)
                    .background(pink_light)
            }
            .padding(1)
            
            HStack{
                Image(systemName: "lock")
                    .foregroundColor(pink_light)
                    .font(.title)
                    .background(RoundedRectangle(cornerRadius: 0)
                                    .stroke(pink_light, lineWidth: 3)
                                    .frame(width: 45, height: 45)
                    )
                
                SecureField("Password", text: $password)
                    .foregroundColor(purple)
                    .padding()
                    .frame(width: 220, height: 47)
                    .background(pink_light)
                    .offset(x: 6)
            }
            
            Button(action: {
                
            }, label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(LinearGradient(gradient: Gradient(colors: [pink_dark, red]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
                        .frame(width: 150, height: 40)

                    RoundedRectangle(cornerRadius: 20)
                        .stroke(pink_dark, lineWidth: 5)
                        .frame(width: 150, height: 40)
                    
                    Text("LOG IN")
                        .foregroundColor(Color.white)
                        .font((.custom("PinclloDemo", size: 35)))
                        
                }
                .padding()
            })
        }
    }
}

struct SignUpContentView: View{
    @Binding var showLogin: Bool
    
    @State private var name: String = ""
    @State private var mail: String = ""
    @State private var password: String = ""
    
    var body: some View{
        VStack{
            HStack{
                Image(systemName: "arrow.turn.left.down")
                    .foregroundColor(pink_light)
                    .offset(x: 5, y: 5)
                Text("已經有帳號了")
                    .foregroundColor(pink_light)
            }
            .offset(x: -25, y: 5)
            
            ZStack{
                Button(action: {
                    showLogin = true
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 30)
                            .fill(pink_light)
                            .frame(width: 150, height: 40)
                        
                        Text("Log In ")
                            .foregroundColor(Color.white)
                            .font((.custom("PinclloDemo", size: 30)))
                            
                    }
                    .offset(x: -60, y: 0)
                })
                
                ZStack{
                    RoundedRectangle(cornerRadius: 30)
                        .fill(LinearGradient(gradient: Gradient(colors: [orange_light, pink_dark]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
                        .frame(width: 150, height: 40)
                    
                    Text("Sigh Up")
                        .foregroundColor(Color.white)
                        .font((.custom("PinclloDemo", size: 30)))
                        
                }
                .offset(x: 60, y: 0)
            }
            Divider()
                .frame(width: 320)
                .padding(5)
            
            HStack{
                Image(systemName: "person")
                    .foregroundColor(pink_light)
                    .font(.title)
                    .background(RoundedRectangle(cornerRadius: 0)
                                    .stroke(pink_light, lineWidth: 3)
                                    .frame(width: 45, height: 45)
                    )
                
                TextField("Your nickname", text: $name)
                    .foregroundColor(Color.white)
                    .padding()
                    .frame(width: 220, height: 47)
                    .background(pink_light)
                    .offset(x: 3)
            }
            .padding(1)
            
            HStack{
                Image(systemName: "envelope")
                    .foregroundColor(pink_light)
                    .font(.title)
                    .background(RoundedRectangle(cornerRadius: 0)
                                    .stroke(pink_light, lineWidth: 3)
                                    .frame(width: 45, height: 45)
                    )
                
                TextField("Email@mail...", text: $mail)
                    .foregroundColor(purple)
                    .padding()
                    .frame(width: 220, height: 47)
                    .background(pink_light)
            }
            .padding(1)
            
            HStack{
                Image(systemName: "lock")
                    .foregroundColor(pink_light)
                    .font(.title)
                    .background(RoundedRectangle(cornerRadius: 0)
                                    .stroke(pink_light, lineWidth: 3)
                                    .frame(width: 45, height: 45)
                    )
                
                SecureField("Password", text: $password)
                    .foregroundColor(purple)
                    .padding()
                    .frame(width: 220, height: 47)
                    .background(pink_light)
                    .offset(x: 6)
            }
            
            Button(action: {
                
            }, label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(LinearGradient(gradient: Gradient(colors: [pink_dark, red]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
                        .frame(width: 150, height: 40)

                    RoundedRectangle(cornerRadius: 20)
                        .stroke(pink_dark, lineWidth: 5)
                        .frame(width: 150, height: 40)
                    
                    Text("SIGN UP")
                        .foregroundColor(Color.white)
                        .font((.custom("PinclloDemo", size: 35)))
                        
                }
                .padding()
            })
        }
    }
}

