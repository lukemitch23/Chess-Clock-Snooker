//
//  ContentView.swift
//  snookerclock
//
//  Created by Luke Mitchell on 29/01/2023.
//

import SwiftUI

struct ContentView: View {
    @State var playeronetimer = 60
    @State var playertwotimer = 60
    @State var playeronerunning = false
    @State var playertworunning = false
    @State var showingAlert = false
    @State var timerValue = ""
    @State var timerIntValue = 0
    @State var playeroneout = false
    @State var playertwoout = false
    
    let playerone = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let playertwo = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Group{
                Text("Player 1").font(.system(size: 50))
                Text("\(playeronetimer)")
                    .onReceive(playerone) { _ in
                        if playeronetimer > 0 && playeronerunning {
                            playeronetimer -= 1
                        } else if playeronetimer == 0 {
                            playeroneout = true
                        } else {
                            playeronerunning = false
                        }
                    }.font(.system(size: 150, weight: .bold))
                    .alert("Out of time! Player 2 wins", isPresented: $playeroneout, actions: {
                        Button("Ok", action: gamereset)
                    })
            }.offset(y:-90)
            
            Group{
                HStack{
                    Button("\(Image(systemName: "circle.fill"))"){
                        playeronetimer += 10
                    }.foregroundColor(.red).font(.system(size:35))
                    
                    Button("\(Image(systemName: "circle.fill"))"){
                        playeronetimer += 20
                    }.foregroundColor(.yellow).font(.system(size:35))
                    
                    Button("\(Image(systemName: "circle.fill"))"){
                        playeronetimer += 30
                    }.foregroundColor(.green).font(.system(size:35))
                    
                    Button("\(Image(systemName: "circle.fill"))"){
                        playeronetimer += 40
                    }.foregroundColor(.brown).font(.system(size:35))
                    
                    Button("\(Image(systemName: "circle.fill"))"){
                        playeronetimer += 50
                    }.foregroundColor(.blue).font(.system(size:35))
                    
                    Button("\(Image(systemName: "circle.fill"))"){
                        playeronetimer += 60
                    }.foregroundColor(.orange).font(.system(size:35))
                    
                    Button("\(Image(systemName: "circle.fill"))"){
                        playeronetimer += 70
                    }.foregroundColor(.black).font(.system(size:35))

                }
            }.offset(y:-50)
            
            Group {
                HStack(spacing: 30) {
                    Button("Player 1") {
                        playeronerunning = true
                        playertworunning = false
                    }.font(.system(size: 20)).foregroundColor(.black).fontWeight(.bold)
                    
                    Button("Player 2") {
                        playertworunning = true
                        playeronerunning = false
                    }.font(.system(size: 20)).foregroundColor(.black).fontWeight(.bold)
                    
                    Button("Stop") {
                        playertworunning = false
                        playeronerunning = false
                    }.font(.system(size: 20)).foregroundColor(.black).fontWeight(.bold)
                    
                    Button("Reset", role: .destructive) {
                        playertworunning = false
                        playeronerunning = false
                        showingAlert = true
                    }.font(.system(size: 20)).fontWeight(.bold)
                        .alert("New Timer Value", isPresented: $showingAlert, actions: {
                            TextField("Enter the time in seconds", text: $timerValue).keyboardType(.numberPad)
                            Button("Ok", action: updateTimers)
                            Button("Cancel", role: .cancel, action: {})
                        })
                    
                }
            }
            
            Group{
                HStack{
                    Button("\(Image(systemName: "circle.fill"))"){
                        playertwotimer += 10
                    }.foregroundColor(.red).font(.system(size:35))
                    
                    Button("\(Image(systemName: "circle.fill"))"){
                        playertwotimer += 20
                    }.foregroundColor(.yellow).font(.system(size:35))
                    
                    Button("\(Image(systemName: "circle.fill"))"){
                        playertwotimer += 30
                    }.foregroundColor(.green).font(.system(size:35))
                    
                    Button("\(Image(systemName: "circle.fill"))"){
                        playertwotimer += 40
                    }.foregroundColor(.brown).font(.system(size:35))
                    
                    Button("\(Image(systemName: "circle.fill"))"){
                        playertwotimer += 50
                    }.foregroundColor(.blue).font(.system(size:35))
                    
                    Button("\(Image(systemName: "circle.fill"))"){
                        playertwotimer += 60
                    }.foregroundColor(.orange).font(.system(size:35))
                    
                    Button("\(Image(systemName: "circle.fill"))"){
                        playertwotimer += 70
                    }.foregroundColor(.black).font(.system(size:35))
                }
            }.offset(y:50)
    
            
            Group{
                Text("\(playertwotimer)")
                    .onReceive(playertwo) { _ in
                        if playertwotimer > 0 && playertworunning {
                            playertwotimer -= 1
                        } else if playertwotimer == 0 {
                            playertwoout = true
                        } else {
                            playertworunning = false
                        }
                    }.font(.system(size: 150, weight: .bold))
                Text("Player 2").font(.system(size: 50))
            }.rotationEffect(.degrees(180)).offset(y:90)
            .alert("Out of time! Player 1 wins", isPresented: $playertwoout, actions: {
                Button("Ok", action: gamereset)
            })
        }
    }
    
    func gamereset(){
        playeronerunning = false
        playertworunning = false
        playeronetimer = 60
        playertwotimer = 60
    }
    
    func updateTimers() {
        timerIntValue = Int(timerValue) ?? 60
        playeronetimer = timerIntValue
        playertwotimer = timerIntValue
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
