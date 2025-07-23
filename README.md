# Celebreak-Flutter Profile App Test - Santiago Zamora

This is a Flutter application showcasing a user profile screen, designed to closely match a Figma layout with a fixed top section and a scrollable content area. It also includes an animated splash screen upon app launch.

-----

## Features

  * **Splash Screen:** An animated splash screen is displayed at the application's start, with a fade-in and scale-up animation for the app icon and motto, before navigating to the profile screen.
  * **Fixed Top Section:** A prominent image section at the top that stays visible while the rest of the content scrolls. This section displays the user's avatar, name, handle, and key statistics.
  * **Scrollable Content:** The main body of the profile, including a "Message" button, user bio, kudos received, general information, interests, football skills, and upcoming games, is fully scrollable.
  * **Interactive Elements:** Includes interactive buttons and expandable sections (optional, if implemented).
  * **Bottom Navigation Bar:** A functional bottom navigation bar integrated into the Scaffold.

-----

## Getting Started

Follow these steps to get a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Before you begin, ensure you have the following installed on your system:

  * **Flutter SDK:** [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)
  * **Android Studio (with Android SDK):** [https://developer.android.com/studio](https://developer.android.com/studio)
  * **VS Code or Android Studio** (your preferred Integrated Development Environment for Flutter development)
  * [cite\_start]**Flutter version 3.32.6** [cite: 1]

### Installation and Running

1.  **Clone the Repository:**
    Open your terminal or command prompt and navigate to the directory where you want to store the project.

    ```bash
    git clone https://github.com/YOUR_GITHUB_USERNAME/YOUR_REPOSITORY_NAME.git
    ```

    *(Replace `YOUR_GITHUB_USERNAME` and `YOUR_REPOSITORY_NAME` with your actual GitHub username and the name of your repository).*

2.  **Navigate to the Project Directory:**

    ```bash
    cd YOUR_REPOSITORY_NAME
    ```

3.  **Get Flutter Packages:**
    Install all the necessary Dart packages and dependencies for the project.

    ```bash
    flutter pub get
    ```

4.  **Connect a Device or Start an Emulator:**
    Ensure you have an Android device connected via USB (with **USB debugging enabled** in Developer Options) or an Android emulator running. You can check for available devices with:

    ```bash
    flutter devices
    ```

5.  **Run the Application:**
    Execute the application on your connected device or emulator.

    ```bash
    flutter run
    ```

    The application will compile, install, and launch on your target Android device or emulator.
