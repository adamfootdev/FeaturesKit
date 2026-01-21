# FeaturesKit

![Feature Graphic](https://github.com/adamfootdev/FeaturesKit/blob/main/Assets/feature-graphic.png?raw=true)
![Platform](https://img.shields.io/badge/platforms-iOS%2FiPadOS%2016.4%2B%20%7C%20macOS%2013.3%2B%20%7C%20tvOS%2016.0%2B%20%7C%20visionOS%201.0%2B%20%7C%20watchOS%209.0%2B-blue)

FeaturesKit provides developers for Apple platforms with the ability to display a list of configured features in their apps. This is built using SwiftUI so can be displayed natively from a SwiftUI app or using a UIHostingController in a UIKit app, and has been designed to mimic the style of built-in Apple screens.

This has been localized into multiple languages and the buttons will automatically adapt to your appʼs accent color.

1. [Requirements](#requirements)
2. [Integration](#integration)
3. [Usage](#usage)
    - [FKConfiguration](#fkconfiguration)
    - [FKTitlePosition](#fktitleposition)
    - [FKTitleStyle](#fktitlestyle)
    - [FKItem](#fkitem)
    - [FeaturesView](#featuresview)
4. [Other Packages](#other-packages)
    - [AboutKit](https://github.com/adamfootdev/AboutKit)
    - [HelpKit](https://github.com/adamfootdev/HelpKit)
    - [HapticsKit](https://github.com/adamfootdev/HapticsKit)
    - [InAppPurchaseKit](https://github.com/adamfootdev/InAppPurchaseKit)

## Requirements

- iOS/iPadOS 16.4+
- macOS 13.3+
- tvOS 16.0+
- visionOS 1.0+
- watchOS 9.0+
- Xcode 26.0+

## Integration

### Swift Package Manager

FeaturesKit can be added to your app via Swift Package Manager in Xcode. Add to your project like so:

```swift
dependencies: [
    .package(url: "https://github.com/adamfootdev/FeaturesKit.git", from: "2.0.0")
]
```

## Usage

To start using the framework, youʼll need to import it first:

```swift
import FeaturesKit
```

### FKConfiguration

This is a struct containing all of the relevant details required to configure FeaturesKit. It can be created like so:

```swift
let configuration = FKConfiguration(
    title: "Whatʼs New in Example App", 
    titlePosition: position,
    titleStyle: style,
    items: items,
    learnMoreURL: URL(string: "https://example.com")!,
    learnMoreButtonTitle: "About Example App",
    showContinueButton: true, 
    continueButtonTitle: "Continue",
) {
    print("Done")
}
```

### FKTitlePosition

This is an enum used for setting the position of the title. Choose from the following options:

```swift
case leading
case center
case trailing
```

### FKTitleStyle

This is an enum used for setting the style of the title. Choose from the following options:

```swift
case standard
case large
```

### FKItem

This is a struct containing details relating to items that appear on the feature list screen. It can be created as follows:

```swift
let item = FKItem(
    title: "New Feature", 
    description: "This is a cool new feature!", 
    systemImage: "checkmark.circle", 
    imageTint: .green
)
```

The systemImage value is optional and will be hidden if a value is not provided. The imageTint value is also optional and will default to the accent color if not provided.

### FeaturesView

The features view allows you to display a list of features that are available in your app with a custom title at the top. Create an instance of the view using the following:

```swift
FeaturesView(configuration: configuration)
```

## Other Packages

### [AboutKit](https://github.com/adamfootdev/AboutKit)

Add an about screen to your app.

### [HelpKit](https://github.com/adamfootdev/HelpKit)

Add a help screen to your app.

### [HapticsKit](https://github.com/adamfootdev/HapticsKit)

Add haptic feedback to your app.

### [InAppPurchaseKit](https://github.com/adamfootdev/InAppPurchaseKit)

Add a subscription screen to your app.
