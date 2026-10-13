//
//  README.md
//  SwiftUIComponentLibrary
//
//  Created by thinkpalm on 12/10/26.
//

# SwiftUI Reusable Component Library

A modular library of prop-driven SwiftUI components built for iOS.

## Components API & Parameters

### 1. CustomButton
A versatile button supporting multiple themes, loading indicators, and full-width layouts.
* **`title`** (`String`): The text displayed inside the button.
* **`variant`** (`CustomButton.Variant`): The visual style (`.primary`, `.secondary`, `.destructive`).
* **`isLoading`** (`Bool`): Shows an inline progress spinner when true.
* **`action`** (`() -> Void`): Callback executed on tap.

### 2. CustomCard
A container component for grouping related information cleanly with shadows.
* **`title`** (`String`): Header title of the card.
* **`subtitle`** (`String?`): Optional descriptive subtitle below the title.
* **`content`** (`Content: View`): Generic view builder closure for card body content.

### 3. CustomTextField
A standardized input field supporting labels, secure text entry, and inline error messages.
* **`title`** (`String`): Label header displayed above the input.
* **`placeholder`** (`String`): Placeholder hint text.
* **`text`** (`Binding<String>`): Two-way binding to the text input value.
* **`isSecure`** (`Bool`): Toggles secure text masking (for passwords).
* **`errorMessage`** (`String?`): Optional error text displayed in red underneath.

### 4. CustomModalView
A pre-packaged modal presentation layout featuring customizable actions and close triggers.
* **`title`** (`String`): Navigation bar title.
* **`message`** (`String`): Informational body text.
* **`primaryActionTitle`** (`String`): Title of the main call-to-action button.
* **`onPrimaryAction`** (`() -> Void`): Callback triggered when the primary action button is pressed.

## Setup & Run Instructions
                                                                
### Prerequisites
* **Xcode:** Version 15.0 or higher
* **macOS:** Sonoma (14.0) or later
* **Simulator Device:** iPhone 15 or iPhone 16 running **iOS 17.0+**

### How to Run Locally
1. Clone the repository or download the ZIP file:
   ```bash
    git clone [https://github.com/arjunpkumar/IBTP1203-Lab_01.git](https://github.com/arjunpkumar/IBTP1203-Lab_01.git)
