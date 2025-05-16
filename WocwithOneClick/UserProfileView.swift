//
//  UserProfileView.swift
//  WocwithOneClick
//
//  Created by Dimitra Malliarou on 12/5/25.
//

import SwiftUI

struct UserProfileView: View {
    @Binding var editProfile: Bool
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .foregroundStyle(.gray)
                    .padding(.top, 20)
                
                
                VStack(spacing: 4) {
                    Text("John Applessed")
                        .font(.title).bold()
                    
                    Text("Software engineer based in San Francisco.\nPassionate about technology and photo.")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.secondary)
                }
                
                List {
                    NavigationLink(destination: EditableProfileView()) {
                        Label("Edit Profile", systemImage: "person.crop.circle")
                    }

                    NavigationLink(destination: SettingsView()) {
                        Label("Settings", systemImage: "gearshape")
                    }

                    NavigationLink(destination: Text("Notifications View")) {
                        Label("Notifications", systemImage: "bell")
                    }

                    Button(role: .destructive) {
                        // Log out logic
                    } label: {
                        Label("Log Out", systemImage: "arrow.right.square")
                            .foregroundColor(.red)
                    }
                }
                .listStyle(.insetGrouped)
            }
        }
        .navigationTitle("Profile")
    }
}

#Preview {
    UserProfileView(editProfile: .constant(false))
}
