//
//  Row.swift
//  RecordingsSwiftUI
//
//

import SwiftUI

struct Row: View ,Identifiable{
    private(set) var id: String
    var rowType:RowType = .folder
    var image = Text("📁")
    var name = Text("Row name")
    
    init(type: RowType = .folder, name: Text = Text("Row name")) {
        self.rowType = type
        self.name = name
        image = Text(rowType == .folder ? "📁":"🔊")
        id = UUID().uuidString
    }
    
    var body: some View {
        HStack{
            image
            name
            Spacer()
        }
    }
}

enum RowType{
    case folder
    case recording
}

#Preview {
    Row()
}
