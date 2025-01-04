# Movie Browser App
## Application
Movie browsing and rating app for android on flutter. Besides browsing movies, the application allows users to rate movies as the best ones. This helps users quickly find their favorite movies and avoid dilemmas when filtering out mediocre and poor productions, for example, when recommending something to their friends.


## Getting Started
Prerequisites\
-Flutter SDK\
-Dart\
-Android Studio or Visual Studio Code\
-An API key from The Movie Database (TMDb)

### Installation
1.Clone the repository:\
sh\
git clone https://github.com/sew2900/movie_browser.git \
cd movie-browser-app

2.Install dependencies: \
sh\
flutter pub get

3.Configure API key: \
Add your TMDb API key inside api_service.dart to _apiKey value: \
static const String _apiKey = 'API_KEY';

4.Run: \
sh \
flutter run

## Detailed functionalities:
### User Interface (UI) 
The application has a minimalist style and list-like layout, ensuring responsiveness in both portrait and landscape modes. 

### Portrait Mode: 
![image](https://github.com/user-attachments/assets/07ea5071-612c-412a-8183-2b0b4838e19c)

### Landscape Mode: 
![image](https://github.com/user-attachments/assets/26410cba-4229-4a32-af68-7fe47f215fec)


### Five Different Screens 
-Login Screen: For user authentication. \
-Main Screen: Displays a list of movies fetched from the TMDb API. \
-Details Screen: Shows detailed information about a selected movie. \
-Best Rated Screen: Lists movies rated as the best by the user. \
-Settings Screen: Allows the user to switch between light and dark modes. \
![image](https://github.com/user-attachments/assets/56e4ea6c-f293-4952-bcec-c4e59d109b2e)

### State Management & API Integration 
Provider Library: The application uses the Provider library for state management. This allows sharing and managing state across different widgets easily. \
MovieProvider: Manages the state of movies, ratings, and database operations. \
![image](https://github.com/user-attachments/assets/15bd3f38-48d6-4da4-94c6-27b07463826f)

TMDb API: The application fetches movie information from The Movie Database (TMDb) API. \
Error Handling: Provides feedback to the user in case of issues such as no internet connection or server errors. \
![image](https://github.com/user-attachments/assets/6d6c5d92-ec22-4da9-95dc-600d6c3d4ca3)


### Local Database 
SQLite: The application uses SQLite for local data storage, allowing offline access. \
DatabaseHelper: Manages database connections and CRUD operations. \
![image](https://github.com/user-attachments/assets/be91ea5b-d753-4958-943d-4dfb50f0964a)

### Authorization 
AuthProvider: Manages user login and registration state using a local SQLite database. \
![image](https://github.com/user-attachments/assets/cc205ee4-b8ca-4845-999e-238bd375d91e)


### Dark Mode Support 
ThemeProvider: Manages the application's theme state, allowing users to switch between light and dark modes. \
![image](https://github.com/user-attachments/assets/9492343e-c665-45a7-a38a-6db55848a120)


### Animations 
Hero Animation: Smooth transitions between different screens. \
Animated Transitions: Enhances the user experience with engaging animations. \
![image](https://github.com/user-attachments/assets/a133cbd6-131f-4550-bbb2-680ec310eb02)


## Implementation summary: 
**User Interface (UI)** \
-Responsive and intuitive layout, adapted to both portrait and landscape modes. \
-Minimalistic style ensures seamless content display. \
-Five different screens: Login, Main, Details, Best Rated, and Settings. \
**State Management** \
-Advanced state management using the Provider library. \
-State providers created for the entire application for movies, themes, and authorization. \
**API Integration** \
-Fetching and displaying data from the public TMDB API. \
-Error handling (e.g., no internet, server errors). \
**Local Database** \
-Storing user data locally with SQLite. \
-Ability to save and read data offline. 
**Authorization** \
-User login and registration functionality using a local database. \
**Dark Mode Support** \
-Switching between light and dark modes. \
Animations \
-Implementing Hero Animation and animated transitions. \
