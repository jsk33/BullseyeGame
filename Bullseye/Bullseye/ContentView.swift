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
        
    var body: some View {
        VStack {
            Spacer()
            
            // Target row
            HStack {
                Text("Put the bullseye as close as you can to:")
                Text("\(target)")
            }
            
            Spacer()
            
            // Slider row
            HStack {
                Text("1")
                Slider(value: $sliderValue, in: 1...100)
                Text("100")
            }
            
            Spacer()
            
            // Button row
            Button(action: {
                
                self.alertIsVisible = true
                
            }) {
                Text(/*@START_MENU_TOKEN@*/"Hit me!"/*@END_MENU_TOKEN@*/)
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
            }
            
            Spacer()
            
            // Score row
            HStack {
                Button(action: {
                    self.resetGame()
                }) {
                    Text("Start over")
                }
                Spacer()
                Text("Score:")
                Text("\(score)")
                Spacer()
                Text("Round:")
                Text("\(round)")
                Spacer()
                Button(action: {}) {
                    Text("Info")
                }
            }.padding(.bottom, 20)
        }
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
