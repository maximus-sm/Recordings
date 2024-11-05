//
//  PlayViewModel.swift
//  RecordingsSwiftUI
//
//  Created by Sundet Mukhtar on 03.11.2024.
//

import Foundation
import AVFoundation

@Observable class PlayViewModel{
    private var recording:Recording?
    private var player:Player?
    
    var title = ""
    var progress = "";
    var duration = "";
    var sliderValue:Float = 0.0;
    var maxSliderValue:Float = 1.0;
    
    var isPlaying = false;
    
    init(_ recording: Recording) {
        self.recording = recording
        
        if let url = self.recording?.fileURL {
            player = Player(url: url){ [weak self] time in
                if let t = time{
                    self?.updateProgressDisplays(progress: t, duration: self?.player?.duration ?? 0)
                }
                
            }
            
            if let p = player{
                updateProgressDisplays(progress: 0, duration: p.duration)
                title = recording.name
            }else{
                //recording = nil
                updateProgressDisplays(progress: 0, duration: 0)
            }
        }else{
            updateProgressDisplays(progress: 0, duration: 0)
        }
    }
    
    
    func updateProgressDisplays(progress: TimeInterval, duration: TimeInterval){
        self.progress = timeString(progress)
        self.duration = timeString(duration)
        sliderValue = Float(progress);
        maxSliderValue = Float(duration);
        updatePlayButton()
    }
    
    
    func updatePlayButton() {
        if player?.isPlaying == true {
            //playButton?.setTitle(.pause, for: .normal)
            if(!isPlaying) { isPlaying = true}
        } else if player?.isPaused == true {
            //playButton?.setTitle(.resume, for: .normal)
            if(isPlaying){ isPlaying = false }
        } else {
            //playButton?.setTitle(.play, for: .normal)
            isPlaying = false;
        }
    }
    
    func action(){
        player?.togglePlay()
        updatePlayButton()
    }
    
    func setProgress(){
        player?.setProgress(TimeInterval(sliderValue))
    }
    
    
    func setNil(){
        recording = nil;
    }
}
