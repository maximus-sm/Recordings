//
//  FolderModel.swift
//  RecordingsSwiftUI
//
//  Created by Sundet Mukhtar on 31.10.2024.
//

import Foundation


@Observable class FolderModel{
    
    var folder:Folder
    
    init(folder: Folder) {
        self.folder = folder
    }
}
