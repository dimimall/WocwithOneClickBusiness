//
//  StoreProfileView.swift
//  WocwithOneClick
//
//  Created by Dimitra Malliarou on 12/5/25.
//

import SwiftUI
import MapKit

struct StoreProfileView: View {
    
    let storeName = "Sunny Café"
    let description = "A cozy café serving organic coffee and pastries in the heart of downtown."
    let images = ["banner", "banner", "banner"] // Asset names
    let address = "123 Main Street, San Francisco, CA"
    let phone = "+1-555-123-4567"
    let website = "https://sunnycafe.com"
    let openingHours = [
        "Mon - Fri: 8 AM – 6 PM",
        "Sat - Sun: 9 AM – 5 PM"
    ]
    let reviews = [
        ("Jane D.", "Great coffee and very friendly staff!"),
        ("Mike B.", "Loved the atmosphere, will return again."),
    ]
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                Text(storeName)
                    .font(.largeTitle).bold()
                
                Text(description)
                    .font(.body)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(images, id: \.self) {
                            image in
                            Image(image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 200, height:  150)
                                .clipped()
                                .cornerRadius(12)
                        }
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("Address").font(.headline)
                    Text(address)
                        .foregroundStyle(.secondary)
                }
                
                Map(coordinateRegion: $region)
                    .frame(height: 200)
                    .cornerRadius(12)
                
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Opening Hours").font(.headline)
                    ForEach(openingHours, id: \.self) { hour in
                        Text(hour)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                
                HStack(spacing: 20) {
                    Button(action: {
                        if let url = URL(string: "tel:\(phone)") {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        Label("Call", systemImage: "phone")
                    }

                    Button(action: {
                        if let url = URL(string: website) {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        Label("Website", systemImage: "globe")
                    }
                }
                .padding(.top, 10)
                
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Reviews").font(.headline)
                    ForEach(reviews, id: \.0) { name, comment in
                        VStack(alignment: .leading) {
                            Text(name).bold()
                            Text(comment).font(.subheadline)
                        }
                        Divider()
                    }
                }
            }
            .padding()
            
        }
        .navigationTitle("Store Details")
    }
}

#Preview {
    StoreProfileView()
}
