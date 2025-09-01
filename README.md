# Nutrix - AI-Powered Fitness & Nutrition App

Nutrix is a comprehensive AI-driven fitness and nutrition platform built with Flutter, offering personalized workout and diet plans, AI-powered food scanning, and intelligent exercise tracking to help users achieve their health and fitness goals.

## 🎯 Overview

Nutrix is designed to revolutionize personal health management by providing intelligent, data-driven solutions for fitness and nutrition. The application leverages artificial intelligence to deliver customized recommendations that adapt to individual user preferences, fitness levels, and dietary requirements.

**Target Audience:** Fitness enthusiasts, health-conscious individuals, personal trainers, and anyone seeking a structured approach to wellness.

## ✨ Key Features

### 🤖 AI-Powered Personalization
- **Intelligent Workout Plans**: Machine learning algorithms generate customized exercise routines based on user fitness level, goals, and preferences
- **Dynamic Diet Planning**: AI-driven meal suggestions with real-time plan optimization
- **Adaptive Recommendations**: Plans automatically adjust based on user progress and feedback

### � Smart Food Analysis
- **Computer Vision Food Scanning**: Advanced image recognition technology for instant food identification
- **Comprehensive Nutritional Analysis**: Detailed breakdown of calories, macronutrients, micronutrients, and ingredients
- **Diet Compatibility Assessment**: Real-time evaluation of food choices against personalized diet plans
- **Meal Tracking**: Automated logging and nutritional monitoring

### 🏋️ Exercise Management
- **Extensive Exercise Database**: Comprehensive library of workouts with detailed instructions
- **Video Integration**: Seamless YouTube video embedding for guided workout sessions
- **Progress Tracking**: Advanced analytics to monitor fitness improvements
- **Custom Workout Builder**: Tools for creating personalized exercise routines

### 💧 Hydration Management
- **Smart Water Reminders**: Intelligent hydration tracking with customizable notifications
- **Progress Monitoring**: Visual tracking of daily water intake goals
- **Personalized Recommendations**: Hydration goals based on individual needs and activity levels

### 🤖 AI Chat Assistant
- **Intelligent Health Coaching**: AI-powered chatbot for nutrition and fitness guidance
- **Personalized Recommendations**: Context-aware suggestions based on user data
- **24/7 Support**: Round-the-clock assistance for health-related queries



### Configuration

1. **API Keys**: Configure your Google Generative AI API key in the appropriate configuration file
2. **Backend Services**: Set up backend API endpoints for user authentication and data management
3. **Permissions**: Ensure camera, notification, and storage permissions are properly configured

## �📁 Project Structure

```
lib/
├── main.dart                    # Application entry point
├── nutrix_app.dart             # Main app configuration
├── core/                       # Core functionality
│   ├── helpers/                # Utility functions and constants
│   ├── routes/                 # App navigation and routing
│   ├── themes/                 # App theming and styling
│   ├── widgets/                # Reusable UI components
│   └── networking/             # API service configuration
└── feature/                    # Feature modules
    ├── onboarding/             # App introduction screens
    ├── login/                  # User authentication (login)
    ├── sign_up/                # User registration
    ├── user_data_form/         # User profile and preferences setup
    ├── home/                   # Main dashboard and challenges
    ├── bottom_nav_bar/         # Navigation between main sections
    ├── diet/                   # Nutrition and meal planning
    ├── scan_food/              # AI-powered food scanning
    ├── workout/                # Exercise plans and tracking
    ├── drink_water/            # Hydration tracking and reminders
    ├── chatbot/                # AI health coaching assistant
    └── profile/                # User profile management


## 🎨 Features in Detail

### 🔐 User Authentication & Onboarding
- **Secure Registration**: Email-based signup with password validation
- **Login System**: Username/password authentication with token management
- **Onboarding Flow**: Interactive introduction to app features
- **User Data Collection**: Comprehensive form for fitness goals and preferences
- **Password Security**: Regex validation for strong passwords
- **Remember Me**: Option to persist login sessions

### 🏠 Home Dashboard
- **Personalized Welcome**: Dynamic greeting based on user data
- **Fitness Challenges**: Interactive challenges with progress tracking
- **Quick Actions**: Fast access to scanning, hydration, and workout plans
- **Progress Overview**: Visual summary of daily activities and goals

### 🍎 Smart Nutrition Management
- **Personalized Diet Plans**: AI-generated meal plans based on user preferences
- **General Diet Plans**: Pre-designed diet templates for various goals
- **Meal Tracking**: Detailed nutritional analysis and calorie counting
- **Dynamic Plan Updates**: Ability to regenerate and modify diet plans
- **Meal Details**: Comprehensive ingredient and nutritional information

### 📸 AI-Powered Food Scanning
- **Real-time Food Recognition**: Advanced computer vision for instant food identification
- **Nutritional Analysis**: Detailed breakdown of calories, macros, and micronutrients
- **Multiple Item Detection**: Scan multiple food items in a single image
- **Diet Compatibility**: Check if scanned foods align with your diet plan
- **Scan History**: Track previously scanned foods and meals

### 🏋️ Intelligent Workout Management
- **Personalized Workout Plans**: AI-generated exercise routines based on fitness level
- **General Workout Plans**: Pre-designed workout templates for various goals
- **Exercise Database**: Comprehensive library with detailed instructions
- **Video Integration**: YouTube video embedding for guided workouts
- **Progress Tracking**: Monitor workout completion and fitness improvements
- **Day-wise Planning**: Organized daily exercise schedules

### 💧 Hydration Tracking
- **Smart Water Reminders**: Intelligent notifications based on intake patterns
- **Visual Progress**: Circular progress indicator showing daily hydration goals
- **Intake Recording**: Easy one-tap water consumption logging
- **Daily Reset**: Automatic reset of intake tracking each day
- **Reminder Scheduling**: Customizable notification timing for water breaks
- **Hydration History**: Track drinking patterns over time

### 🤖 AI Health Coach
- **Intelligent Conversations**: Natural language processing for health queries
- **Personalized Advice**: Context-aware recommendations based on user data
- **24/7 Availability**: Round-the-clock assistance for health-related questions
- **Chat History**: Persistent conversation storage for reference
- **Multi-topic Support**: Guidance on nutrition, fitness, and wellness

### 👤 Profile Management
- **User Information**: Comprehensive profile with personal and fitness data
- **Settings Management**: App preferences and notification controls
- **Data Privacy**: Secure storage of personal information
- **Plan Updates**: Modify diet and workout preferences
- **Progress Statistics**: View long-term health and fitness trends

### 🔔 Smart Notifications
- **Hydration Reminders**: Intelligent water drinking notifications
- **Workout Alerts**: Scheduled exercise session reminders
- **Customizable Timing**: User-controlled notification schedules
- **Permission Management**: Granular control over notification types
- **Background Processing**: Reliable delivery even when app is closed


## 🏗️ Architecture & Design Patterns

### Clean Architecture
- **Separation of Concerns**: Clear boundaries between UI, business logic, and data
- **Repository Pattern**: Abstracted data access layer
- **Dependency Injection**: GetIt for service location and dependency management
- **Error Handling**: Functional programming with Dartz for error management

### State Management
- **BLoC Pattern**: Consistent state management across all features
- **Event-driven Architecture**: Reactive programming for UI updates
- **State Persistence**: Automatic state saving and restoration

### Data Management
- **Local Storage**: Hive for offline data persistence
- **Secure Storage**: Flutter Secure Storage for sensitive information
- **Caching Strategy**: Intelligent data caching for improved performance
- **API Integration**: RESTful API communication with error handling

## 🔒 Security & Privacy

- **Secure Authentication**: Token-based authentication with refresh tokens
- **Data Encryption**: Sensitive data stored using secure storage mechanisms
- **Permission Management**: Granular app permissions for enhanced privacy
- **Input Validation**: Comprehensive form validation and data sanitization
- **API Security**: Secure communication with backend services


**Made with ❤️ using Flutter**

