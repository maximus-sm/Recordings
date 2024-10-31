//
//  RecordingsSwiftUIApp.swift
//  RecordingsSwiftUI
//
//

import SwiftUI

@main
struct RecordingsSwiftUIApp: App {
    @State private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            //ListOfElements()
            //Record().environment(modelData)
            //Record(modelData.folder)
            ListOfElements(folder: modelData.folder)
        }
    }
}
