//
//  MakeRoleView.swift
//  FinalPoject
//
//  Created by User23 on 2022/6/3.
//

import SwiftUI

struct MakeRoleView: View {
    @ObservedObject var game: Game
    @Binding var showMakeRoleView: Bool
    
    @State private var backgroundIndex: Int = 1
    @State private var headIndex: Int = 1
    @State private var faceIndex: Int = 1
    @State private var otherIndex: Int = 1
    @State private var choosePart = "background"
    @State private var bgColor: Color = bg_color
    
    var body: some View {
        let threeRowGrid = Array(repeating: GridItem(), count: 3)
        
        ZStack{
            bgColor
                .edgesIgnoringSafeArea(.all)
            
            HStack(spacing: 0){
                VStack{
                    Button(action: { // 返回按鈕
                        showMakeRoleView = false
                    }, label: {
                        ZStack{
                            Circle()
                                .foregroundColor(Color.white)
                                .frame(width: 60, height: 60)
                            
                            Image(systemName: "arrow.left")
                                .font(.largeTitle)
                                .accentColor(pink_light)
                        }
                    })
                    .padding()
                    
                    Spacer()
                    
                    Button(action: { // 隨機按鈕
                        if game.user.gender == "man"{
                            backgroundIndex = Int.random(in: 1...15)
                            headIndex = Int.random(in: 1...30)
                            faceIndex = Int.random(in: 1...23)
                            otherIndex = Int.random(in: 1...11)
                        }
                        else{
                            backgroundIndex = Int.random(in: 1...15)
                            headIndex = Int.random(in: 1...37)
                            faceIndex = Int.random(in: 1...17)
                            otherIndex = Int.random(in: 1...7)
                        }
                    }, label: {
                        ZStack{
                            Circle()
                                .foregroundColor(Color.white)
                                .frame(width: 60, height: 60)
                            
                            Image(systemName: "shuffle")
                                .font(.largeTitle)
                                .accentColor(pink_light)
                        }
                    })
                    .padding()
                }
                // 左上角：返回/隨機按鈕
                
                ZStack{
                    if game.user.gender == "man"{
                        ManView(backgroundIndex: $backgroundIndex, headIndex: $headIndex, faceIndex: $faceIndex, breadIndex: $otherIndex, bgColor: bgColor)
                    }
                    else{
                        WomanView(backgroundIndex: $backgroundIndex, headIndex: $headIndex, faceIndex: $faceIndex, glassIndex: $otherIndex, bgColor: bgColor)
                    }
                    
                    VStack(alignment: .leading){
                        Spacer()
                        
                        HStack{
                            ZStack{
                                Circle()
                                    .foregroundColor(Color.white)
                                    .frame(width: 60, height: 60)
                                
                                ColorPicker("Choose backgroud color", selection: $bgColor)
                                    .labelsHidden()
                            }
                            
                            Button(action: { // save
                                var uiImage: UIImage
                                
                                game.user.backgroundImgIndex = backgroundIndex
                                game.user.headImgIndex = headIndex
                                game.user.faceImgIndex = faceIndex
                                game.user.otherImgIndex = otherIndex
                                
                                if game.user.gender == "man"{
                                    uiImage = ManView(backgroundIndex: $backgroundIndex, headIndex: $headIndex, faceIndex: $faceIndex, breadIndex: $otherIndex, bgColor: bgColor).snapshot()
                                }
                                else{
                                    uiImage = WomanView(backgroundIndex: $backgroundIndex, headIndex: $headIndex, faceIndex: $faceIndex, glassIndex: $otherIndex, bgColor: bgColor).snapshot()
                                }
                                
                                game.saveImgURL(img: uiImage)
                                showMakeRoleView = false
                                
                            }, label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 30)
                                        .fill(pink_light)
                                        .frame(width: 120, height: 60)

                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color.white, lineWidth: 5)
                                        .frame(width: 120, height: 60)
                                    
                                    Text("Save")
                                        .foregroundColor(Color.white)
                                        .font((.custom("PinclloDemo", size: 45)))
                                        
                                }
                                .padding()
                            })
                            
                            
                            Spacer()
                        }
                    }
                }
                
                ZStack{
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 70)
                        .border(orange_light, width: 5)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack(spacing: 0){
                        Button(action: {
                            choosePart = "background"
                        }, label: {
                            if game.user.gender == "man"{
                                partImgPreview(imgName: "background10")
                            }
                            else{
                                partImgPreview(imgName: "background2")
                            }
                        })
                        Button(action: {
                            choosePart = game.user.gender + "_head"
                        }, label: {
                            if game.user.gender == "man"{
                                partImgPreview(imgName: "man_head2")
                            }
                            else{
                                partImgPreview(imgName: "woman_head11")
                            }
                        })
                        Button(action: {
                            choosePart = game.user.gender + "_face"
                        }, label: {
                            if game.user.gender == "man"{
                                partImgPreview(imgName: "man_face13")
                            }
                            else{
                                partImgPreview(imgName: "woman_face15")
                            }
                        })
                        Button(action: {
                            if game.user.gender == "man"{
                                choosePart = "man_bread"
                            }
                            else{
                                choosePart = "woman_glass"
                            }
                        }, label: {
                            if game.user.gender == "man"{
                                partImgPreview(imgName: "man_bread9")
                            }
                            else{
                                partImgPreview(imgName: "woman_glass3")
                            }
                        })
                    }
                }
                
                ZStack{
                    Rectangle()
                        .fill(Color.white)
                        .edgesIgnoringSafeArea(.all)
                    
                    ScrollView{
                        LazyVGrid(columns: threeRowGrid, spacing: 5){
                            ForEach(1..<part_count[choosePart]! + 1, id: \.self){ i in
                                Button(action: {
                                    if choosePart == "background"{
                                        backgroundIndex = i
                                    }
                                    else if choosePart == "man_head" || choosePart == "woman_head"{
                                        headIndex = i
                                    }
                                    else if choosePart == "man_face" || choosePart == "woman_face"{
                                        faceIndex = i
                                    }
                                    else{ // man_bread || "woman_glass"
                                        otherIndex = i
                                    }
                                }, label: {
                                    Image("\(choosePart)\(i)")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 70, height: 70)
                                })
                            }
                        }
                    }
                    .padding()
                }
                
            }
        }
        .onAppear{
            backgroundIndex = game.user.backgroundImgIndex
            headIndex = game.user.headImgIndex
            faceIndex = game.user.faceImgIndex
            otherIndex = game.user.otherImgIndex
        }
    }
}

struct partImgPreview: View {
    var imgName: String
    
    var body: some View{
        Image("\(imgName)")
            .resizable()
            .scaledToFit()
            .frame(width: 60, height: 60)
            .padding(5)
            .border(orange_light, width: 3)
    }
}

struct ManView: View {
    @Binding var backgroundIndex: Int
    @Binding var headIndex: Int
    @Binding var faceIndex: Int
    @Binding var breadIndex: Int
    var bgColor: Color
    
    var body: some View{
        let man_head_size: [ImgSize] = [
            ImgSize(h: 135, x: -5, y: -15), // 1
            ImgSize(h: 140, x: -5, y: -15),
            ImgSize(h: 155, x: -5, y: -25),
            ImgSize(h: 145, x: -5, y: -20),
            ImgSize(h: 145, x: -5, y: -20),
            ImgSize(h: 145, x: -5, y: -20),
            ImgSize(h: 145, x: -5, y: -20),
            ImgSize(h: 140, x: 5, y: -15),
            ImgSize(h: 150, x: 5, y: -20),
            ImgSize(h: 145, x: 10, y: -20), // 10
            ImgSize(h: 145, x: 5, y: -20),
            ImgSize(h: 150, x: 0, y: -25),
            ImgSize(h: 150, x: 5, y: -20),
            ImgSize(h: 180, x: -10, y: 5),
            ImgSize(h: 185, x: -20, y: 5),
            ImgSize(h: 185, x: -15, y: 5),
            ImgSize(h: 220, x: -20, y: -15),
            ImgSize(h: 200, x: -20, y: -5),
            ImgSize(h: 165, x: -10, y: 10),
            ImgSize(h: 185, x: -25, y: 5), // 20
            ImgSize(h: 185, x: -20, y: 5),
            ImgSize(h: 185, x: 0, y: -10),
            ImgSize(h: 180, x: 0, y: -5),
            ImgSize(h: 200, x: -5, y: -20),
            ImgSize(h: 200, x: 0, y: -20),
            ImgSize(h: 190, x: 10, y: -10),
            ImgSize(h: 185, x: -5, y: -10),
            ImgSize(h: 190, x: 10, y: -15),
            ImgSize(h: 220, x: -5, y: -25),
            ImgSize(h: 170, x: -10, y: 5)
        ]
        
        ZStack{
            bgColor
            
            Image("background\(backgroundIndex)")
                .resizable()
                .scaledToFit()
                
            Group{
                Image("man_head\(headIndex)")
                    .resizable()
                    .scaledToFit()
                    .frame(height: man_head_size[headIndex-1].height)
                    .offset(man_head_size[headIndex-1].offset)
                
                if faceIndex>=1 && faceIndex<=20{
                // 1~9 + 10~20
                    Image("man_face\(faceIndex)")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 55)
                        .offset(x: 15, y: 5)
                }
                else{
                // 21~23
                    Image("man_face\(faceIndex)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 55, height: 55)
                        .offset(x: 20, y: 10)
                }
                
                if breadIndex==7{
                    Image("man_bread\(breadIndex)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80)
                        .offset(x: 0, y: 30)
                }
                else if breadIndex>=1 && breadIndex<=6{
                // 1~7
                    Image("man_bread\(breadIndex)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80)
                        .offset(x: 0, y: 45)
                }
                else{
                // 8~11
                    Image("man_bread\(breadIndex)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60)
                        .offset(x: 15, y: 25)
                }
            }
            .scaleEffect(1.1)
        }
        .frame(width: 275, height: 250, alignment: .center)
    }
}

struct WomanView: View {
    @Binding var backgroundIndex: Int
    @Binding var headIndex: Int
    @Binding var faceIndex: Int
    @Binding var glassIndex: Int
    var bgColor: Color
    
    var body: some View{
        let woman_head_size: [ImgSize] = [
            ImgSize(h: 150, x: 0, y: 0), // 1
            ImgSize(h: 130, x: 0, y: 0),
            ImgSize(h: 160, x: -10, y: 5),
            ImgSize(h: 150, x: 5, y: 5),
            ImgSize(h: 140, x: 10, y: 0),
            ImgSize(h: 150, x: 5, y: 5), // 6
            ImgSize(h: 200, x: 5, y: 25),
            ImgSize(h: 160, x: 5, y: 20),
            ImgSize(h: 140, x: 15, y: 0),
            ImgSize(h: 120, x: 5, y: 5),
            ImgSize(h: 100, x: 5, y: 15), // 11
            ImgSize(h: 170, x: 0, y: 25),
            ImgSize(h: 110, x: 10, y: 0),
            ImgSize(h: 120, x: 15, y: 0),
            ImgSize(h: 150, x: 25, y: -10),
            ImgSize(h: 110, x: 15, y: 0), // 16
            ImgSize(h: 150, x: 20, y: 10),
            ImgSize(h: 110, x: 15, y: -15),
            ImgSize(h: 125, x: 15, y: -5),
            ImgSize(h: 110, x: 15, y: -5),
            ImgSize(h: 130, x: 10, y: 0), // 21
            ImgSize(h: 125, x: 20, y: 30),
            ImgSize(h: 130, x: 10, y: 30),
            ImgSize(h: 135, x: 25, y: 0),
            ImgSize(h: 155, x: 15, y: -10),
            ImgSize(h: 125, x: 20, y: 0), // 26
            ImgSize(h: 120, x: -15, y: -10),
            ImgSize(h: 160, x: 5, y: -10),
            ImgSize(h: 130, x: 15, y: 5),
            ImgSize(h: 180, x: 30, y: -10),
            ImgSize(h: 105, x: 5, y: -25), // 31
            ImgSize(h: 180, x: 30, y: 0),
            ImgSize(h: 130, x: 25, y: -5),
            ImgSize(h: 160, x: 20, y: 5),
            ImgSize(h: 340, x: 40, y: 0),
            ImgSize(h: 245, x: 55, y: 5), // 36
            ImgSize(h: 255, x: 25, y: 15)
            ]
        ZStack{
            bgColor
            
            Image("background\(backgroundIndex)")
                .resizable()
                .scaledToFit()
                
            Group{
                Image("woman_head\(headIndex)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: woman_head_size[headIndex-1].height)
                    .offset(woman_head_size[headIndex-1].offset)
            
                if faceIndex>=1 && faceIndex<=9{
                // 1~9
                    Image("woman_face\(faceIndex)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 50)
                        .offset(x: -10, y: 10)
                }
                else if faceIndex>=10 && faceIndex<=14{
                // 10~14
                    Image("woman_face\(faceIndex)")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 50)
                        .offset(x: -10, y: 5)
                }
                else{
                // 15~17
                    Image("woman_face\(faceIndex)")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 50)
                        .offset(x: 0, y: 5)
                }
                
                // 1~7
                Image("woman_glass\(glassIndex)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 75)
                    .offset(x: -10, y: -10)
                
                
            }
            .scaleEffect(1.1)
        }
        .frame(width: 275, height: 250, alignment: .center)
        .padding()
    }
}
