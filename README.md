# M I N I M A L

A **minimalist social media app** built with **Flutter** and
**Firebase**.\
M I N I M A L focuses on simplicity while providing essential social
features like authentication, global chat, and customizable theming.

------------------------------------------------------------------------

## ✨ Features

-   **User Authentication**
    -   Sign up / Login with Firebase Authentication\
    -   Password reset via email
-   **Profile Management**
    -   User profile page with details and customization
-   **Global Chat**
    -   Open chatroom where all users can interact\
    -   Real-time updates using Firebase
-   **User Pages**
    -   View other users' profiles
-   **Dynamic Theming**
    -   Automatically adapts to system light/dark mode\
    -   Custom color scheme for a clean, modern UI

------------------------------------------------------------------------

## 🛠️ Tech Stack

-   **Framework**: [Flutter](https://flutter.dev/)\
-   **Database & Backend**: [Firebase](https://firebase.google.com/)\
-   **State Management**: Flutter's built-in tools (e.g.,
    Provider/SetState depending on your implementation)\
-   **UI**: Material Design + Dynamic theming

------------------------------------------------------------------------

## 🚀 Getting Started

### Prerequisites

-   Install [Flutter SDK](https://docs.flutter.dev/get-started/install)\
-   Install [Firebase CLI](https://firebase.google.com/docs/cli)\
-   Set up a Firebase project and enable **Authentication** +
    **Firestore Database**

### Installation

1.  Clone the repository:

    ``` bash
    git clone https://github.com/your-username/minimal.git
    cd minimal
    ```

2.  Install dependencies:

    ``` bash
    flutter pub get
    ```

3.  Configure Firebase:

    -   Add your `google-services.json` (Android) and
        `GoogleService-Info.plist` (iOS) files.

4.  Run the app:

    ``` bash
    flutter run
    ```

------------------------------------------------------------------------

## 📂 Project Structure

    lib/
     ├── main.dart            # App entry point
     ├── auth/                # Login, signup, and forgot password
     ├── home/                # Home feed & chatroom
     ├── profile/             # User profile screens
     ├── themes/              # Light/Dark theme configuration
     └── components/             # Reusable UI components

------------------------------------------------------------------------

## 🎨 Screenshots (Optional)

*Add some screenshots here once available to showcase UI/UX.*

------------------------------------------------------------------------

## 🔮 Future Improvements

-   Direct messaging (1-on-1 chats)\
-   Push notifications\
-   Media sharing (images/videos)\
-   Profile customization (bio, status, avatar uploads)

------------------------------------------------------------------------

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!\
Feel free to check the [issues
page](https://github.com/your-username/minimal/issues).

------------------------------------------------------------------------

## 📜 License

This project is licensed under the MIT License.
