# CatFacts

CatFacts is an iOS application designed to showcase a captivating compilation of cat facts retrieved from a backend API. The app not only identifies facts that are 90 days old but also distinguishes those that have been verified.

For improved accessibility, the app incorporates features facilitating the seamless reading of cat facts, including badges highlighting verified and recently added information.

Note : This project just demontrates how UIKit will work. This can be done using Swift UI with much lesser code however for SDKs this is more ideal set up as of today. This may change in future with Swift UI becoming more popular and adopted.  

## Tech Stack 

- **Xcode 15.1**
- **Minimum Deployment Target:** iOS 15.0
- **Utilizes Swift with UIKit.**
- The UI is developed 100% using code with UIKit and no storyboards. 
- Implements Apple's XCTest framework for Unit tests.
- Makes use of URLSession for API calls.
- Uses UITableViewDiffableDataSource to avoid using of index paths which is less prone to errors and issues. This also helps to support some really cool animation when performing searches.
- Achieves around 80% Unit test coverage with additional mocking of network layer objects through dependency injection, enabling enhanced test coverage and separation of concerns.

## Reviewers 

The iOS Application Architecture employed is MVVM, designed to address the straightforward use case of retrieving and listing data from the API on a simple view. While MVVM binding is implemented using protocols, it's worth noting that alternative architectures may be explored in the future to meet evolving product requirements.

Although Swift UI + Combine was an alternative, the project opts for Swift + UIKit, considered relatively more stable for SDK development. This decision is based on the current role where SDK use cases are more relevant.

## Supports 

- Lists cat facts.
- Displays new and verified badges for each cat fact.
- Ensures accessibility.
- Presents error messages as a custom alert VC and a loading screen during network calls to retrieve the list of cat facts.
- Supports localization, with Spanish included as an example.
- Offers both Dark and Light modes.

## UI 

![Simulator Screenshot - iPhone 15 - 2024-05-16 at 18 23 56](https://github.com/deepesh259nitk/Facts/assets/7008769/cab45185-1d2b-4858-b23b-98b5df37a6a6)
![Simulator Screenshot - iPhone 15 - 2024-05-16 at 18 23 59](https://github.com/deepesh259nitk/Facts/assets/7008769/638e5508-f7eb-4d88-9054-aec97ea95018)
![Simulator Screenshot - iPhone 15 - 2024-05-16 at 18 24 18](https://github.com/deepesh259nitk/Facts/assets/7008769/c350a9d5-c5fc-4f03-8ae9-e32ad96fb0c1)


## To be considered/explored if more time is available

- UITests for table view.
- Integration Tests.
- Snapshot testing.
- Logging (remote and local).
- Handling empty states / edge cases.
- Implementing pagination for more data with a pull-to-refresh mechanism.
- Extracting common logic into separate custom libraries for broader use.
- Injecting dummy JSON payloads to test different scenarios.
- Refactor and improve the code where applicable during the process.

## Leave your feedback !! 
