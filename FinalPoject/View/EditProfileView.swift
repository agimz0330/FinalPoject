//
//  EditProfileView.swift
//  FinalPoject
//
//  Created by User23 on 2022/6/10.
//

import SwiftUI

struct EditProfileView: View {
    @State private var nickname: String = ""
    @State private var description: String = ""
    @State private var activeTime: Double = 0.0
    @State private var gender: String = "woman"
    
    var body: some View {
        List{
            HStack{
                Image(systemName: "person.fill.viewfinder")
                    .foregroundColor(red)
                Text("暱稱")
                    .foregroundColor(red)
                    .bold()
                Spacer()
                
                TextField("輸入暱稱", text: $nickname)
                    .padding()
                    .foregroundColor(purple)
                    .frame(width: 500)
            }
            .padding([.leading, .trailing])
            .background(Rectangle()
                            .fill(bg_color)
                            .frame(height: 50)
                            .cornerRadius(20)
            )
            
            HStack{
                Image(systemName: "scribble.variable")
                    .foregroundColor(red)
                Text("狀態消息")
                    .foregroundColor(red)
                    .bold()
                Spacer()
                
                TextField("用一句話介紹自己...", text: $description)
                    .foregroundColor(purple)
                    .padding()
                    .frame(width: 500)
            }
            .padding([.leading, .trailing])
            .background(Rectangle()
                            .fill(bg_color)
                            .frame(height: 50)
                            .cornerRadius(20)
            )
            
            HStack{
                Image(systemName: "figure.wave")
                    .foregroundColor(red)
                Text("性別")
                    .foregroundColor(red)
                    .bold()
                Spacer()
                
                Picker(selection: $gender, label: Text("Picker")){
                    Text("男").tag("man")
                    Text("女").tag("woman")
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                .frame(width: 500)
            }
            .padding([.leading, .trailing])
            .background(Rectangle()
                            .fill(bg_color)
                            .frame(height: 50)
                            .cornerRadius(20)
            )
            
            HStack{
                Image(systemName: "clock")
                    .foregroundColor(red)
                Text("活躍時間： \(Int(activeTime))")
                    .foregroundColor(red)
                    .bold()
                Spacer()
                
                Slider(value: $activeTime, in: 0...24, step: 1, minimumValueLabel: Text("0"), maximumValueLabel: Text("24"), label: {
                    Text("Time")
                })
                    .padding()
                    .frame(width: 500)
            }
            .padding([.leading, .trailing])
            .background(Rectangle()
                            .fill(bg_color)
                            .frame(height: 50)
                            .cornerRadius(20)
            )
        }
        .navigationTitle("Edit your profile")
        .navigationBarTitleDisplayMode(.inline)
        
        .navigationBarItems(trailing: Button("Save"){
            // action
        })
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
            .previewLayout(.fixed(width: 812, height: 375))
    }
}
