//
//  EditableProfileView.swift
//  WocwithOneClick
//
//  Created by Dimitra Malliarou on 16/5/25.
//

import SwiftUI
import PhotosUI


struct EditableProfileView: View {
    @State private var name: String = "John Appleseed"
    @State private var bio: String = "Software engineer based in San Francisco.\nPassionate about technology and photo."
    @State private var profileImage: UIImage? = nil
    @State private var photoPickerItem: PhotosPickerItem?
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        Spacer()
                        PhotosPicker(selection: $photoPickerItem, matching: .images, photoLibrary: .shared()) {
                            if let image = profileImage {
                                Image(uiImage: image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width:100, height: 100)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.gray.opacity(0.5), lineWidth: 1))
                            }
                            else {
                                Circle()
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(width: 100, height: 100)
                                    .overlay(Image(systemName: "camera.fill").font(.title))
                            }
                        }
                        Spacer()
                    }
                    .padding()
                    
                }
                Section {
                    TextField("",text: $name)
                        .onChange(of: name){ newValue in
                            name = newValue
                        }
                    
                    TextEditor(text: $bio)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal)
                        .navigationTitle("About you")
                        .onChange(of: bio) { newValue in
                            bio = newValue
                        }
                }
                Section {
                    Button(action: {
                        print("Saved profile: \(name), \(bio)")
                    }){
                        Label("Save Changes", systemImage: "checkmark.circle.fill")
                    }
                    
                    Button(role: .destructive) {
                        
                    } label: {
                        Label("Log Out", systemImage: "arrow.right.square")
                    }
                }
            }
            .navigationTitle("Edit Profile")
            .onChange(of: photoPickerItem) { newItem in
                Task {
                    if let data = try? await newItem?.loadTransferable(type: Data.self), let uiImage = UIImage(data: data) {
                        profileImage = uiImage
                    }
                }
            }
        }
    }
}

#Preview {
    EditableProfileView()
}
