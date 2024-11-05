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
    var nameLabel = Text("Row name")
    
    init(type: RowType = .folder, name: String = "Name") {
        self.rowType = type
        self.nameLabel = Text(name)
        image = Text(rowType == .folder ? "📁":"🔊")
        id = UUID().uuidString
    }
    
    init(type:Item, name: String = "Name", id: String = UUID().uuidString) {
        if(type is Recording){
            rowType = .recording
        }
        nameLabel = Text(name)
        image = Text(rowType == .folder ? "📁":"🔊")
        self.id = id
        
    }
    
    
    var body: some View {
        HStack{
            image
            nameLabel
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
