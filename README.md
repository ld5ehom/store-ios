# Store iOS App

## Project Overview
- Developed a store app for iOS, implementing user authentication with Firebase, including secure login and registration functionalities.
- Separated views from view controllers by avoiding Storyboards, using programmatic UI layout.
- Integrated WKWebView for the checkout screen, enabling web-based payment processing. 
- Automated builds using Xcode Cloud for CI/CD, and utilized Fastlane for build automation and GitHub Actions for build verification and testing.
- Utilized: Swift, UIKit, MVI, Firebase


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
   - **Details**  


**Task 3. Home Page**
   - **Issues** : [task-3-home](https://github.com/ld5ehom/store-ios/tree/task-3-home)
   - **Details** : 
     - **Design Source** : 
       - Integrated design resources into the DesignSource file by componentizing them for the implementation of the home screen banner.

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






-----
### Start
