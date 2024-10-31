//
//  FolderViewModel.swift
//  RecordingsSwiftUI
//
//  Created by Sundet Mukhtar on 30.10.2024.
//

import Foundation

@Observable class FolderViewModel{
    private(set) var folder:Folder
    private(set) var contents:[Item]
    private(set) var name:String
    
    init(folder: Folder) {
        self.folder = folder
        contents = folder.contents
        name = folder.name
    }
    
    func create(name:String){
        let f = Folder(name: name, uuid: UUID())
        folder.add(f)
        //Arrays in swift are value types, 
        contents = folder.contents
    }
    
    
    func delete(item:Item){
        folder.remove(item)
        contents = folder.contents
    }
    
    func delete(at index:Int){
        if(0 <= index && index < contents.endIndex){
            folder.remove(contents[index])
        }
    }
    
    
}
