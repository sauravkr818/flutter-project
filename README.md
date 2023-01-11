# Flutter application

## `The aim of this test assignment is to build an Flutter App that connects to the Github API, shows the public repositories.`

### Problem

**`Task 1 - Connect to the Github API`**
- Connect to the Github API to retrieve the list of public repositories in your Github Account.
Alternatively, use this account: https://api.github.com/users/freeCodeCamp/repos
This results in a list of public Repositories. Visualize the results in a List View. You are free to choose any meaningful subset of data to show in each row.


**`Task 2 - Asynchronously load the last commit`**.
- Once the list has been populated, start retrieving information about the last commit for each
repository. This can be done with the following call: https://api.github.com/repos/freeCodeCamp/1Aug2015GameDev/commits Where “freeCodeCamp” (see Task 1) is the user and “1Aug2015GameDev” the repository under consideration. Again, feel free to choose any meaningful subset of data to add to the row upon a successful response. Make sure that the list is scrollable while data is loading.


### Screenshot
<h1 align="center" style="">
<img src="https://user-images.githubusercontent.com/71181112/211717411-50b5c82c-d5b6-45c5-9944-22264129c0e4.png" alt="screenshot_(iPhone 12 Pro)" style="width:400px;height:820px;padding-right:60px;"/>

<img src="https://user-images.githubusercontent.com/71181112/211717702-6f57c679-c241-46fd-beee-70d353dc40ea.png" alt="screenshot_modal_(iPhone 12 Pro)" style="width:400px;height:820px;"/>
</h1>


### Installation

If you're new to Flutter the first thing you'll need is to follow the [setup instructions](https://flutter.dev/docs/get-started/install). 

Once Flutter is setup, you can use the latest `stable` channel:
 * Run `flutter channel stable`
 * Run `flutter upgrade`

Once you're on `dev` and desktop is enabled, you're ready to run the app:
* `flutter run -d windows`
* `flutter run -d macos`
* `flutter run -d linux`
* `flutter run -d android`
* `flutter run -d ios`
* `flutter run -d web`

If you re-start your IDE, you should also see a new launch option for your current desktop platform.











