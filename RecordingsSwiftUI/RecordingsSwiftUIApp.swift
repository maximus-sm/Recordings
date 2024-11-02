//
//  RecordingsSwiftUIApp.swift
//  RecordingsSwiftUI
//
//

import SwiftUI

@main
struct RecordingsSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ListOfElements(folder: Store.shared.rootFolder)
        }
    }
}
