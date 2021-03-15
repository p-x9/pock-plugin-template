//
//  Preferences.swift
//  pock-plugin-templete
//
//  Created by p-x9 on 2021/03/15.
//  
//

import Foundation
import Defaults

extension NSNotification.Name {
    static let shouldReloadImage = NSNotification.Name("shouldReloadImage")
}

extension Defaults.Keys {
    static let imageNameToDisplay = Defaults.Key<Images>("imageNameToDisplay", default: Images.raised)
}
