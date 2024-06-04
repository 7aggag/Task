# Project README

This document provides an overview of the project and instructions on how to use it.

## Overview

This project is built using the clean Viper -> VIP architecture pattern and aims to provide a simple listing screen displaying universities in the United Arab Emirates. It fetches data from the provided API endpoint and caches it locally using Realm database. In case of API failure, the app retrieves data from the local database if it exists; otherwise, it displays an error message.

## Features

- Listing screen displaying universities fetched from the API.
- Caching of data in local database (Realm).
- Error handling for API failures.
- Details screen for each university item.
- Refresh functionality to trigger a refresh on the listing screen.

## API Endpoint

The app uses the following API endpoint to fetch university data:
- [Universities API](http://universities.hipolabs.com/search?country=United%20Arab%20Emirates)

## Installation

To install and run the project, follow these steps:

1. Clone the repository to your local machine.
2. Open the project in Xcode.
3. Make sure you have CocoaPods installed. If not, install it by running `sudo gem install cocoapods` in the terminal.
4. Navigate to the project directory in the terminal and run `pod install` to install dependencies.
5. Open the `.xcworkspace` file in Xcode.
6. Build and run the project on a simulator or a physical device.

## Usage

### Listing Screen

- Upon launching the app, the user lands on the listing screen.
- The screen fetches data from the API and caches it locally in the database.
- If the API call fails, the screen retrieves data from the local database if available; otherwise, it displays an error message.

### Details Screen

- Tapping on an item in the listing screen navigates the user to the details screen.
- The details screen displays information about the selected university.
- The user can refresh the listing screen by tapping the refresh button.
- Upon tapping the refresh button, the listing screen is reloaded, and the API is fired again to fetch updated data.

## VIP Cycle Illustration

The VIP cycle, consisting of the View, Interactor, and Presenter components, works as follows:

### View
- Displays information to the user and handles user input.
- Forwards user actions to the Interactor.

### Interactor
- Contains the business logic of the app.
- Processes the user input received from the View.
- Communicates with the Presenter to update the View.

### Presenter
- Prepares the data received from the Interactor for display in the View.
- Updates the View with the processed data.

This separation of concerns ensures a modular and testable codebase.

## Notes

**Mohamed Haggag**
