//
//  ListOfElements.swift
//  RecordingsSwiftUI
//
//

import SwiftUI

struct ListOfElements: View {
    var viewModel:FolderViewModel;
    @State private var showAlert = false;
    @State private var showingRecorder = false;
    @State var newItemName = "";//Optimize redrawings
    
    var titleNmae = "Recordings"
    
    init(folder:Folder){
        viewModel = FolderViewModel(folder: folder)
    }
    
    var body: some View {
        let model = viewModel
        NavigationStack {
            List{
                ForEach(model.contents) { item in
                    NavigationLink {
                        if let folder = item as? Folder{
                            ListOfElements(folder: folder)
                        }else{
                            let recording = item as! Recording;
                            Play(recording)
                        }
                            
                    } label: {
                        //Row(name: item.name)
                        Row(type:item.self, name:item.name, id:item.uuid.uuidString)
                    }

                }.onDelete(perform: deleteRow(at:))
                
            }.animation(.easeInOut)
            .navigationBarTitleDisplayMode(.inline)
                .navigationTitle(titleNmae)
                .toolbar {
                    
                    ToolbarItem(placement: .topBarLeading) {EditButton()}
                    
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        Button("New Folder", systemImage: "folder") {
                            showAlert.toggle()
                        }.alert("Create new folder", isPresented: $showAlert) {

                            VStack{
                                TextField("Give a name", text:$newItemName)
                                HStack {
                                    Button("Create"){//add action
                                        viewModel.create(name: newItemName)
                                    }
                                    Button(action: {}, label: {
                                        Text("Cancel")
                                    })
                                }
                            }
        
                        }
                        //CreateFolderAlertView(showingAlert: $showAlert)
                        Button("Add", systemImage: "plus") {
                            showingRecorder.toggle()
                        }.fullScreenCover(isPresented: $showingRecorder, content: {
                            Record().environment(viewModel)
                        })
                    }
                }
        }
    }
    
    func deleteRow(at offsets: IndexSet){
        //viewModel.delete(at: offsets.first! as Int)
        viewModel.delete(at: offsets)
    }
}


#Preview {
    return ListOfElements(folder: Store.shared.rootFolder)
}


