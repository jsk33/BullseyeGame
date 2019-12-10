//
//  ContentView.swift
//  Bullseye
//
//  Created by Jason Kim on 2019-12-09.
//  Copyright © 2019 Jason Kim. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Welcome to my first app")
                .fontWeight(.semibold)
                .foregroundColor(Color.green)
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text(/*@START_MENU_TOKEN@*/"Hit me!"/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
