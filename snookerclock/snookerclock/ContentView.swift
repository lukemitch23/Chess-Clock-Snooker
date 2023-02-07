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
    @State var timerValue = "60"
    @State var timerIntValue = 0
    @State var playeroneout = false
    @State var playertwoout = false
    @State var multiply = ""
    @State var multiplier = 10
    @State var playernames = true
    @State var playeronename = "Player 1"
    @State var playertwoname = "Player 2"
    @State var playeronescore = 0
    @State var playertwoscore = 0
    @State var showSettings = false
    @State var changePlayerNames = false
    
    let playerone = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let playertwo = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Group{
                Button("\(Image(systemName: "gearshape.fill"))"){
                    showSettings.toggle()
                }.font(.system(size:35))
                    .sheet(isPresented: $showSettings) {
                        Form {
                            Section("Settings") {
                                HStack {
                                    Text("Player 1 name:").fontWeight(.bold)
                                    TextField("\(playeronename)", text: $playeronename)
                                }
                                HStack {
                                    Text("Player 2 name:").fontWeight(.bold)
                                    TextField("\(playertwoname)", text: $playertwoname)
                                }
                                HStack {
                                    Text("Multiplier:").fontWeight(.bold)
                                    TextField("\(multiplier)", value: $multiplier, formatter: NumberFormatter()).keyboardType(.numberPad)
                                }
                                HStack {
                                    Text("Timer value:").fontWeight(.bold)
                                    TextField("\(timerValue)", text: $timerValue).keyboardType(.numberPad)
                                }
                                Button("Done") {
                                    updateTimers()
                                    showSettings.toggle()
                                }
                                
                            }
                        }
                    }
            }.offset(x:130,y:-75)
            
            Group{
                Text("\(playeronename)").font(.system(size: 50))
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
                    .alert("Out of time! \(playertwoname) wins with a score of \(playertwoscore)", isPresented: $playeroneout, actions: {
                        Button("Ok", action: gamereset)
                    })
                Text("\(playeronename) score: \(playeronescore)").font(.system(size:20))
            }.offset(y:-90)
            
            
            
            Group{
                HStack{
                    Button("\(Image(systemName: "circle.fill"))"){
                        playeronetimer += (1 * multiplier)
                        playeronescore += 1
                    }.foregroundColor(.red).font(.system(size:35))
                    
                    Button("\(Image(systemName: "circle.fill"))"){
                        playeronetimer += (2 * multiplier)
                        playeronescore += 2
                    }.foregroundColor(.yellow).font(.system(size:35))
                    
                    Button("\(Image(systemName: "circle.fill"))"){
                        playeronetimer += (3 * multiplier)
                        playeronescore += 3
                    }.foregroundColor(.green).font(.system(size:35))
                    
                    Button("\(Image(systemName: "circle.fill"))"){
                        playeronetimer += (4 * multiplier)
                        playeronescore += 4
                    }.foregroundColor(.brown).font(.system(size:35))
                    
                    Button("\(Image(systemName: "circle.fill"))"){
                        playeronetimer += (5 * multiplier)
                        playeronescore += 5
                    }.foregroundColor(.blue).font(.system(size:35))
                    
                    Button("\(Image(systemName: "circle.fill"))"){
                        playeronetimer += (6 * multiplier)
                        playeronescore += 6
                    }.foregroundColor(.orange).font(.system(size:35))
                    
                    Button("\(Image(systemName: "circle.fill"))"){
                        playeronetimer += (7 * multiplier)
                        playeronescore += 7
                    }.foregroundColor(.black).font(.system(size:35))

                }
            }.offset(y:-50)
            
            Group {
                HStack(spacing: 30) {
                    Button("\(playeronename)") {
                        playeronerunning = true
                        playertworunning = false
                    }.font(.system(size: 20)).foregroundColor(.black).fontWeight(.bold)
                    
                    Button("\(playertwoname)") {
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
                        gamereset()
                    }.font(.system(size: 20)).fontWeight(.bold)
                    
                }
            }
            
            Group{
                HStack{
                    Button("\(Image(systemName: "circle.fill"))"){
                        playertwotimer += (1 * multiplier)
                        playertwoscore += 1
                    }.foregroundColor(.red).font(.system(size:35))
                    
                    Button("\(Image(systemName: "circle.fill"))"){
                        playertwotimer += (2 * multiplier)
                        playertwoscore += 2
                    }.foregroundColor(.yellow).font(.system(size:35))
                    
                    Button("\(Image(systemName: "circle.fill"))"){
                        playertwotimer += (3 * multiplier)
                        playertwoscore += 3
                    }.foregroundColor(.green).font(.system(size:35))
                    
                    Button("\(Image(systemName: "circle.fill"))"){
                        playertwotimer += (4 * multiplier)
                        playertwoscore += 4
                    }.foregroundColor(.brown).font(.system(size:35))
                    
                    Button("\(Image(systemName: "circle.fill"))"){
                        playertwotimer += (5 * multiplier)
                        playertwoscore += 5
                    }.foregroundColor(.blue).font(.system(size:35))
                    
                    Button("\(Image(systemName: "circle.fill"))"){
                        playertwotimer += (6 * multiplier)
                        playertwoscore += 6
                    }.foregroundColor(.orange).font(.system(size:35))
                    
                    Button("\(Image(systemName: "circle.fill"))"){
                        playertwotimer += (7 * multiplier)
                        playertwoscore += 7
                    }.foregroundColor(.black).font(.system(size:35))
                }
            }.offset(y:50)
    
            
            Group{
                Text("\(playertwoname) score: \(playertwoscore)").font(.system(size:20))
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
                Text("\(playertwoname)").font(.system(size: 50))
            }.rotationEffect(.degrees(180)).offset(y:90)
            .alert("Out of time! \(playeronename) wins with a score of \(playeronescore)", isPresented: $playertwoout, actions: {
                Button("Ok", action: gamereset)
            })
        }
    }
    
    func setnames(){
        playeronename = playeronename
        playertwoname = playertwoname
    }
    
    func gamereset(){
        timerIntValue = Int(timerValue) ?? 60
        playeronerunning = false
        playertworunning = false
        playeronetimer = timerIntValue
        playertwotimer = timerIntValue
        playeronescore = 0
        playertwoscore = 0
    }
    
    func updateTimers() {
        timerIntValue = Int(timerValue) ?? 60
        multiplier = Int(multiply) ?? 10
        playeronetimer = timerIntValue
        playertwotimer = timerIntValue
        playeronescore = 0
        playertwoscore = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
