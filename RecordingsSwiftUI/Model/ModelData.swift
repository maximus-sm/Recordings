//
//  ModelData.swift
//  RecordingsSwiftUI
//
//  Created by Sundet Mukhtar on 21.10.2024.
//

import Foundation

@Observable class ModelData{
    var folder = Store.shared.rootFolder;
    var contents = [Item]()
    
    init(){
        //folder = Store.shared.rootFolder;
        contents = folder.contents
        
    }
    
    init(_ folder:Folder){
        self.folder = folder
        contents = folder.contents
    }
    
    
}
