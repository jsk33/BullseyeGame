//
//  ContentView.swift
//  Bullseye
//
//  Created by Jason Kim on 2019-12-09.
//  Copyright © 2019 Jason Kim. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible: Bool = false
    @State var knockIsVisible: Bool = false
    
    var body: some View {
        VStack {
            Text("Welcome to my first app")
                .fontWeight(.semibold)
                .foregroundColor(Color.green)
            Button(action: {
                print("hello jason")
                self.alertIsVisible = true
            }) {
                Text(/*@START_MENU_TOKEN@*/"Hit me!"/*@END_MENU_TOKEN@*/)
            }
            .alert(isPresented: $alertIsVisible) { () -> Alert in
                return Alert(title: Text("Hello there!"), message: Text("this is my first popup"), dismissButton: .default(Text("awesome")))
            }
            Button(action: {
                self.knockIsVisible = true
            }) {
                Text("Knock, Knock")
            }.alert(isPresented: $knockIsVisible) { () -> Alert in
                return Alert(title: Text("who's there?"), message: Text("nobody"), dismissButton: .default(Text("nobody who?")))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
