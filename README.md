# DailymotionGithubUsers
A simple iOS Swift demo project showcasing the setup of MVP Architecture, Modularization, Networking, and UnitTests.

## Features
- [x] Content is backend driven
- [x] No 3rd party frameworks
- [x] UI was constructed in code using AutoLayout
- [x] Logic and UI is separated into their module

## Requirements
- iOS 10.0+
- Xcode 11.0+

## Installation
Just open and build the entire ```DailymotionGithubUsersWorkspace.xcworkspace```


## External services
- [Dailymotion](https://api.dailymotion.com) - French video-sharing technology platform primarily owned by Vivendi
- [Github](https://api.github.com/) - Web-based version-control and collaboration platform for software developers


## Modules overview

## DailymotionGithubUsers_App
iOS Application Target. Nothing much should happen there. Its only responsibility is forwarding all application states upstream to ```DailymotionGithubUsers_iOS``` and manage `Info.plist` keys and values. It's also an entry point for starting flow inside iOS Module.

## DailymotionGithubUsers_Core
Its responsibility is to provide and manage all dependencies inside the application. Including logical services, transactions, repositories, and public models. 

## DailymotionGithubUsers_iOS
Most important module from the end-user perspective. Its responsibility is to build entire features/screens.

#### AppModules 
In `Modules/AppModules.swift`, we fill all created screens, so we can easily build and inject our desired screen out of the box, without the need to go through *sometimes* complex screen flow. 
1. Each screen have its own **View Factory**
1. Module consists of *view*, *presenter*, and *router*

#### Screens
`Modules/Screens` is divided into functionalities. E.g. **Onboarding** - *First step*, *Second step*, *Final step*.
Each separated functionality has **at least** 5 files. 
1. Contract - which is a blueprint for every piece of module
1. Presenter - a major place where logic happens. It delegates its output to *view* and *router*
1. View Controller - controls view states and *talks* with **Presenter**
1. Root View - the main view injected in `loadView` on **View Controller**
1. Router - dispatches screen flow

#### Tests
This module is responsible for testing **Presenters**. See included example of ```UsersMasterPresenterTests```.

## DailymotionGithubUsers_UI
Place where all shared *views*, *colors*, *fonts*, *assets* lands. This is also a place where **Viper Module** is modeled and structured.

## DailymotionGithubUsers_Networking
A module consisting of all networking activities. The idea here is to expose publicly **Responses Models** and **Services**. See e.g. ```UsersService``` then ```DailymotionGithubUsers_Core``` maps **Responses Models** to publicly shared model (through all modules) in **Repository**.

#### Tests
You can easily test your model mappings from *JSON*, query params from request builder, and your created **Services**.
See: ```UsersResponseTests```, ```UsersServiceTests```, ```RequestBuilderTests```. ```APIClientTests``` consits of logic suite tests involved in creating request, and mapping response.

## TODO
- UI Tests
- Github Actions
- Localization and Storage Module

## Author

[Adrian Kaczmarek](https://github.com/AdishPL) 
