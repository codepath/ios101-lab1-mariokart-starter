## Lab 1: Mariokart

### Overview

https://user-images.githubusercontent.com/1978001/218283383-f19a77cb-84b4-4bf7-b190-7cbb7ed24b16.mp4

### 🎯 Goals

For your first lab, you will partially fill-in an XCode project to complete the feature set below. Since this is your first lab, you do **not** need to fully understand every aspect of the XCode project. Tips & hints will be given so that you can make progress and become familiar with iOS development. You do **not** need to add or modify any code unless specifically instructed in the comments.

At a high-level, this lab should teach you the following:

- [ ] Navigate your way and make changes in a basic Xcode project
- [ ] Understand how to access and use Apple's API documentation
- [ ] Become familiar with basic Swift syntax and features

### Features

The provided XCode project has been annotated with comments to dictate where you should be putting your code. **You should only be making changes to parts of the code where instructed**. You will be filling-in functions to complete the following features:

- [ ] Double-tapping a kart should animate it off the screen
- [ ] Turning a kart using two fingers should rotate the kart
- [ ] Pinching a kart using two fingers should enlarge/shrink the kart
- [ ] Panning the kart should move it based on the location of the gesture
- [ ] Long-pressing the background should reset the position and state of the karts
- [ ] Animate the karts to their starting position all at once when the app is launched
- [ ] Animate the karts to their starting position one at a time when the app is launched
- [ ] Have the karts race at the same speed
- [ ] Have the karts race at the randomized speeds

### Resources

- [Swift Documentation](https://developer.apple.com/documentation/swift)
- [UIKit Documentation](https://developer.apple.com/documentation/uikit)

## Lab Instructions

### Step 0: Download and run the starter project

- [ ] Download the starter project [here](https://github.com/codepath/ios101-lab1-mariokart-starter)
- [ ] Make sure you're using the recommended XCode version. This should have been stated by the instructor during class.
- [ ] Double click the `.xcodeproj` file in the repository. This should automatically open up XCode and the project files.
- [ ] Press `command + R` to build the project and run it on the simulator.
  - You can also click the arrow button in the top-left hand side of XCode.
  - If this isn't working, ensure that you're building "MarioKart" with a valid simulator selected.
        - **TODO: We should include a screenshot of this.**
- [ ] Your app should now be running on an iOS simulator!
  - **TODO: We should include a screenshot of this.**

### Step 1: Implement Double-tap

- [ ] Click on the project navigator icon in the top-left handside of XCode. This should show you a list of all the available files in the project.
  - **TODO: We should include a screenshot of this.**
- [ ] Click on `ViewController.swift` to view its contents. **This is should be the only file you should be making changes to.**
- [ ] Browse the file and look at the line containing the comment `Exercise 1:`. This should be located inside of a function `didDoubleTapKart`.
  - **Tip**: You can easily use `command + f` to search for strings in a file
- [ ] `didDoubleTapKart` is a function that's fired when the user double-taps a kart. We want to propel the kart forward when this happens. If you look below this function, there's another function called `translate` which takes in a couple of arguments. Let's go ahead and use this function:

```swift
@IBAction func didDoubleTapKart(_ sender: UITapGestureRecognizer) {
  translate(kart: sender.view, by: view.frame.width)
}
```

By looking at the function signature, the `translate` function expects at least a couple of arguments: `kart` which is of type `UIView` and `xPosition` which is a a `Double`. The other two arguments, `animationDuration` and `completion` have default values so those aren't required.

**Tip**: If you want to know what properties and methods you can call on a type, you can always `command + click` on the type or property in XCode to see the definition and interface. You can also just Google and look at the official Apple documentation online. Make sure you get comfortable with this, as you will be doing it a lot!
    - **TODO: We should include a GIF of this.**

- [ ] After implementing `didDoubleTapKart`, rebuild your app with `command + r` and try double-tapping a kart to animate it forward!

### Step 2: Implement Rotation

- [ ] Search for the comment containing `Exercise 2:`. This should lead you inside the function `didRotateKart` which is fired if the user attemps a rotational gesture on a kart.
- [ ] Similar to the last exercise, there's already an existing function `rotate` which requires us to pass in the `UIView` associated with the kart and the `gestureRecognizer`:

```swift
@IBAction func didRotateKart(_ sender: UIRotationGestureRecognizer) {
  rotate(kart: sender.view, gestureRecognizer: sender)
}
```

- [ ] Make those changes and rebuild your app again. Try rotating the kart. On the simulator it's a little tricky, but use a combination of the `option` and `shift` key to position your virtual fingers correctly and rotate a kart.
  - **TODO: We should include a GIF of this.**

### Step 3: Implement Pinch

- [ ] Search for the comment containing `Exercise 3:`. This should lead you inside the function `didPinchKart` which is fired if the user attemps a pinch gesture on a kart.
- [ ] Similar to the last exercise, there's already an existing helper function `scale` to help you achieve this. Go ahead and use that.
- [ ] Rebuild, then try pinching a kart using the `option` and `shift` keys to see if it scales!
  - **TODO: We should include a GIF of this.**

### Step 4: Implement Panning

- [ ] Search for the comment containing `Exercise 4:`. This should lead you to implement the `moveKart` function. `moveKart` is used in `didPanKart` which is fired when a user long-presses and pans a kart. To implement `moveKart`, we need to find out the location of the user's gesture and move the kart to that location:

```swift
private func moveKart(using gestureRecognizer: UIPanGestureRecognizer) {
  let location = gestureRecognizer.location(in: view) // get the location of the gesture
  let kartView = gestureRecognizer.view // get a reference to the kart
  kartView?.center = location // move the kart to that location
}
```

**Tip**: It might seem intimidating at first to know these APIs, but it gets easier after repetition and time. This is also why being able to read documentation and using `command + click` to find out more about a class/type interface is so useful!

- [ ] Rebuild and try long pressing on a kart and moving your virtual finger. This should move the kart with the user's finger!

### Step 5: Implement Reset Karts

- [ ] Search for the comment containing `Exercise 5:`. This should lead you to a function `resetKarts` which should animate and reset the karts to its original state after launching the app.
- [ ] To implement this function, we'll be using the common `UIView.animate` API. This API takes in a duration and a *closure* which contains the transformations you want to animate. You can think of closures akin to anonymous functions in Python and Javascript. Closures are blocks of code which can be passed and executed at some point in time. In this example, you pass in the code you want iOS to animate with the specified duration:

```swift
private func resetKarts() {
  UIView.animate(withDuration: 0.4) { // these changes should occur over the duration of 0.4 seconds
    // reset the transformations for the karts to its original state
    self.kartView0.transform = .identity
    self.kartView1.transform = .identity
    self.kartView2.transform = .identity
    // reset the positions of the karts to the its initial positions
    self.kartView0.center = self.originalKartCenters[0]
    self.kartView1.center = self.originalKartCenters[1]
    self.kartView2.center = self.originalKartCenters[2]
  }
}
```

The above function call to the `UIView.animate` API is an example of a *trailing closure* in Swift, whereby if the last argument is a closure, then the passed in argument can exist outside of the parenthesis of the function call. You can read more about closures [here](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/closures/).

### Step 6: Implement reset kart after double tap

- [ ] Here's another closure exercise. Search for `Exercise 6:` and change your usage of `translate` and pass-in a closure as the last argument. This closure will get executed after the initial kart animation is done, hence why it's named `completion`. For funsies, let's translate the kart back to its original position.

```swift
@IBAction func didDoubleTapKart(_ sender: UITapGestureRecognizer) {
  translate(kart: sender.view, by: view.frame.width) {
    self.translate(kart: sender.view, by: -self.view.frame.width)
  }
}
```

The above uses the trailing closure syntax, which is the **Swift-y** way to do things. The following would also work:

```swift
@IBAction func didDoubleTapKart(_ sender: UITapGestureRecognizer) {
  translate(kart: sender.view, by: view.frame.width, completion: {
    self.translate(kart: sender.view, by: -self.view.frame.width)
  })
}
```

:::success
🎉 You have now finished completing your first lab!
:::
