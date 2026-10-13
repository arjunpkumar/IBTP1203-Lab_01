//
//  CustomModalView.swift
//  SwiftUIComponentLibrary
//
//  Created by thinkpalm on 12/10/26.
//

import SwiftUI

public struct CustomModalView: View {
    let title: String
    let message: String
    let primaryActionTitle: String
    let onPrimaryAction: () -> Void
    @Environment(\.dismiss) var dismiss
    
    public init(title: String, message: String, primaryActionTitle: String, onPrimaryAction: @escaping () -> Void) {
        self.title = title
        self.message = message
        self.primaryActionTitle = primaryActionTitle
        self.onPrimaryAction = onPrimaryAction
    }
    
    public var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text(message)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding()
                
                CustomButton(title: primaryActionTitle, variant: .primary) {
                    onPrimaryAction()
                    dismiss()
                }
                
                CustomButton(title: "Cancel", variant: .secondary) {
                    dismiss()
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                            ToolbarItem(placement: .topBarTrailing) {
                                Button("Close") {
                                    dismiss()
                                }
                            }
                        }
        }
    }
}
