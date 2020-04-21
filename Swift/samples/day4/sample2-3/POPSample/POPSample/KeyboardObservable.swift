//
//  KeyboardObservable.swift
//  POPSample
//
//  Created by 鈴木 大貴 on 2016/11/10.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import Foundation
import UIKit

protocol KeyboardObservable: class {
    var keyboardObservers: [Any] { get set }
    func keyboardWillShow(_ notification: Notification)
    func keyboardDidShow(_ notification: Notification)
    func keyboardWillHide(_ notification: Notification)
    func keyboardDidHide(_ notification: Notification)
    func addKeyboardObservers()
    func removeKeyboardObservers()
}

extension KeyboardObservable {
    func addKeyboardObservers() {
        keyboardObservers = [
            (UIResponder.keyboardWillShowNotification, keyboardWillShow(_:)),
            (UIResponder.keyboardDidShowNotification, keyboardDidShow(_:)),
            (UIResponder.keyboardWillHideNotification, keyboardWillHide(_:)),
            (UIResponder.keyboardDidHideNotification, keyboardDidHide(_:))
            ].map { NotificationCenter.default.addObserver(forName: $0, object: nil, queue: .main, using: $1) }
    }
    
    func removeKeyboardObservers() {
        keyboardObservers.forEach { NotificationCenter.default.removeObserver($0) }
        keyboardObservers.removeAll()
    }
}
