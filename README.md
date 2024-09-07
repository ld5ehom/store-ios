# Store iOS App

## Project Overview - iOS
- Developed a store app for iOS, implementing user authentication with Firebase, including secure login and registration functionalities.
- Separated views from view controllers by avoiding Storyboards, using programmatic UI layout.
- Integrated WKWebView for the checkout screen, enabling web-based payment processing. 
- Automated builds using Xcode Cloud for CI/CD, and utilized Fastlane for build automation and GitHub Actions for build verification and testing.
- Utilized: Swift, UIKit, MVVM, MVI


## Project Overview - [Store Management System (AWS) for Store iOS App](https://github.com/ld5ehom/store)
- This project is the backend system for an iOS store app, developed using Spring Boot and AWS services, leveraging a microservices architecture (MSA) for scalable and efficient performance.
- Designed and implemented a RESTful backend server that enables persistent storage in an online database using AWS services, including RDS for relational data, DynamoDB for managing purchase history, and S3 for object storage.
- Utilized: Java, Spring Boot, REST, RDS, DynamoDB, S3


-----

## Milestones
- M1 : App Basic Functionality Development
- M2 : AWS Backend Server Development
- M3 : Advanced Features and Testing

-----

## Task List
### M1: App Basic Functionality Development

**Task 1. Launch Screen**
   - **Issues** : [task-1-launch](https://github.com/ld5ehom/store-ios/tree/task-1-launch)
   - **Details** :
     - **Launch Screen** - [commit b774cf7](https://github.com/ld5ehom/store-ios/commit/b774cf74c6e510a0e9d0da6b6ca166f4c2e25eae) :
       - Implemented animation using Auto Layout


**Task 2. Login Page**
   - **Issues** : [task-2-login](https://github.com/ld5ehom/store-ios/tree/task-2-login)
   - **Details** : After completing the app development, a login system will be implemented using AWS Cognito.


**Task 3. Home Page**
   - **Issues** : [task-3-home](https://github.com/ld5ehom/store-ios/tree/task-3-home)
   - **Details** : 
     - **Design Source** - [commit ed458db](https://github.com/ld5ehom/store-ios/commit/ed458db26503679913cc01fe2dd596cb07bf8200) : 
       - Integrated design resources into the DesignSource folder by componentizing them for the implementation of the home screen banner.
     - **Set HomeViewController as Root View** - [commit d6761db](https://github.com/ld5ehom/store-ios/commit/d6761dbbcf4aee785928696e346bb0e99680194e) :
       - Instead of presenting HomeViewController modally after the loading animation finishes, the root view controller has been changed to HomeViewController, making it the initial screen displayed.
     - **Home Banner Carousel** - [commit 04647e9](https://github.com/ld5ehom/store-ios/commit/04647e90727f0b0f90285999675564785adb7b12) : 
       - The Home storyboard view controller wasn't connected, so the storyboard was loaded to properly use the Home view controller.
       - Using a compositional layout and diffable data source to efficiently manage and display collection view items. 
     - **Home Screen Main Event Products Using Horizontal Carousel** - [commit 9f83a10](https://github.com/ld5ehom/store-ios/commit/9f83a10c80d0499c1b372c3f65d21044920bffef) :  
       - Implemented a horizontal carousel component for the Home screen, where each cell displays product details such as images, titles, and prices. The carousel allows users to scroll through products horizontally. Each cell features a product image, title, and price, with the original price displayed with a strikethrough effect to highlight discounts.
     - **Home Screen Product Display Using Vertical Scroll** - [commit 98ae0a5](https://github.com/ld5ehom/store-ios/commit/98ae0a547030f1e15d807177fbb489d1ac7b3c0c) :  
       - Refactored Cell Layout Configuration: Moved the cell layout configuration from the view controller to the cell extension, resulting in cleaner code and improved modularity.
       - Implemented Vertical Scroll Layout: Created a product list for general items using a vertical scroll layout. This arrangement allows users to scroll through the list of products efficiently, organizing them vertically for better display and navigation. 
     - **Home Screen Data Model Implementation** - [commit 2ec3f9f](https://github.com/ld5ehom/store-ios/commit/2ec3f9f16e548292592e34252c31983755bb86ad) :   
       - Refactored the cell layout configuration by moving it from the view controller to the cell extension, resulting in cleaner code and improved modularity.
       - Implemented a set of data models to represent the JSON response structure for the Home screen, including models for banners, horizontal product listings and vertical product listings.
       - Fetched data for these models from a JSON file hosted on GitHub, which populates the Home screen content.
     - **Kingfisher Library Setup** - [commit 616da47](https://github.com/ld5ehom/store-ios/commit/616da479a3568ef002e16e830add145bcbe7d90c) :   
       - Integrated the Kingfisher library to handle image downloading and caching. This allows for efficient image loading with caching mechanisms, reducing the need for repeated network requests and improving performance.
     - **Refactored Home View Controller with MVVM Pattern** - [commit 63c9371](https://github.com/ld5ehom/store-ios/commit/63c9371c156d51b27f64a7d0829e15fab144b532) : 
       - Separated business logic into the view model for a cleaner and more maintainable code structure. Used Combine to observe and bind data updates, allowing for automatic UI updates when the underlying data changes, utilizing the @Published property wrapper.
     - **Refactored Home View to MVI Pattern** - [commit 90e9bb2](https://github.com/ld5ehom/store-ios/commit/90e9bb2f9543406a606a091afea537c4bc1a58e2) : 
       - Adopted the MVI pattern to manage external changes and asynchronous communication through actions, resulting in a clearer code structure and simplified testing of success and failure scenarios.
     - **Enhanced Network Service for Reusability and Extensibility** - [commit 90e9bb2](https://github.com/ld5ehom/store-ios/commit/90e9bb2f9543406a606a091afea537c4bc1a58e2) :      
       - Refactored the NetworkService to improve reusability and scalability by separating the host URL and creating a flexible URL generation function. This design supports easy addition of new APIs and reduces code duplication.
     - **Coupon Button: UI and View Model Integration** - [commit cd85831](https://github.com/ld5ehom/store-ios/commit/cd85831de9c2a110e66766d55993607c4dc6f911) :    
       - Added UI and related functionality for the coupon button, allowing its enabled/disabled state to dynamically change based on the view model.
       - Improved code modularity by separating logic not directly tied to the MVI lifecycle into extensions.
     - **Horizontal Theme and Product Recommendation Carousel on Home Screen** - [commit 364973e](https://github.com/ld5ehom/store-ios/commit/364973e944dbf21861aae51ec24889dcde4bd6dc) : 
       - Implemented a basic horizontal theme image carousel using Kingfisher, along with a 'Deals for You' title at the bottom and an additional theme carousel for product recommendations.



**Task 4. Cart Page**
   - **Issues** : [task-4-cart](https://github.com/ld5ehom/store-ios/tree/task-4-cart)
   - **Details** : 
     - **Cart Page Implementation** - [commit 184bbcb](https://github.com/ld5ehom/store-ios/commit/184bbcba677936974cd63f7f02e5d417ecd95ca0) : 
       - Navigation: Implemented navigation to the cart page using a navigation bar at the top of the screen.
       - TableView Integration: Developed the cart page using UITableView and DiffableDataSource for efficient display and management of cart items.
       - Network Service Update: Updated the network service to include API calls for fetching and displaying cart data.


**Task 5. Product Details Page**
   - **Issues** : [task-5-details](https://github.com/ld5ehom/store-ios/tree/task-5-details)
   - **Details** : 
     - **SwiftUI and UIKit Integration for Product Details Page** 
       - UIHostingController Integration: Connected SwiftUI and UIKit, allowing SwiftUI views to be used in a UIKit app.
       - Layout Management: Controlled the layout using SwiftUI’s system while following UIKit’s layout rules when needed.
       - Lifecycle Coordination: Synced UIKit’s lifecycle with SwiftUI’s state changes to ensure data and UI updates happen smoothly.
       - Data Sharing: Used SwiftUI’s data tools (like ObservableObject) to share and sync data between SwiftUI and UIKit.
       - Event Handling: Handled events between UIKit and SwiftUI using simple closures and custom protocols.
       - Navigation: Combined UIKit’s UINavigationController and SwiftUI’s NavigationView for smooth navigation.
       - SwiftUI Integration: Set up the main view with UIHostingController, letting the app use SwiftUI within a UIKit framework.
 


**Task 6. Checkout Page**
   - **Details** : 
     - Develop the checkout process, integrating payment gateways and providing order summary and confirmation features.


### M2: AWS Backend Server Development

**Task 7. Cognito-based Login and Logout Functionality**
   - **Details**: 
     - Implement user authentication and authorization using Amazon Cognito.
     - Set up user pools and identity pools for handling user registration, login, and logout.
     - Ensure secure access and manage user sessions effectively.



**Task 8. Product Registration via S3**
   - **Details**: 
     - Use Amazon S3 to handle product image uploads and storage.
     - Implement APIs to manage product information and associate images with products.
     - Ensure proper permissions and access controls for the S3 bucket.


**Task 9. Purchase History Functionality with DynamoDB**
   - **Details**: 
     - Use Amazon DynamoDB to store and retrieve purchase history data.
     - Design a schema for tracking user transactions and purchase details.
     - Implement APIs to fetch and manage purchase history data efficiently.



**Task 10. Search Functionality using OpenSearch**
   - **Details**: 
     - Integrate Amazon OpenSearch (formerly Elasticsearch) for advanced search capabilities.
     - Set up indexing and search queries to enable efficient product searches.
     - Implement search filters and sorting features to enhance user experience.



**Task 11. Migration from Firebase to AWS and Integration**
   - **Details**:  
     - Migrate data and user authentication from Firebase to AWS services (e.g., using Amazon Cognito for authentication).
     - Update the app to interact with the new AWS backend APIs instead of Firebase.
     - Test integration thoroughly to ensure that all functionalities work correctly with AWS.
     - Adjust any app logic or data handling based on the new AWS setup.


### M3: Advanced Features and Testing

**Task 12. Comprehensive Testing and Debugging**
   - **Details** : 
     - Conduct unit, integration, and user acceptance testing to ensure all functionalities work as expected and meet user requirements.
     
     
     
-----
## Progress Tracking

- **Overall Progress** : Task 3 In Progress


-----
## Reference Site
- Firebase Structure Data : https://firebase.google.com/docs/database/ios/structure-data?hl=en
- Firebase Database Reference : https://firebase.google.com/docs/database/ios/lists-of-data?hl=en
- Kingfisher Library : https://github.com/onevcat/Kingfisher.git
- AWS Corretto: https://docs.aws.amazon.com/corretto/latest/corretto-17-ug/downloads-list.html
- Spring initializr : https://start.spring.io/#!type=maven-project&language=java&platformVersion=3.2.2&packaging=jar&jvmVersion=17&groupId=com.store&artifactId=backend&name=backend&description=TaeWook%20store%20project&packageName=com.store.backend&dependencies=lombok,web
- Terraform : developer.hashicorp.com/terraform
- Terraform(plugin) : github.com/ohmyzsh/ohmyzsh/tree/master/plugins/terraform
- Terraform install : https://developer.hashicorp.com/terraform/tutorials/aws-get-start/install-cli

-----
## Getting Started
### Install 

**Homebrew** : 
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

**Clone the repository** : 
```
git clone https://github.com/ld5ehom/store-ios.git
``` 

**CocoaPods**:
```
pod install
```

**AWS Amplify**:
```
https://github.com/aws-amplify/amplify-ios
```


**IntelliJ IDEA**:
```
https://www.jetbrains.com/idea/download/?section=mac
```
- Install the following plugins via the IntelliJ Plugin Marketplace:
     - Lombok
     - AWS Toolkit
     - Terraform and HCL

**MySQL**:
```
brew services start mysql
```


**Terraform**:
```
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```
- Verify the installation:
```
terraform -help
```



-----
### Setup

**InteliJ Plugin_Marketplace**
- Lombok
- AWS Toolkit
- Terraform and HCL




-----
### Start
