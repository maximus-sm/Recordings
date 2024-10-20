//
//  ListOfElements.swift
//  RecordingsSwiftUI
//
//

import SwiftUI

struct ListOfElements: View {
    @State private var showAlert = false;
    @State private var showingRecorder = false;
    @State var elements = [Row(),Row(),Row(type: .recording)]
    var titleNmae = "Recordings"
    
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(elements) { element in
                    NavigationLink {
                        if(element.rowType == .folder){
                            ListOfElements()
                        }else{
                            Player()
                        }
                            
                    } label: {
                        element
                    }

                }.onDelete(perform: deleteRow(at:))
            }
            .navigationBarTitleDisplayMode(.inline)
                .navigationTitle(titleNmae)
                .toolbar {
                    
                    ToolbarItem(placement: .topBarLeading) {EditButton()}
                    
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        Button("New Folder", systemImage: "folder") {
                            showAlert.toggle()
                        }.alert("Create new folder", isPresented: $showAlert) {
                            VStack{
                                TextField("Give a name", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                                HStack {
                                    Button("Create"){//add action
                                        
                                    }
                                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                        Text("Cancel")
                                    })
                                }
                            }
        
                        }
                        //CreateFolderAlertView(showingAlert: $showAlert)
                        Button("Add", systemImage: "plus") {
                            showingRecorder.toggle()
                        }.sheet(isPresented: $showingRecorder, content: {
                            Recorder()
                        })
                    }
                }
        }
    }
    
    func deleteRow(at offsets: IndexSet){
        elements.remove(atOffsets: offsets)
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
    ListOfElements()
}
