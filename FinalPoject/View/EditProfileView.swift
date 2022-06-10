//
//  EditProfileView.swift
//  FinalPoject
//
//  Created by User23 on 2022/6/10.
//

import SwiftUI

struct EditProfileView: View {
    @State private var showMakeRoleView: Bool = false
    
    @State private var nickname: String = ""
    @State private var description: String = ""
    @State private var activeTime: Double = 0.0
    @State private var genderIndex: Int = 0
    
    var body: some View {
        List{
            TextField("輸入暱稱", text: $nickname)
                .foregroundColor(purple)
                .padding()
                .frame(width: 220, height: 47)
            
            Picker(selection: $genderIndex, label: Text("Picker")){
                Text("女")
                Text("男")
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Slider(value: $activeTime, in: 0...24, step: 1)
        }
        .navigationTitle("Edit your profile")
        .navigationBarTitleDisplayMode(.inline)
        
        .navigationBarItems(trailing: Button("Save"){
            // action
        })
        
        .fullScreenCover(isPresented: $showMakeRoleView, content: {
            MakeRoleView()
        })
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
            .previewLayout(.fixed(width: 812, height: 375))
    }
}
