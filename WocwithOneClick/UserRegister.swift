//
//  UserContent.swift
//  WocwithOneClick
//
//  Created by Δήμητρα Μαλλιαρου on 23/2/25.
//

import SwiftUI
import PhotosUI


struct UserRegister: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var firstname: String = ""
    @State private var lastname: String = ""
    @State private var address: String = ""
    @State private var submit = false
    @State var imageSelection: PhotosPickerItem? = nil
    @State var uiImage: UIImage? = nil
    
    var photoPickerButton: some View {
        PhotosPicker(
          selection: $imageSelection,
          matching: .images,
          photoLibrary: .shared()) {
            Image(systemName: "camera.circle.fill")
              .font(.system(size: 50))
              .foregroundColor(.gray)
          }
      }
    
    var body: some View {
        
        NavigationStack {
            Section("Register") {
                Form {
                    HStack(alignment: .top){
                        VStack {
                            Image(uiImage: uiImage ?? UIImage())
                                .resizable()
                                .frame(width: 100,height: 100)
                                .padding()
                                .onChange(of: imageSelection) {
                                    Task
                                    { @MainActor in
                                        if let data = try? await imageSelection?.loadTransferable(type: Data.self) {
                                            uiImage = UIImage(data:data)
                                            return
                                        }
                                    }
                                }
                            photoPickerButton
                        }.padding()
                    }
                    .frame(maxWidth:.infinity,alignment: .center)
                    HStack {
                        VStack {
                            TextField("First Name", text: $firstname)
                            Divider()
                            TextField("Last Name", text: $lastname)
                            Divider()
                            TextField("Email", text: $email)
                            Divider()
                            TextField("Password", text: $password)
                            Divider()
                            TextField("Address", text: $address)
                            Divider()
                            Button(action: {
                                submit.toggle()
                            }, label: {
                                Text("Submit")
                                .font(.title)
                            }).buttonStyle(.borderedProminent)
                        }.padding()
                    }
                    .frame(width: UIScreen.main.bounds.width,height: 320,alignment: .center)
                }.background(Color.brown)
            }
        }
    }
}

#Preview {
    UserRegister()
}
