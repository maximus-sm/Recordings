//
//  ContentView.swift
//  RecordingsSwiftUI
//
//

import SwiftUI

struct ContentView: View {
    @Environment(ModelData.self) var modelData
    var body: some View {
        //Record().environment(modelData)
        Text("Hee")
        Record(modelData.folder)
    }
}

#Preview {
    ContentView().environment(ModelData())
}
