//
//  ListOfElements.swift
//  RecordingsSwiftUI
//
//

import SwiftUI

struct ListOfElements: View {
    @State private var showAlert = false;
    @State private var showingRecorder = false;
    @State var newItemName = "";//Optimize redrawings caused by this property
    //@State var currentFolder = ModelData().folder
    var viewModel = FolderViewModel(folder: Store.shared.rootFolder)
    var titleNmae = "Recordings"
    @State var folder:Folder
    
    init(folder:Folder){
        self.folder = folder;
        viewModel = FolderViewModel(folder: self.folder)
    }
    
    var body: some View {
        NavigationStack {
            List{
                let _ = print("list \(viewModel.name)")
                let _ = print("count in list \(viewModel.folder.contents.count)")

                ForEach(viewModel.folder.contents) { item in
                    NavigationLink {
                        if let folder = item as? Folder{
                            ListOfElements(folder: folder)
                        }else{
                            Play()
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
                        }.sheet(isPresented: $showingRecorder, content: {
                            //Record().environment(ModelData(currentFolder))
                            Record(viewModel.folder)
                        })
                    }
                }
        }
    }
    
    func deleteRow(at offsets: IndexSet){
        
        viewModel.delete(at: offsets.first! as Int)
    }
}


struct CreateFolderAlertView:View {
    @Binding private var showingAlert:Bool;
    
    var body: some View {
        
        Button("New Folder", systemImage: "folder") {
            showingAlert = true
        }.alert("Create new folder", isPresented: $showingAlert) {
            
            VStack{
                
                TextField("Give a name", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                
                HStack {
                    
                    Button("Create"){//add action
                    }
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Cancel").foregroundStyle(Color.red)
                    })
                    
                }
                
            }
        }
    }
}


#Preview {
    return ListOfElements(folder:Store.shared.rootFolder)
}


