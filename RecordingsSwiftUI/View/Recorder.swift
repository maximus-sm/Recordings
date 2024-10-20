//
//  Recording.swift
//  RecordingsSwiftUI
//
//

import SwiftUI

struct Recorder: View {
    @State private var showingAlert = false;
    
    var body: some View {
        
        VStack(spacing:50) {
            
                Image(systemName: "mic.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.red)
                    .aspectRatio(0.25, contentMode: .fit)
                    
                Button("STOP") {
                    showingAlert = true
                }
                .alert("Save the recording", isPresented: $showingAlert, actions: {
                    VStack{
                        TextField("Give a name", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        HStack {
                            Button("Save"){//add action
                                
                            }
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Text("Cancel")
                            })
                        }
                    }
                })
                .padding(EdgeInsets(top: 20, leading: 50, bottom: 20, trailing: 50))
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 15, height: 10), style: .continuous))
                
            }
    }
}

#Preview {
    Recorder()
}
