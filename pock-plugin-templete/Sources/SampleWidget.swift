//
//  SampleWidget.swift
//  pock-plugin-templete
//
//  Created by p-x9 on 2021/03/11.
//  
//

import PockKit

class SampleWidget: PKWidget {
    var identifier: NSTouchBarItem.Identifier = NSTouchBarItem.Identifier(rawValue: "com.test.samplewidget")

    var customizationLabel: String = "SampleWidget"

    var view: NSView!

    var count = 1

    var button: NSButton!

    required init() {
        self.button = NSButton(title: "Sample", image: NSImage(systemSymbolName: "hands.sparkles", accessibilityDescription: nil) ?? NSImage(), target: self, action: #selector(handleButtonTapped(_:)))
        self.button.font = NSFont.systemFont(ofSize: 15)
        self.view = self.button
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
