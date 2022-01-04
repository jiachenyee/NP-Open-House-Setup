//
//  SetupApp.swift
//  Setup
//
//  Created by Jia Chen Yee on 3/1/22.
//

import SwiftUI

@main
struct SetupApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { _ in
                        let window = NSApplication.shared.windows.first!
                        
                        window.level = NSWindow.Level(rawValue: Int(CGShieldingWindowLevel()) + 2)
                        window.setFrame(CGRect(x: 0, y: NSScreen.main!.frame.minY, width: NSScreen.main!.frame.width, height: NSScreen.main!.frame.height / 2), display: true)
                        
                        window.styleMask.remove(.closable)
                        window.styleMask.remove(.fullScreen)
                        window.styleMask.remove(.miniaturizable)
                        window.styleMask.remove(.resizable)
                        window.titleVisibility = .hidden
                        window.toolbar = nil
                        window.titlebarAppearsTransparent = true
                    }
                }
        }
    }
}
