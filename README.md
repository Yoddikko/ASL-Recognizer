# ASL Recognizer
## A simple app that analyses and recognises the alphabet in sign language using machine learning
[Notion link](https://www.notion.so/appledeveloperacademyunina/arg-ASL-Recognizer-c879fa5931e34f8cbfce5a24774c98c1)
[TestFlight link](https://testflight.apple.com/join/BIrexCMq)

![asl cover](https://user-images.githubusercontent.com/92546954/162177681-798f751b-c5d1-449f-973b-15893edb17aa.png)


I trained the model with [this](https://www.kaggle.com/datasets/grassknoted/asl-alphabet) dataset of about 80,000 images depicting the american alphabet in sign language.
The computer trained the model for about 24h and I got pretty accurate results. 
<img width="925" alt="Schermata 2022-04-01 alle 16 41 43" src="https://user-images.githubusercontent.com/92546954/161829153-35933803-1eff-422e-b331-0bca2efbe7b6.png">
<img width="917" alt="Schermata 2022-04-01 alle 16 40 42" src="https://user-images.githubusercontent.com/92546954/161829164-a45a509b-bfe6-464b-91c7-65e2ab6927e7.png">
###### Implementation
[Download the model](https://www.dropbox.com/s/ga1q5zjcdsub7xu/SignAlphabet.mlpackage.zip?dl=0)

Once the model had finished training I implemented it in Swift, creating a project that received in UIImage processes it with the model and shows the result on screen.  available on GitHub.
###### The frameworks I used
I used AVFoundation as the first framework to start recording in real time and receive frames from the camera. After that, the frames I was receiving from the camera were processed using the model created with machine learning and using the vision framework. Then the whole UI is built using SwiftUI.

![frameworks 001](https://user-images.githubusercontent.com/92546954/161830210-2d2e61e1-f042-4be1-b0d7-22e2a63a925f.png)

##### Demo of the app
<img src="https://user-images.githubusercontent.com/92546954/161830773-4837eb76-475b-450e-8c47-1b56683fde67.gif" width="250"> <img src="https://user-images.githubusercontent.com/92546954/161830824-d5ae22e7-25ca-4be7-a547-68792164abe2.png" width="250"> <img src="https://user-images.githubusercontent.com/92546954/161830830-3f3b9f53-c9f5-412f-9d41-1ad1ccf09dff.png" width="250">



![ASL RECOGNIZER 001](https://user-images.githubusercontent.com/92546954/163158793-3627bbc2-2ffc-4fb1-a2a9-664736d00b9f.png)



##### Logo
<img src="https://user-images.githubusercontent.com/92546954/161830840-5317e76a-1109-4ceb-9f61-6e949c498a8d.png" width="300">
