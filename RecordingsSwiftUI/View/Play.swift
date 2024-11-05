//
//  Recording.swift
//  RecordingsSwiftUI
//
//

import SwiftUI

struct Play: View {
    var name = "Recording"
    //@State private var sliderProgress:Float = 0.0;
    private var viewModel:PlayViewModel
    
    
    init(_ recording:Recording){
        viewModel = PlayViewModel(recording)
    }
    
    var body: some View {
        @Bindable var model = viewModel;
        VStack(alignment: .center, spacing: 30){
            HStack {
                Text(model.title)
                    .font(.title)
                    .bold()
                    .foregroundStyle(.gray)
                //TextField(name, text: )
            }
            VStack{
                HStack{
                    Text(model.progress)
                        .font(.title2)
                        .foregroundStyle(.gray)
                    Spacer()
                    Text(model.duration)
                        .font(.title2)
                        .foregroundStyle(.gray)
                }
                
                Slider(value: $model.sliderValue, in: (0.0)...(model.maxSliderValue)) { editing in
                    if(!editing){
                        model.setProgress()
                    }
                }
            
            }.padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
           
            Button(action: {
                model.action()
            }, label: {
                Image(systemName: model.isPlaying ? "pause.circle.fill":"play.circle.fill" )
                    .resizable()
                    .foregroundStyle(.primary)
                    .scaledToFit()
                    .aspectRatio(0.07, contentMode: .fit)
                    .animation(.snappy, value: model.isPlaying)
            })
            
            
        }.onDisappear(perform: {
            viewModel.setNil()
        })
    }
}

//#Preview {
//    Play()
//}
