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
    
    var audioRecorder:Recorder?
    var recording  = Recording(name: "", uuid: UUID())
    var time = "00:00:00";
    private(set) var isDismissed = false;
    
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
        contents = folder.contents
    }
    
    
    func delete(at offsets:IndexSet){
        for i in offsets{
            folder.remove(contents[i])
        }
        contents = folder.contents;
    }
    
    
    //Methods for Record View.
    func start(){
        //print(folder.contents.count)
        self.audioRecorder = self.folder.store?.fileURL(for: self.recording).flatMap({  url in
            Recorder(url: url) { time in
                if let t = time{
                    self.time = timeString(t);
                }else{
                    //dismiss view;
                    print("dismiss")
                    self.isDismissed = true
                }
            }
        })
        if self.audioRecorder == nil{
            //dismiss
            print("dismiss")
            isDismissed = true
        }
        
        
    }
    
    
    func stop(_ title:String?){
        audioRecorder?.stop()
        guard let title = title else{
            recording.deleted()
            return
        }
        
        recording.setName(title)
        folder.add(recording)
        contents = folder.contents
        //print(folder.contents.count)
        //print("From record view model: f-id\(folder.self) f.contents-id \(folder.contents.self)")
    }
    
    
}

