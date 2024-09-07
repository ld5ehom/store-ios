echo "# messenger-ios" >> README.md
git init
git add README.md
git branch -M main
git remote add origin https://github.com/ld5ehom/store-ios.git
git push -u origin main

git rm -r --cached Messenger-iosTests
git rm -r --cached Messenger-iosUITests
git commit -m "Remove Messenger-iosTests and Messenger-iosUITests from tracking"
git push

https://messenger-a8cf0.firebaseapp.com/__/auth/handler


# 프로젝트 시작 (깃허브 연동)
git remote add origin https://github.com/ld5ehom/store-ios.git

## 로컬 저장소로 이동
cd /Users/teo/Desktop/Store-ios

##브랜치 확인
git branch

## 새 브랜치 생성 및 체크아웃
git checkout -b task-5-details

##브랜치 전환
git checkout task-5-details

##브랜치 2로 전환
git checkout branch2


##메인 브랜치에 추가하기
git pull

##브랜치1의 변경 사항을 브랜치2로 병합 (branch2로 전환 이후)
git merge branch1

## 현재 브랜치 이름을 task-3-home 으로 변경
git branch -m task-3-home

##원격 저장소에 이미 푸시한 경우에는 새로운 이름으로 브랜치를 푸시하고, 잘못된 브랜치를 삭제해야 합니다.
git push origin -u task-3-home
git push origin --delete task-2-home




## 변경 사항이 있다면 커밋
git add .
git commit -m "Setup login view for Task 1"

## task-1-login에 브랜치 푸시
git push -u origin task-1-login


## 로컬 커밋 되돌리기 (커밋 삭제)
git reset --hard HEAD~1


## 특정 커밋으로 리셋하기 (가져오기)
git reset --hard (브렌치 번호)


## 삭제 
git rm -r --cached Pods
git rm -r --cached Podfile Podfile.lock Messenger-ios.xcodeproj Messenger-ios.xcworkspace


##깃 커밋 
git commit -m "feat: 프로젝트 초기 설정 및 런칭 준비" -m "- Xcode 프로젝트 초기화 및 설정
- 필수 의존성 설치 및 셋업 완료
- 기본 앱 구조 및 폴더 구조 설정
- 초기 테스트 대상 파일 추가"



## Task List
### M1: Core Functionality Development

**Task 1. Login View**
   - **Issues** : [task-1-login](https://github.com/ld5ehom/messenger-ios/tree/task-1-login)
   - **Estimated Duration**: 3 days
   - **Status** : Completed (August 13–August 15, 2024)
   - **Details (commit 5a76f48)** : Updated the login UI view and implemented user authentication with secure login, registration features, and logout functionality using Firebase, including Google and Apple sign-in.

   
**Task 2. Home View**
   - **Issues** : [task-2-home](https://github.com/ld5ehom/messenger-ios/tree/task-2-home)
   - **Estimated Duration**: 3 days
   - **Status** : Completed (August 15–August 17, 2024)
   - **Details (commit 2957173)**:  
     - **Home UI and Phase**: Displays context-appropriate loading screens using Home UI and phase management.  
     - **Firebase Integration**: Implements login and logout functionalities with Firebase Realtime Database.  
     - **Contact Framework**: Integrates the Contact framework to enable friend-adding functionality.


**Task 3. Profile View**
   - **Issues** : [task-3-profile](https://github.com/ld5ehom/messenger-ios/tree/task-3-profile)
   - **Estimated Duration** : 4 days
   - **Status** : Completed (August 17–August 20, 2024)
   - **Details** : 
     - **MyProfileView UI (commit 257b9ff)**: Implemented the UI and functionalities for the My Profile section.
     - **MyProfileDescView UI (commit 257b9ff**: Created a user profile status view with functionality to update and sync the profile status with Firebase DB.
     - **MyProfile Image Update with PhotosUI (commit 833f25d)**: Added functionality to update the profile image using a photo picker. Users can click on the profile image to select and update it.
     - **Firebase Cloud Storage Integration (commit 0d27e8d)**: Implemented functionality to upload the selected profile image to Firebase Cloud Storage.
     - **Upload Provider Implementation (commit 0d27e8d)**: Integrated an upload provider to manage data uploads to Firebase Storage.
     - **Profile Image Display (commit 0d27e8d)**: Implemented a feature to display the profile image using an asynchronous image view with a URL.
     - **Image Cache Service (commit 51a7644)**: Developed an image cache service to manage memory efficiently.
     - **URL Image View (commit 51a7644)**: Created a view that replaces asynchronous images with cached images using the image cache service.
     - **Task-3-profile (commit bc9b04d) details**
         - **Navigation Management (commit bc9b04d)**: Created an enum for common navigation paths across the app. Developed a navigation router to manage these paths, using NavigationLink and NavigationDestination to handle navigation between views.     
         - **Other Profile View (commit bc9b04d)**: Developed the user interface and functionalities for viewing other users' profiles. Added features for initiating chats with other users.
         - **Chat and Search UI (commit bc9b04d)**: Designed the basic structure for the chat user interface (UI) and search UI.
     - **Chat List UI Implementation (commit 0f17277)**: Integrated the search button with the chat list UI into a unified view and reused the UI by utilizing navigation.


**Task 4. Chat View**
   - **Issues** : [task-4-chat](https://github.com/ld5ehom/messenger-ios/tree/task-4-chat)
   - **Estimated Duration** : 3 days
   - **Status** : Completed (August 20–August 21, 2024)
   - **Details** : 
     - **Chat Room UI (commit cf4f234)**: The chat interface is organized into sections by date, with each section header displaying the chat date. Messages within each section are grouped accordingly.
     - **Chat Item VIew (commit cf4f234)**: Differentiated the color and position of messages to distinguish between the user's and the recipient's messages.    
     - **Text Field (commit cf4f234)**: Implemented a text field for message input, along with an input view that includes an image picker for attaching photos.
     - **Date Extension (commit cf4f234)**: Added methods for converting Date objects to and from formatted strings, optimized for use in chat applications.
     - **Keyboard Toolbar (commit cf4f234)**: A view modifier that adds a customizable toolbar above the keyboard, facilitating additional actions within the chat interface.
     - **Real-Time Chat Updates (commit eec6591)**: Implemented real-time updates for chat messages using Firebase Realtime Database, ensuring that changes in the chat message storage path are immediately reflected in the view.


**Task 5. Search View**
   - **Issues** : [task-5-search](https://github.com/ld5ehom/messenger-ios/tree/task-5-search)
   - **Estimated Duration** : 2 day
   - **Status** : Completed (August 21–August 22, 2024)
   - **Details** : 
     - **SearchBar Integration (commit c5dd76e)**: Integrated UISearchBar(UIKit) into SwiftUI for search functionality
     - **Recent Searches Section (commit c5dd76e)**: Implemented a feature to store and manage recent search terms using Core Data, allowing users to view their recent searches.
     - **CoreData (commit cd61615)**: Implemented recent search functionality using Core Data. This includes creating a new SearchResult entity, setting its properties (ID, name, date) and saving it to CoreData.


**Task 6. Settings View**
   - **Issues** : [task-6-setting](https://github.com/ld5ehom/messenger-ios/tree/task-6-setting)
   - **Estimated Duration** : 2 day
   - **Status** : Completed (August 22, 2024)
   - **Details** : 
     - **User Interface Style (commit 5d1915a)**: Implemented functionality to toggle between light and dark modes. The selected style is saved to UserDefaults and applied across different views within the app.

### M2: Advanced Features and Testing

**Task 7. Comprehensive Testing and Debugging**
   - **Issues** : [task-7-test](https://github.com/ld5ehom/messenger-ios/tree/task-7-test)
   - **Details** : 
     - **Unit Testing (commit 603b591)**: Conducted unit tests for the repository, service, and view model layers to verify their accuracy.  
     - **DIContainer Refactoring (commit 603b591)**: Refactored NavigationRouter, SearchDataController, and AppearanceController into the DIContainer to centralize dependency management.
     - **UserDBRepository Layer (commit 603b591)**: Created a protocol to abstract communication with Firebase and refactored the repository to conform to this protocol.
     - **Google Sign-In Test Error (commit 603b591)**: Encountered errors with the Google Sign-In library during testing. The issue was resolved by removing the library.
     
