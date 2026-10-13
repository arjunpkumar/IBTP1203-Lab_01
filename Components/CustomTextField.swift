//
//  CustomTextField.swift
//  SwiftUIComponentLibrary
//
//  Created by thinkpalm on 12/10/26.
//

import SwiftUI

public struct CustomTextField: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    let isSecure: Bool
    let errorMessage: String?
    
    public init(title: String, placeholder: String, text: Binding<String>, isSecure: Bool = false, errorMessage: String? = nil) {
        self.title = title
        self.placeholder = placeholder
        self._text = text
        self.isSecure = isSecure
        self.errorMessage = errorMessage
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.secondary)
            
            if isSecure {
                SecureField(placeholder, text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            } else {
                TextField(placeholder, text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            if let error = errorMessage {
                Text(error)
                    .font(.caption2)
                    .foregroundColor(.red)
            }
        }
        .padding(.horizontal)
    }
}
