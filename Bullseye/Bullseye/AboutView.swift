//
//  AboutView.swift
//  Bullseye
//
//  Created by Jason Kim on 2019-12-29.
//  Copyright © 2019 Jason Kim. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack{
            Text("🎯 Bullseye 🎯")
            Text("Drag the slider to the target value!")
        }.navigationBarTitle("Info")
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width: 896, height: 414))
    }
}
