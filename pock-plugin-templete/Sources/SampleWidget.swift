//
//  SampleWidget.swift
//  pock-plugin-templete
//
//  Created by p-x9 on 2021/03/11.
//  
//

import PockKit
import Defaults

enum Images: String, Codable {
    case raised = "hand.raised"
    case thumbsup = "hand.thumbsup"
    case left = "hand.point.left"
    case sparkles = "hands.sparkles"
}

class SampleWidget: PKWidget {
    var identifier: NSTouchBarItem.Identifier = NSTouchBarItem.Identifier(rawValue: "SampleWidget")

    var customizationLabel: String = "SampleWidget"

    var view: NSView!

    var count = 1

    var button: NSButton!

    required init() {
        let name = Defaults[.imageNameToDisplay]
        self.button = NSButton(title: "Sample", image: NSImage(systemSymbolName: name.rawValue, accessibilityDescription: nil) ?? NSImage(), target: self, action: #selector(handleButtonTapped(_:)))
        self.button.font = NSFont.systemFont(ofSize: 15)
        self.view = self.button

        NSWorkspace.shared.notificationCenter.addObserver(self, selector: #selector(reloadImage), name: .shouldReloadImage, object: nil)
    }

    @objc
    func handleButtonTapped(_ sender: Any?) {
        NSLog("button tapped!!")
        guard let button = sender as? NSButton else {
            return
        }
        button.title = "\(count)"
        count += 1
    }

    @objc
    func reloadImage() {
        let name = Defaults[.imageNameToDisplay]
        button.image = NSImage(systemSymbolName: name.rawValue, accessibilityDescription: nil)
    }

}

extension SampleWidget: PKScreenEdgeMouseDelegate {
    private func shouldHighlight(for location: NSPoint, in view: NSView) -> Bool {
        self.button.convert(button.bounds, to: view).contains(location)
    }

    func screenEdgeController(_ controller: PKScreenEdgeController, mouseEnteredAtLocation location: NSPoint, in view: NSView) {
        button.isHighlighted = shouldHighlight(for: location, in: view)
    }

    func screenEdgeController(_ controller: PKScreenEdgeController, mouseMovedAtLocation location: NSPoint, in view: NSView) {
        button.isHighlighted = shouldHighlight(for: location, in: view)
    }

    func screenEdgeController(_ controller: PKScreenEdgeController, mouseClickAtLocation location: NSPoint, in view: NSView) {
        button.isHighlighted = shouldHighlight(for: location, in: view)
        if button.isHighlighted {
            handleButtonTapped(button)
        }
    }

    func screenEdgeController(_ controller: PKScreenEdgeController, mouseExitedAtLocation location: NSPoint, in view: NSView) {
        button.isHighlighted = false
    }
}
