//
//  SubscriptionView.swift
//  WocwithOneClick
//
//  Created by Dimitra Malliarou on 6/5/25.
//

import SwiftUI

struct SubscriptionView: View {
    @State private var selectedOption = 0
    let options = [
        (title:"333", subtitle:"3 Months"),
        (title:"555", subtitle:"6 Months"),
        (title:"999", subtitle:"12 Months")
    ]
    var body: some View {
        VStack(spacing: 20) {
            Image("banner") // Replace with your actual image name
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 250, height: 250)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 10)

            Text("Join Premium To Enjoy")
                .font(.title2)
                .bold()
            Text("Unlimited Audios")
                .font(.title2)
                .bold()

            HStack(spacing: 16) {
                ForEach(0..<options.count, id: \.self) { index in
                    let option = options[index]
                    VStack {
                        Text(option.title)
                            .font(.headline)
                        Text(option.subtitle)
                            .font(.caption)
                    }
                    .padding()
                    .background(selectedOption == index ? Color.blue.opacity(0.2) : Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(selectedOption == index ? Color.blue : Color.gray, lineWidth: 2)
                    )
                    .onTapGesture {
                        selectedOption = index
                    }
                }
            }

            Button(action: {
                // Handle continue action
            }) {
                HStack {
                    Text(options[selectedOption].title)
                        .fontWeight(.bold)
                    Spacer()
                    Text("Continue")
                        .fontWeight(.semibold)
                }
                .padding()
                .foregroundColor(.white)
                .background(LinearGradient(colors: [Color.blue, Color.purple], startPoint: .leading, endPoint: .trailing))
                .cornerRadius(25)
            }
            .padding(.horizontal)
        }
        .padding()
        .background(
            LinearGradient(colors: [Color.white, Color.blue.opacity(0.1)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
        )
    }
}

#Preview {
    SubscriptionView()
}
