//
//  CustomButton.swift
//  SwiftUIComponentLibrary
//
//  Created by thinkpalm on 12/10/26.
//

import SwiftUI

public struct CustomButton: View {
    public enum Variant {
        case primary, secondary, destructive
    }
    
    let title: String
    let variant: Variant
    let isLoading: Bool
    let action: () -> Void
    
    public init(title: String, variant: Variant = .primary, isLoading: Bool = false, action: @escaping () -> Void) {
        self.title = title
        self.variant = variant
        self.isLoading = isLoading
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: foregroundColor))
                }
                Text(title)
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(borderColor, lineWidth: variant == .secondary ? 1 : 0)
            )
        }
        .disabled(isLoading)
    }
    
    private var backgroundColor: Color {
        switch variant {
        case .primary: return .blue
        case .secondary: return .clear
        case .destructive: return .red
        }
    }
    
    private var foregroundColor: Color {
        switch variant {
        case .primary, .destructive: return .white
        case .secondary: return .blue
        }
    }
    
    private var borderColor: Color {
        switch variant {
        case .secondary: return .blue
        default: return .clear
        }
    }
}
