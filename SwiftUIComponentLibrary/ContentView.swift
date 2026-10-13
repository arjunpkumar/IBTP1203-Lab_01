//
//  ContentView.swift
//  SwiftUIComponentLibrary
//
//  Created by thinkpalm on 13/10/26.
//

import SwiftUI

struct ContentView: View {
    @State private var emailText = ""
    @State private var passwordText = ""
    @State private var isShowingModal = false
    @State private var isLoading = false
    @State private var feedbackMessage = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    
                    // SECTION 1: BUTTONS
                    VStack(alignment: .leading, spacing: 12) {
                        Text("1. Custom Buttons").font(.title3).bold().padding(.horizontal)
                        
                        CustomButton(title: "Primary Action", variant: .primary) {
                            isLoading.toggle()
                        }
                        .padding(.horizontal)
                        
                        CustomButton(title: "Secondary Action", variant: .secondary) {
                            isShowingModal = true
                        }
                        .padding(.horizontal)
                        
                        CustomButton(title: "Destructive Action", variant: .destructive, isLoading: isLoading) {
                            print("Deleted")
                        }
                        .padding(.horizontal)
                    }
                    
                    // SECTION 2: CARDS
                    VStack(alignment: .leading, spacing: 12) {
                        Text("2. Custom Cards").font(.title3).bold().padding(.horizontal)
                        
                        CustomCard(title: "Profile Card", subtitle: "Active Status") {
                            HStack {
                                Circle().fill(Color.green).frame(width: 12, height: 12)
                                Text("Jane Doe • iOS Developer")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                        
                        CustomCard(title: "Statistics Card") {
                            Text("1,245 Active Users Today")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.blue)
                        }
                    }
                    
                    // SECTION 3: FORM INPUTS
                    VStack(alignment: .leading, spacing: 12) {
                        Text("3. Form Inputs").font(.title3).bold().padding(.horizontal)
                        
                        CustomTextField(
                            title: "EMAIL ADDRESS",
                            placeholder: "name@example.com",
                            text: $emailText,
                            errorMessage: emailText.contains("@") || emailText.isEmpty ? nil : "Invalid email address format"
                        )
                        
                        CustomTextField(
                            title: "PASSWORD",
                            placeholder: "Enter password",
                            text: $passwordText,
                            isSecure: true
                        )
                    }
                    
                    // SECTION 4: MODAL TRIGGER
                    VStack(alignment: .leading, spacing: 12) {
                        Text("4. Modal / Sheet").font(.title3).bold().padding(.horizontal)
                        
                        CustomButton(title: "Present Sheet Modal", variant: .primary) {
                            isShowingModal = true
                        }
                        .padding(.horizontal)
                    }
                    
                    if !feedbackMessage.isEmpty {
                        Text(feedbackMessage)
                            .font(.footnote)
                            .foregroundColor(.green)
                            .padding(.top)
                    }
                    
                    Spacer(minLength: 40)
                }
                .padding(.vertical)
            }
            .navigationTitle("Component Library")
            .sheet(isPresented: $isShowingModal) {
                CustomModalView(
                    title: "Confirmation",
                    message: "Are you sure you want to proceed with this action?",
                    primaryActionTitle: "Confirm"
                ) {
                    feedbackMessage = "Action confirmed successfully!"
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
