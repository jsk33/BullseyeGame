//
//  ContentView.swift
//  Bullseye
//
//  Created by Jason Kim on 2019-12-09.
//  Copyright © 2019 Jason Kim. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    @State var score = 0
    @State var round = 1
    
    let midnightBlue = Color.init(red: 0.0/255.0, green: 51.0/255.0, blue: 102.0/255.0)
      
    struct LabelStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.white)
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
                .modifier(ShadowStyle())
        }
    }
    
    struct ValueStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.yellow)
                .font(Font.custom("Arial Rounded MT Bold", size: 24))
                .modifier(ShadowStyle())
        }
    }
    
    struct ShadowStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .shadow(color: Color.black, radius: 5, x: 2, y: 2)
        }
    }
    
    struct ButtonTextLarge: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
        }
    }
    
    struct ButtonTextSmall: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 12))
        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            // Target row
            HStack {
                Text("Put the bullseye as close as you can to:").modifier(LabelStyle())
                Text("\(target)").modifier(ValueStyle())
            }
            
            Spacer()
            
            // Slider row
            HStack {
                Text("1").modifier(LabelStyle())
                Slider(value: $sliderValue, in: 1...100).accentColor(Color.green)
                Text("100").modifier(LabelStyle())
            }
            
            Spacer()
            
            // Button row
            Button(action: {
                
                self.alertIsVisible = true
                
            }) {
                Text(/*@START_MENU_TOKEN@*/"Hit me!"/*@END_MENU_TOKEN@*/).modifier(ButtonTextLarge())
                }
            .alert(isPresented: $alertIsVisible) { () -> Alert in
                return Alert(
                        title: Text(alertTitle()),
                        message: Text("The slider's value is \(sliderValueRounded()).\n" + "You scored \(pointsForCurrentRound()) points this round."),
                        dismissButton: .default(Text("awesome")) {
                            self.totalPoints()
                            self.target = Int.random(in: 1...100)
                            self.round += 1
                            })
                }.background(Image("Button")).modifier(ShadowStyle())
            
            Spacer()
            
            // Score row
            HStack {
                Button(action: {
                    self.resetGame()
                }) {
                    HStack{
                        Image("StartOverIcon")
                        Text("Start over").modifier(ButtonTextSmall())
                    }
                }.background(Image("Button")).modifier(ShadowStyle())
                Spacer()
                Text("Score:").modifier(LabelStyle())
                Text("\(score)").modifier(ValueStyle())
                Spacer()
                Text("Round:").modifier(LabelStyle())
                Text("\(round)").modifier(ValueStyle())
                Spacer()
                NavigationLink(destination: AboutView()) {
                    HStack{
                        Image("InfoIcon")
                        Text("Info").modifier(ButtonTextSmall())
                    }
                }.background(Image("Button")).modifier(ShadowStyle())
            }.padding(.bottom, 20)
        }.background(Image("Background"), alignment: .center)
        .accentColor(midnightBlue)
        .navigationBarTitle("Bullseye")
    }
    
    func sliderValueRounded() -> Int {
        return Int(sliderValue.rounded())
    }
    
    func difference() -> Int {
        return abs(target - sliderValueRounded())
    }
    
    func pointsForCurrentRound() -> Int {
        let points = 100 - difference()
        let bonus: Int
        
        if difference() == 0 {
            bonus = 100
        } else if difference() == 1 {
            bonus = 50
        } else {
            bonus = 0
        }
        
        return points + bonus
    }
    
    func totalPoints() {
        score += pointsForCurrentRound()
    }
    
    func alertTitle() -> String {
        let title: String
        
        if difference() == 0 {
            title = "Perfect!"
        } else if difference() < 5 {
            title = "You almost had it!"
        } else if difference() <= 10 {
            title = "Not bad."
        } else {
            title = "Try harder mate!"
        }
        
        return title
    }
    
    func resetGame() {
        score = 0
        round = 1
        sliderValue = 50.0
        target = Int.random(in: 1...100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
