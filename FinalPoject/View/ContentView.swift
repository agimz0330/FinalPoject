//
//  ContentView.swift
//  FinalPoject
//
//  Created by User23 on 2022/5/4.
//

import SwiftUI


struct ContentView: View {
    @State private var isLogin: Bool = false
    
    var body: some View {
        ZStack{
            bg_color
                .edgesIgnoringSafeArea(.all)

            RoundedRectangle(cornerRadius: 30)
                .fill(pink_light)
                .frame(width: 120, height: 80)

            RoundedRectangle(cornerRadius: 30)
                .stroke(pink_dark, lineWidth: 10)
                .frame(width: 120, height: 80)
                
                
//            if isLogin{
//                VStack{
//                   // GameView()
//                }
//            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.fixed(width: 812, height: 375))
    }
}
