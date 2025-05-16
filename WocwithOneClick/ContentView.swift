//
//  ContentView.swift
//  WocwithOneClick
//
//  Created by Δήμητρα Μαλλιαρου on 23/2/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            BusinessHomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            SubscriptionView()
                .tabItem {
                    Label("Subscribe", systemImage: "eurosign.arrow.trianglehead.counterclockwise.rotate.90")
                }
            
            StoreProfileView()
                .tabItem {
                    Label("Store", systemImage: "bag.badge.plus")
                }
            
            UserProfileView(editProfile: .constant(false))
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

#Preview {
    ContentView()
}
