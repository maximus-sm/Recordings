//
//  Recording.swift
//  RecordingsSwiftUI
//
//

import SwiftUI

struct Record: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(FolderViewModel.self) var viewModel;
    @State private var showingAlert = false;
    @State private var name = ""
    
    //var folder: Folder?;
    //var viewModel:RecordViewModel
    var isDissmissed = false
    

    var body: some View {
        @Bindable var model = viewModel;
        VStack(spacing:50) {
            if(model.isDismissed){
                //let _ = print("before")
                //let _ = dismiss()//??
                //let _ = print("after")
            }
            
            Image(systemName: "mic.circle.fill")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.red)
                .aspectRatio(0.25, contentMode: .fit)
            
            Text("\(model.time)")
                .font(.title)
                .foregroundStyle(.gray)
        
            
            Button("STOP") {
                showingAlert.toggle()
            }
            .alert("Save the recording", isPresented: $showingAlert, actions: {
                VStack{
                    TextField("Give a name", text: $name)
                        .autocorrectionDisabled(true)
                        
                    HStack {
                        Button("Save") {
                            model.stop(name)
                            dismiss()
                        }
                        Button(action: {
                            model.stop(nil)
                            dismiss()
                        }, label: {
                            Text("Cancel")
                        })
                    }
                }
            })
            .padding(EdgeInsets(top: 20, leading: 50, bottom: 20, trailing: 50))
            .background(.blue)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 15, height: 10), style: .continuous))
            
            
        }.onAppear(perform: {
            model.start()
        })
        
    }
}

#Preview {
    var folder = Store.shared.rootFolder;
    @State var viewModel = FolderViewModel(folder: folder)
    return Record().environment(viewModel)
}
