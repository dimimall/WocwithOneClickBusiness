//
//  SettingsView.swift
//  WocwithOneClick
//
//  Created by Dimitra Malliarou on 16/5/25.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            Form {
                // General Settings
                Section(header: Text("General")) {
                    NavigationLink(destination: Text("Account Details")) {
                        Label("Account", systemImage: "person.crop.circle")
                    }
                    NavigationLink(destination: Text("Notifications Settings")) {
                        Label("Notifications", systemImage: "eurosign.arrow.trianglehead.counterclockwise.rotate.90")
                    }
                    NavigationLink(destination: Text("Subscription Settings")) {
                        Label("Subscription", systemImage: "bell")
                    }
                }

                // Preferences
                Section(header: Text("Preferences")) {
                    NavigationLink(destination: Text("Appearance Settings")) {
                        Label("Appearance", systemImage: "paintbrush")
                    }
                    Toggle(isOn: .constant(true)) {
                        Label("Dark Mode", systemImage: "moon.fill")
                    }
                }

                // Support
                Section(header: Text("Support")) {
                    NavigationLink(destination: Text("Help & FAQ")) {
                        Label("Help Center", systemImage: "questionmark.circle")
                    }
                    NavigationLink(destination: Text("About the App")) {
                        Label("About", systemImage: "info.circle")
                    }
                }

                // Sign Out
                Section {
                    Button(role: .destructive) {
                        // Sign-out logic here
                    } label: {
                        Label("Sign Out", systemImage: "arrow.right.square")
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
