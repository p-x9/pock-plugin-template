//
//  SampleWidgetPreferencePane.swift
//  pock-plugin-templete
//
//  Created by p-x9 on 2021/03/15.
//  
//
//
import PockKit
import Defaults

class SampleWidgetPreferencePane: NSViewController, PKWidgetPreference {
    static var nibName: NSNib.Name = "\(SampleWidgetPreferencePane.self)"

    @IBOutlet private var imageButton: NSPopUpButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }

    @IBAction private func handleImageButton(_ sender: Any) {
        Defaults[.imageNameToDisplay] = Images(rawValue: imageButton.selectedItem?.title ?? Images.thumbsup.rawValue) ?? .thumbsup
        NSWorkspace.shared.notificationCenter.post(name: .shouldReloadImage, object: nil)
    }

}
