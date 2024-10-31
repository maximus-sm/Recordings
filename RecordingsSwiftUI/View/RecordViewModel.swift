//
//  RecordViewModel.swift
//  RecordingsSwiftUI
//
//  Created by Sundet Mukhtar on 28.10.2024.
//

import Foundation

@Observable
class RecordViewModel{
    
    var folder:Folder
    var audioRecorder:Recorder?
    var recording  = Recording(name: "", uuid: UUID())
    var time = "";
    private(set) var isDismissed = false;
    
    init(_ f:Folder){
        folder = f;
        //print("Init record view model: f-id\(folder.self) f.contents-id \(folder.contents.self)")
        //start()
        //stop("")
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
            self.isDismissed = true
        }
    }
    
    
    func start(){
            self.audioRecorder = self.folder.store?.fileURL(for: self.recording).flatMap({  url in
                Recorder(url: url) { time in
                    if let t = time{
                        self.time = timeString(t);
                    }else{
                        //dismiss view;
                        self.isDismissed = true
                    }
                }
            })
            if self.audioRecorder == nil{
                //dismiss
                isDismissed = true
            }
        
        
    }
    
    
    func stop(_ title:String?){
        guard let title = title else{
            recording.deleted()
            return
        }
        
        recording.setName(title)
        folder.add(recording)
        //print("From record view model: f-id\(folder.self) f.contents-id \(folder.contents.self)")
    }
    
    deinit {
        //print("deinit From record view model: f-id\(folder.self) f.contents-id \(folder.contents.self)")
    }
    
}
