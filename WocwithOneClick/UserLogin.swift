//
//  UserLogin.swift
//  WocwithOneClick
//
//  Created by Dimitra Malliarou on 30/4/25.
//

import SwiftUI

struct UserLogin: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var submit = false
    
    var body: some View {
        NavigationStack {
            Text("Sign In")
                .font(.title)
                .bold()
            HStack(alignment: .top){
                VStack {
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 100,height: 100)
                        .padding()
                }.padding()
            }
            .frame(maxWidth:.infinity,alignment: .center)
            VStack {
                Form {
                    HStack {
                        VStack {
                            TextField("Email", text: $email)
                            Divider()
                            TextField("Password", text: $password)
                            Divider()
                            Divider()
                            Button(action: {
                                submit.toggle()
                            }, label: {
                                Text("Submit")
                                .font(.title)
                            }).buttonStyle(.borderedProminent)
                        }
                    }
                    .frame(width: .infinity,height: .infinity,alignment: .center)
                }
            }
        }
    }
}

#Preview {
    UserLogin()
}
