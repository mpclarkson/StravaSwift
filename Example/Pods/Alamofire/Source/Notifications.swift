// Notifications.swift
// Copyright (c) 2021 Copilot

import Foundation

public extension Notification.Name {
    /// Used as a namespace for all `URLSessionTask` related notifications.
    enum Task {
        /// Posted when a `URLSessionTask` is resumed. The notification `object` contains the resumed `URLSessionTask`.
        public static let DidResume = Notification.Name(rawValue: "org.alamofire.notification.name.task.didResume")

        /// Posted when a `URLSessionTask` is suspended. The notification `object` contains the suspended `URLSessionTask`.
        public static let DidSuspend = Notification.Name(rawValue: "org.alamofire.notification.name.task.didSuspend")

        /// Posted when a `URLSessionTask` is cancelled. The notification `object` contains the cancelled `URLSessionTask`.
        public static let DidCancel = Notification.Name(rawValue: "org.alamofire.notification.name.task.didCancel")

        /// Posted when a `URLSessionTask` is completed. The notification `object` contains the completed `URLSessionTask`.
        public static let DidComplete = Notification.Name(rawValue: "org.alamofire.notification.name.task.didComplete")
    }
}

// MARK: -

public extension Notification {
    /// Used as a namespace for all `Notification` user info dictionary keys.
    enum Key {
        /// User info dictionary key representing the `URLSessionTask` associated with the notification.
        public static let Task = "org.alamofire.notification.key.task"

        /// User info dictionary key representing the responseData associated with the notification.
        public static let ResponseData = "org.alamofire.notification.key.responseData"
    }
}
