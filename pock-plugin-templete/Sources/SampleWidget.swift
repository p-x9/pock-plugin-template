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

    required init() {
        let button = NSButton(title: "Sample", image: NSImage(systemSymbolName: "hands.sparkles", accessibilityDescription: nil) ?? NSImage(), target: self, action: #selector(handleButton(_:)))
        button.font = NSFont.systemFont(ofSize: 15)
        self.view = button
    }

    @objc
    func handleButton(_ sender: Any?) {
        NSLog("button tapped!!")
        guard let button = sender as? NSButton else {
            return
        }
        button.title = "\(count)"
        count += 1
    }

}
