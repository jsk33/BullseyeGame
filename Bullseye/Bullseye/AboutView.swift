//
//  AboutView.swift
//  Bullseye
//
//  Created by Jason Kim on 2019-12-29.
//  Copyright © 2019 Jason Kim. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    
    let pastelOrange = Color.init(red: 255.0/255.0, green: 214.0/255.0, blue: 179.0/255.0)
    
    struct HeadingStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 30))
                .padding([.top, .bottom], 20)
        }
    }
    
    struct TextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 16))
                .padding([.bottom], 20)
                .padding([.horizontal], 60)
        }
    }
    
    var body: some View {
        Group {
            VStack{
                Text("🎯 Bullseye 🎯").modifier(HeadingStyle())
                Text("Drag the slider to the target value!").modifier(TextStyle())
            }.navigationBarTitle("Info")
             .background(pastelOrange)
        }.background(Image("Background"))
        
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width: 896, height: 414))
    }
}
