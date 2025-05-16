//
//  BusinessHomeView.swift
//  WocwithOneClick
//
//  Created by Dimitra Malliarou on 7/5/25.
//

import SwiftUI

struct BusinessHomeView: View {
    var body: some View {
        VStack(spacing:0) {
            HStack {
                Text("Welcome, Dr. Adams")
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
                Image(systemName: "bell")
                Image(systemName: "person.crop.circle")
            }
            .padding()
            
            HStack(spacing: 16) {
                StatCard(title: "Views", value: "342")
                StatCard(title: "Messages", value: "12")
                StatCard(title: "Status", value: "Active")
            }
            .padding(.top, 30)
            
            Text("Quick Actions")
                .font(.headline)
                .padding(.top, 30)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            LazyVGrid(columns: [GridItem(), GridItem(), GridItem()], spacing: 20) {
                ActionButton(icon: "pencil", label: "Edit Listing")
                ActionButton(icon: "camera", label: "Add Photos")
                ActionButton(icon: "chart.bar", label: "Analytics")
                ActionButton(icon: "star", label: "Reviews")
                ActionButton(icon: "calendar", label: "Appointments")
                ActionButton(icon: "megaphone", label: "Promote")
            }
            .padding(.top, 20)
            
            //Spacer()
            
            VStack() {
                HStack {
                    Text("Explore Categories")
                        .font(.headline)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Image(systemName: "arrow.right")
                        .foregroundStyle(Color.gray)
                        .frame(width:30, height: 30)
                }
                Text("Discover professionals in other fields")
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }.padding(.top, 70)
            
//            Spacer()
//            
//            HStack {
//                BottomTabItem(icon: "house.fill", label: "Home", selected: true)
//                BottomTabItem(icon: "message", label: "Messages")
//                BottomTabItem(icon: "calendar", label: "Calendar")
//                BottomTabItem(icon: "chart.bar", label: "Analytics")
//                BottomTabItem(icon: "ellipsis", label: "More")
//            }
//            .padding()
//            .background(Color(UIColor.systemGray6))
        }
    }
}

struct StatCard: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack {
            Text(value)
                .font(.title2)
                .fontWeight(.bold)
            Text(title)
                .font(.caption)
                .foregroundStyle(.gray)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.blue.opacity(0.1))
        .cornerRadius(12)
    }
}

struct ActionButton: View {
    let icon: String
    let label: String
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.title2)
                .padding()
                .background(Color.blue.opacity(0.1))
                .clipShape(Circle())
            Text(label)
                .font(.caption)
                .multilineTextAlignment(.center)
        }
    }
}

struct BottomTabItem: View {
    let icon: String
    let label: String
    var selected: Bool = false
    
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .foregroundStyle(selected ? .blue : .gray)
            Text(label)
                .font(.caption2)
                .foregroundStyle(selected ? .blue : .gray)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    BusinessHomeView()
}
