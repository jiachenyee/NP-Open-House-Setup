//
//  ContentView.swift
//  Setup
//
//  Created by Jia Chen Yee on 3/1/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var currentActionIndex = -1
    @State var isAlertPresented = false
    
    var body: some View {
        VStack {
            
            ZStack {
                Rectangle()
                    .fill()
                    .foregroundColor(currentActionIndex < SetupAction.setupInstructions.count ? .yellow : .green)
                    .frame(height: 50)
                
                Text("NP Open House Automated Setup")
                    .bold()
                    .font(.title)
                    .padding()
            }
            
            
            HStack {
                if currentActionIndex < SetupAction.setupInstructions.count {
                    ProgressView()
                        .scaleEffect(0.5)
                    Text("Running automated setup")
                        .font(.title2)
                } else {
                    Image(systemName: "hand.thumbsup.fill")
                    Text("Setup Complete")
                        .font(.title2)
                        .onAppear {
                            isAlertPresented = true
                            Timer.scheduledTimer(withTimeInterval: 10, repeats: false) { _ in
                                exit(3)
                            }
                        }
                }
            }
            
            VStack {
                List(SetupAction.setupInstructions) {
                    instruction in
                    
                    let currentIndex = SetupAction.setupInstructions.firstIndex(of: instruction)!
                    
                    HStack {
                        Group {
                            if currentActionIndex < currentIndex {
                                Image(systemName: "timer")
                            } else if currentActionIndex > currentIndex {
                                Image(systemName: "checkmark.circle.fill")
                            } else {
                                ProgressView()
                                    .scaleEffect(0.5)
                                    .onAppear {
                                        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
                                            instruction.action(instruction.urls)
                                            
                                            withAnimation {
                                                currentActionIndex += 1
                                            }
                                        }
                                    }
                            }
                        }
                        .frame(width: 50)
                        Label(instruction.title, systemImage: instruction.image)
                    }
                }
                
                Text("If this app takes more than 30s to automatically setup, please contact Jia Chen.")
                    .padding()
            }
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
                currentActionIndex += 1
            }
        }
        .alert(isPresented: $isAlertPresented) {
            Alert(title: Text("Automated Setup Complete"),
                  message: Text("Friction has been set up. To start demo, launch the Friction app on the iPad and plug it in."),
                  primaryButton: .cancel(Text("OK")) {
                exit(3)
            }, secondaryButton: .default(Text("Try Again")) {
                Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
                    currentActionIndex = 0
                }
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
