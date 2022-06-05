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
            
            if isLogin{
                VStack{
                   // GameView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.fixed(width: 896, height: 414))
    }
}
