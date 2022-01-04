//
//  SetupAction.swift
//  Setup
//
//  Created by Jia Chen Yee on 3/1/22.
//

import Foundation
import AppKit

struct SetupAction: Identifiable, Equatable {
    
    var title: String
    var image: String
    
    var id: String { title }
    
    var urls: [URL] = []
    
    var action: (([URL]) -> ())
    
    init(title: String, image: String, urls: URL..., action: @escaping (([URL]) -> ()) = { urls in
        for url in urls {
        NSWorkspace.shared.open(url)
    }}) {
        self.title = title
        self.image = image
        self.urls = urls
        self.action = action
    }
    
    init(title: String, image: String, shellScript: String) {
        self.title = title
        self.image = image
        self.urls = []
        self.action = { _ in
            Self.shell(command: shellScript)
        }
    }
    
    static let setupInstructions = [
        SetupAction(title: "Launch CodeCollab demo",
                    image: "app.badge.fill",
                    urls: URL(string: "https://codecollab.io/@yeejiachen/NP%20Open%20House%20demo")!, action: { urls in
                        NSWorkspace.shared.open(urls[0])
                        sleep(3)
                    }),
        SetupAction(title: "Launch Friction",
                    image: "app.badge.fill",
                   shellScript: "open /Users/student/Library/Developer/Xcode/DerivedData/Friction-euzausepxxuphzavkosgmazjpzoo/Build/Products/Debug/Friction.app"),
        SetupAction(title: "Show Source Code",
                    image: "hammer.fill",
                    urls: URL(string: "file:///Users/student/Downloads/Friction-main/Friction.xcodeproj")!),
        SetupAction(title: "Launch Websites",
                    image: "link",
                    urls: URL(string: "https://friction.tk.sg")!)
    ]
    
    static func == (lhs: SetupAction, rhs: SetupAction) -> Bool {
        lhs.id == rhs.id
    }
    
    @discardableResult static func shell(command: String) -> Int32 {
        let task = Process()
        task.launchPath = "/usr/bin/env"
        task.arguments = ["bash", "-c", command]
        task.launch()
        task.waitUntilExit()
        return task.terminationStatus
    }
}
