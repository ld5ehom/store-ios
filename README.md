# Store iOS App

## Project Overview - iOS
- Developed a store app for iOS, implementing user authentication with Firebase, including secure login and registration functionalities.
- Separated views from view controllers by avoiding Storyboards, using programmatic UI layout.
- Integrated WKWebView for the checkout screen, enabling web-based payment processing. 
- Automated builds using Xcode Cloud for CI/CD, and utilized Fastlane for build automation and GitHub Actions for build verification and testing.
- Utilized: Swift, UIKit, MVI, Firebase


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
     - **Home Banner Slide** - [commit 04647e9](https://github.com/ld5ehom/store-ios/commit/04647e90727f0b0f90285999675564785adb7b12) : 
       - The Home storyboard view controller wasn't connected, so the storyboard was loaded to properly use the Home view controller.
       - Using a compositional layout and diffable data source to efficiently manage and display collection view items. 
     - **Home Screen Scroll Component** : 
       - Implemented a horizontal scroll component for the Home screen by configuring each cell to display product details, including images, titles, and prices. The cells are designed to show product images, titles, and prices, with the original price having a strikethrough effect to indicate discounts.


**Task 4. Cart Page**
   - **Details** : 
     - Create and implement the cart page to manage items, including add, remove, and update functionalities, integrated with backend synchronization.


**Task 5. Product Information Page**
   - **Details** : 
     - Design the product detail view to show detailed information, images, and reviews, with functionality to add items to the cart.


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
