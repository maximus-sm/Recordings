//
//  Recording.swift
//  RecordingsSwiftUI
//
//

import SwiftUI

struct Player: View {
    var name = "Recording"
    var currentTime = "00:00"
    var overallTime = "03:00"
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 30){
            HStack {
                Text(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/)
                //TextField(name, text: )
            }
            VStack{
                HStack{
                    Text(currentTime)
                    Spacer()
                    Text(overallTime)
                }
                Slider(value: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(10)/*@END_MENU_TOKEN@*/)
            }.padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
            Button("Play") {
                
            }
        }
    }
}

#Preview {
    Player()
}
