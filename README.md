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

### Step 0: Setup your project

- [ ] Download the DinoGuesser - starter project here: @[[lab_assets/lab_1.zip]].

### Step 1: Begin designing the layout of the first screen, GuesserViewController

After downloading and opening the starter project, we'll navigate to the `Main` storyboard file using the Project navigator pane on the left side of Xcode. This file contains our storyboard, which is a way to visualize the flow and content of the application. In opening the file, we see that we have our initial screen to work with, which will be called `GuesserViewController`. The first thing that we'll do is begin to create the layout for the application.

- [ ] While the `Main` storyboard file is open, click on the Object library (the plus `+` button at the top right corner of Xcode). The library menu will pop up.

  ![Object Library|200](https://i.imgur.com/PKJGjDL.png)

- [ ] Begin typing `UIView`, and select the View Object when it appears in the list. Drag the View onto the View Controller in the storyboard.

![Search UIView in Object Library|500](https://i.imgur.com/NaMB3SM.png)

- [ ] In the Attributes Inspector (icon with three lines), change the background color so that the view is visible.

![Change Background of View|500](https://i.imgur.com/YfDWl8H.png)

- [ ] Drag three (3) more `UIView`s onto the `GuesserViewController`. Change the background colors for these as well so that they are visible on the screen -- the color selected in the image below is "System Teal Color". Arrange them in a tile format, so they are placed as two (2) rows and two (2) columns.
  - [ ] A note: If you copy and paste a UIView after dragging one in, the copy will be the same size. So if you want to produce four rectangles of the same size. that could be one way of doing it best.

  ![Square Tiles in rows and columns|300](https://i.imgur.com/eyDAMgc.png)

There is a section on the left of the `Main` storyboard that we will use to help us navigate and tell apart the different views that we have on the screen. It also gives us the hierarchy of how the views are drawn and positioned inside the View Controller.

The View Controller's main view is the topmost view that we see in the list (if we select the first outer view, we'll see it highlight the entire view blue, as shown below). We can also note that the others are nested in one layer, which means they are contained inside the main view.

![Document Outline|400](https://i.imgur.com/98JAKsu.png)

 Right now, we have four (4) views, yet this can get more complex as we add more things to the View Controller. Let's name each of these views using the Document Outline to help us tell them apart more easily later on.

- [ ] In the nested views, select the first view with the cursor at the top of the list in the Document Outline. You'll also see it selected in the `Main` storyboard. Click on the text, and it will change to editing mode. Rename it "First View".

![Rename View to First View|400](https://i.imgur.com/faojPq2.png)

- [ ] Rename the other views "Second View", "Third View", and "Fourth View". You can verify this in the Document Outline by viewing the selected views on the left.
  ![Renamed and selected views|400](https://i.imgur.com/L0RTdL9.png)

- [ ] Click on the Object library and search `Image View`. You'll see a `UIImageView` pop-up on the screen. Drag the `UIImageView` onto the first view.

  ![Drag UIImageView on First View|800](https://i.imgur.com/7V2Gm7Z.gif)

Notice that the UIImageView is nested inside of the first view in the Document Outline.

![Image View Nested Within First View|400](https://i.imgur.com/Du9nlt7.png)

- [ ] Drag three (3) more `UIImageView`s onto each of the `View`s of the `GuesserViewController`, so they are nested inside just like the first one. We will configure each of these images.
  - [ ] For the first `UIImageView`, with the Attributes Inspector open, click on the dropdown for the Image. Select the "gallimus-silhouette" image.

  ![Choosing Silhouette Images|400](https://i.imgur.com/XPEY1BP.png)

  - [ ] For the second `UIImageView`, select the "stegosaurus-silhouette" image.
  - [ ] For the third `UIImageView`, select the "tyrannosaurus-silhouette" image.
  - [ ] For the fourth `UIImageView`, select the "brachiosaurus-silhouette" image.
<br>
  Your images and layout should look similar to the following:<br>

  ![Dinosaur Silhouettes|250](https://i.imgur.com/ZEkNX4a.png)

- [ ] Next, we will add the labels for each image. Click on the Object library and search `label`. Drag the label onto the first `UIView` centered underneath the `UIImageView`.
- [ ] Double-click inside the label to change the text. Type "???" for the label content.
- [ ] Do the same steps as above for each of the three different `UIViews` on the screen. Using the <kbd>Control</kbd>-<kbd>drag</kbd> command is also another way to also duplicate the label.

  ![Control-Drag label to Duplicate element|250](https://i.imgur.com/AFgkoFN.gif)

Your screen should now look similar to the image below:

  ![Dinosaur Silhouettes with labels|250](https://i.imgur.com/kZZpLQ2.png)

Great! Now we have finished laying out the content for the first screen. Our storyboard should be using the `iPhone 14 Pro` by default to show the layout. Let's run the app using the `iPhone 14 Pro` in the simulator. Click the <kbd>Run</kbd> button to build the app.

![GuesserViewController on iPhone 14 Pro|300](https://i.imgur.com/5XQ263H.png)

What happens if we change the iPhone to a smaller device? At the top of Xcode, there is another dropdown that allows you to select another device. Select "iPhone SE (3rd generation)" from the menu:

![Select iPhone SE|250](https://i.imgur.com/orXBLf9.png)

As you can see, the views on the screen are no longer centered and showing the way we initially placed them on the screen.

![GuesserViewController on iPhone SE|300](https://i.imgur.com/UYeBjBG.png)

This is because iOS uses the frame from the iPhone 14 Pro to let the views know where they should be placed. When we change the frame to the SE model, it still tries to place these views in the same spot as it would on the larger phone, which makes it appear off-center. Click the link to the article to read and learn more about [frame-based layouts](https://fluffy.es/frame-vs-autolayout/).

You'll also notice that some new warnings popped up on the left. These are letting us know that the labels might not show up the way we want them to in all cases.

![Xcode Warnings for Labels|600](https://i.imgur.com/cFwJP0o.png)

In order to resolve this and make our layout look the same on all screens, we'll be using stack views and auto layout!

### Step 2: Use Stack Views To Layout Guesser screen

We can start working with one square first and then move on to the other tiles as we go along.

- [ ] Select the first view on the top left. To make sure this is selected, look at the Document Outline to the left of the storyboard. You should see that the `First View` at the top has been highlighted.

![Select View in Document Outline|400](https://i.imgur.com/3qJ4xmY.png)

- [ ] Select the two items inside of the `UIView` (the image and the label). On the bottom right corner of the storyboard, you'll see an icon with a box that has a down arrow inside of it. Click on the icon, and select "Embed in Stack View" from the list.

![Embed in Stack View|200](https://i.imgur.com/sd2Z4gs.png)<br>

![Embed UIImageView and Label in Stack View|800](https://i.imgur.com/hGGAKXE.gif)

You should now be able to see a new item in the Document Outline for the Stack View, and the two items (image and label) are nested inside of it:

![Stack view with image and label|500](https://i.imgur.com/ME3FkDL.png)

Let's do the same with the other Views, images and labels:
- [ ] Select the two items inside of the `UIView` (the image and the label), and embed these in a Stack View.
- [ ] Do the same steps with the third and fourth views.

Your Document Outline should now look like this:

![Document Outline with Stack Views|500](https://i.imgur.com/5SujARl.png)

If your "???" label and your silhouette imageview  do not line up as they did before you created the stack, undo the stack by clicking on it in the document online and clicking on "Editor" at the top of the screen ,and clicking "Unembeded" from the dropdown." Then, re-arrange your elements to create more space as necessary, and place it into a stack again. Alternatively, you can also increase the size of the parent view and move the elements around.

### Step 3: Add Constraints and Configure Auto Layout in Guesser Screen

We'll begin adding some auto layout constraints to the stack views we just created.

- [ ] Select the Stack View that is nested inside of the "First View".
- [ ] On the lower right side of the window, there is an icon that has a box with 4 T-shaped symbols surrounding it. This is the "Add New Constraints" icon. Select the icon to open the popup menu.

![Add Constraints Icon|200](https://i.imgur.com/LgZfGDX.png)

- [ ] In the menu, we'll be adding a top, leading, trailing and bottom constraint. Set each of these values to 16 points.
- [ ] Next to the text field with the constraint number, click on the down arrow. Make sure that the "First View" is checked. This means that it will add the constraints for the stack view in relation to the First View. This configures the stack view to be 16 points of space away from the top, left, right, and bottom of the First View.

![Adding Constraints to Stack View](https://i.imgur.com/K67ouBA.gif)

Open the Size Inspector (it's the icon that looks like a triangle on the right panel in Xcode). You'll see the constraints we just added (horizontal and vertical) listed here:

![Size Inspector - Review Constraints|800](https://i.imgur.com/dYOCnES.png)

You'll also notice that a red error has shown in the document outline. If we take a look, we can see it is alerting us that we have some missing constraints (X and Y positions are missing for the `First View`). We will make a note of this and work on resolving the errors once we have added a few more constraints.

Let's do the same process for the other stack views.

- [ ] Add top, leading, trailing and bottom constraints (16 points) for the stack views nested in `Second`, `Third` and `Fourth` views.

### Step 4: Organizing the Stack Views

Now, we can begin organizing the views.

- [ ] Select the `First View` (contains the gallimimus silhouette) and `Third View` (contains the stegasaurus silhouette) in the Document Outline by holding down the <kbd>command</kbd> key and clicking on each one individually. You should see both of them highlighted.
- [ ] Embed these in a Stack View.
- [ ] You'll notice that by default, since the views are side-by-side, it will set the axis for the stack view to horizontal.

![Stack View Axis Horizontal|800](https://i.imgur.com/00kl9jw.png)

Let's organize the remaining views.

- [ ] Select the `Second View` (contains the tyrannosaurus silhouette) and `Fourth View` (contains the brachiosaurus silhouette) in the Document Outline by holding down the <kbd>command</kbd> key and clicking on each one individually. You should see both of them highlighted.
- [ ] Embed these in a Stack View, and check that the axis is set to horizontal.
- [ ] Let's name these new Stack Views so that we can tell them apart. Name the one that's closer to the top of the View Controller "First Horizontal Stack View" and the other one "Second Horizontal Stack View". Your outline should look similar to the one below:

![Horizontal Stack Views|600](https://i.imgur.com/o8eTvCS.png)

- [ ] Select the First and Second Horizontal Stack View using the <kbd>command</kbd> key and embed these in a Stack View. By default, this will be set to a vertical Stack View.
- [ ] Rename the new vertical Stack View to "Main Stack View".

From the top, the nesting for your hiearchy should look like the following:

![Stack View Nesting and Hierarchy|800](https://i.imgur.com/IP3O6Tk.png)

You might also note that the warnings and errors that we had were also resolved in the process. When we placed the content in the stack views, Xcode was able to determine how large the horizontal and main stack views should be based on the constraints we gave each view and the content within it. However, if we run our app on device, we'll notice that the views are not placed where they should be. We still need to add auto layout constraints for the main stack view.

- [ ] With the `Main Stack View` selected, click on the Add New Constraints icon on the lower right corner. A dropdown menu will appear to allow you to add new constraints. We'll add the top and bottom constraints, and set them to 16 points. Make sure that the constrain to margins box is checked. Once you are done choosing your selection, click the "Add constraints" button.

![Add New Constraints, Top and Bottom|300](https://i.imgur.com/zz7zoa3.png)<br>

You'll see the new constraints added in the Size Inspector:

![Add Top and Bottom Constraints for Main Stack View|500](https://i.imgur.com/Ir9CFwW.png)

- [ ] Now, we'll add leading and trailing constraints to the `Main Stack View`. With the stack view selected again, add 16 points for leading and trailing constraints. Make sure that the drop down shows that the constraint will be set from the Safe Area. Add both constraints.

![Trailing and Leading Constraints for Main Stack View|400](https://i.imgur.com/LFEGWzJ.png)

Your screen should now look like the image below, with the additional constraints showing:

![Constraints for Main Stack view|500](https://i.imgur.com/1AiW723.png)

### Step 6: Adjust the Content in the Guesser Screen

To adjust the images to be equal heights, let's adjust a few things for the stack views. Stack views have additional properties to distribute their content and space the content, so we will be updating those values.

- [ ] In the Attributes Inspector, change the distribution of the `Main Stack View`, to "Fill Equally".
- [ ] Change the Spacing to 10 points.
- [ ] Do the same steps for the `First Horizontal Stack View` and the `Second Horizontal Stack View`.

The layout looks better for our stack views, yet we still have some error messages showing. The messages are alerting us to something called hugging priority.

![Content Hugging Priority Error Messages|500](https://i.imgur.com/gwo1tWD.png)

With auto layout constraints, we can discuss two different concepts: 1) content hugging priority and 2) compression resistance.

**Content hugging priority** is the element's tendency to want to surround it's content, and resist growing bigger. If we try to stretch something out beyond its natural width or height, it will prevent it from doing so.
**Compression resistance** is the element's tendency to resist being squished past its normal size, and this can be in the horizontal or vertical direction. Labels are a good example of compression resistance, as they have an inherit width and height as big as the content they hold. If we try to make the label smaller, it will counter that from happening, as we see in the error messages.

It's also important to note that these numbers given for content hugging and compression resistance are all relative to the element beside it. This means that if something has a greater content hugging priority than another element next to it, we'll need to compare the numbers to see what behavior it might have in the end.

For our images, we'll need to adjust the content hugging priority in the vertical direction to give some flexibility in stretching more than the image's normal built-in size.

- [ ] In the Size Inspector, select and lower the vertical content hugging priority by 1 point (set to 250) for all of the images. You should now see the errors go away for content hugging.

Let's run the app!

- [ ] To rotate the phone to landscape mode, press <kbd>command</kbd>-<kbd>B</kbd>.

Everything seems to be as expected in portrait mode. Checking landscape mode, we see that the labels are no longer showing anymore.

![App in Portrait Mode|200](https://i.imgur.com/Dwf4ebN.png)<br>

![App in Landscape Mode|300](https://i.imgur.com/Fy1wmCH.png)

Since we want our app to adapt to different orientations (landscape and portrait), let's adjust the compression resistance for the images so that they can compress and allow room for the labels when the device is rotated to landscape mode.

- [ ] Select and lower the content compression resistance priority by 1 point (749) for all of the images.
- [ ] Run the app again and check landscape mode again to view the content.

![App in Landscape Mode with lowered vertical compression resistance|300](https://i.imgur.com/3A2ul1N.png)

:::success
Great! You've been able to configure your first screen to work on all device sizes and orientations!
:::

### Step 7: Set up the Navigation Controller

So far we have one screen that we can go to. What we'll want is to be able to tap on one of the dinosaur views and show more details for the selected dinosaur.

- [ ] Selecting the GuesserViewController, click on the `Embed` icon (the same one we used for the Stack Views). This time, we'll want to select `Embed in Navigation Controller`. You'll see another ViewController pop up in the `Main` storyboard.

![Navigation Controller|800](https://i.imgur.com/QIAs2a9.png)

- [ ] Next, let's set a title for the main Guesser screen. In `GuesserViewController`, tap on the white space above the `Main Stack View`. On the left in the Document Outline, you'll see that the `Navigation Item` was selected.
- [ ] In the Attributes Inspector, set the title. Set it to "Dino Guesser!" or anything else that you'd like!

![Setting the Navigation Item Title|800](https://i.imgur.com/F2vVmmm.png)

You now have everything set up to start creating the new screen!

### Step 8: Create the DetailViewController and Navigate to the Detail Screen

We'll be creating the Swift file for our new ViewController.

- [ ] With the file inspector open, click on File -> New File. Make sure that the template is set to iOS, and choose `Cocoa Touch Class`.
- [ ] On the next screen, name the class `DetailViewController`. Make sure that it is a subclass of `UIViewController`, and that the language is set to `Swift`.
- [ ] Save the file in the same place where your `GuesserViewController` is. Click the "Create" button.

You'll now have a new file showing called `DetailViewController`.

![New File DetailViewController|200](https://i.imgur.com/tnoVWD3.png)

- [ ] Open the `Main` storyboard. From the Object library, search for `View Controller`. Drag in a new view controller into the storyboard.

![Drag the View Controller onto the Screen|600](https://i.imgur.com/fMGD38r.gif)<br>

- [ ] Open the Identity Inspector on the right (the icon looks like an id card). Set the Custom class to `DetailViewController`.

![Set the Custom Class for the ViewController|600](https://i.imgur.com/qgGTJ36.png)

- [ ] To connect the navigation between the two screens, <kbd>Control</kbd>-</kbd>drag</kbd> from the `GuesserViewController` to the `DetailViewController`. A menu will pop up with options to set the Manual Segue. Choose "Show".

![Set the Manual Segue to Show](https://i.imgur.com/iJXDic2.gif)

- [ ] In the Attributes Inspector, set the Identifier for the segue to "detailSegue".

![Set the Identifier for the Segue|600](https://i.imgur.com/NXzHmvY.png)

Now that we set up the screens, we need to create an way for the first screen to navigate to the other screen. We will add a tap gesture recognizer to allow us to add an action to it when we tap on a view.

- [ ] Using the Object Library, search for "Tap Gesture Recognizer". Drag the gesture recognizer onto the `First View`. Make sure that the stack view or the image is not selected (you'll see the element that's being highlighted in the storyboard). You should see a Tap Gesture Recognizer appear in the Document Outline, and also the Outlet connect appear in the Connections Inspector (the icon on the far right that has a C with a circle in it).

![Set up a Tap Gesture Recognizer on the View](https://i.imgur.com/jurMeIr.gif)

- [ ] Set up tap gesture recognizers in the same way for the rest of the views (`Second`, `Third` and `Fourth` views). You should see four (4) tap gesture recognizers total in the Document Outline.

Next, we'll set up an action for our tap gesture recognizers.

- [ ] Control-drag from the first tap gesture recognizer in the Document Outline to an open space in the `GuesserViewController` file (right after the closing brace for `viewDidLoad` is a good place).
- [ ] When the Action menu pops up, ensure the connection is set to `Action`, and give it the name `didTapDinosaur`.
- [ ] Set the Type to `UITapGestureRecognizer` from the dropdown.

![Add Tap Gesture Recognizer Action](https://i.imgur.com/axt1KsX.gif)

We've set up the connections for the tap action! Now, we can add the code to navigate us to the next View Controller. Let's add this code inside of the `didTapDinosaur` method:

```swift
if let tappedView = sender.view {
    performSegue(withIdentifier: "detailSegue", sender: tappedView)
}
```

This will trigger the segue we set in the storyboard to navigate to the DetailViewController. Let's run the app and try it out!

![Perform Segue for Tap Action|300](https://i.imgur.com/CkNuClc.gif)<br>

Now let's connect the other tap gesture recognizers. Since they will all be going to the same screen, we can reuse the same action method.

- [ ] Control-drag from the Second Tap Gesture Recognizer to the `didTapDinosaur` method. This will connect the gesture recognizer to the same method, and you will see it show up in the Connections Inspector for the View Controller in the `Received Actions`.

![Connect Second Tap Gesture Recognizer](https://i.imgur.com/z86W0lK.gif)

- [ ] Do the same for the third and fourth tap gesture recognizers. You should see 4 tap gesture recognizers show up in the received actions list. Tap on the `Dino Guesser Scene` in the document outline to see the received actions list.

![Four Tap Gesture Recognizers for Received Actions|400](https://i.imgur.com/TphtZyc.png)

- [ ] Run your app and test your tap gesture recognizers to make sure they are working as expected.

![Testing Tap Gesture Recognizers to Detail Screen](https://i.imgur.com/vuUGNjM.gif)

### Step 9: Pass the Dinosaur Data to the DetailViewController

If we view the console, we can see the dinosaur data (each individual dinosaur struct) is being printed. We want to be able to pass along this information to the `DetailViewController` so that it can be configured with the selected dinosaur data. Before we are able to do that, we'll need to add a property to the `DetailViewController` to be able to pass along the data.

- [ ] Add the dinosaur property to `DetailViewController` that will hold the Dinosaur data that will be passed from the `GuesserViewController`. You can add this at the top of the `DetailViewController` file before the `viewDidLoad` method.

  ```swift
  // Property
  var dinosaur: Dinosaur?
  ```

- [ ] Add the following code to the `GuesserViewController`, right after the `didTapDinosaur` method.

  ```swift
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

      if segue.identifier == "detailSegue",
          let tappedView = sender as? UIView,
          let detailViewController = segue.destination as? DetailViewController {

          if tappedView.tag == 0 {
              detailViewController.dinosaur = dinosaurs[0]
          } else if tappedView.tag == 1 {
              detailViewController.dinosaur = dinosaurs[1]
          } else if tappedView.tag == 2 {
              detailViewController.dinosaur = dinosaurs[2]
          } else if tappedView.tag == 3 {
              detailViewController.dinosaur = dinosaurs[3]
          } else {
              print("no Dinosaur was tapped, please check your selection.")
          }
      }
  }
  ```

In the code above, we are checking the identifier for the segue first. If we are navigating using the `detailSegue`, then we'll check a couple of things. Since we tapped on a tile, we'll check that the sender is what we'd expect (a `UIView`). Each segue also has a destination, which in our case, is the `DetailViewController`. We will get the segue destination and try to cast it as a `DetailViewController` to be able to store in a variable for us to use. From here, we can access the direct properties on the `DetailViewController`. This is how we can set the `dinosaur` property we created earlier.

In our `GuesserViewController`, the dinosaur data is stored in an array. Array elements can be accessed by their position, starting at 0. The first element of the list is always 0, then goes up by 1. Using the `[` `]` around the numbers is called **bracket notation** and is how we will be able to access an individual element from the array.

Another way to display this would be to say:

```swift
dinosaurs[0]     // Gets first dinosaur: gallimimus
dinosaurs[1]     // Gets second dinosaur: stegosaurus
dinosaurs[2]     // Gets third dinosaur: tyrannosaurus
dinosaurs[3]     // Gets fourth dinosaur: brachiosaurus
```

Now that we have a way to access the data from the array, let's configure our UI to send a message to fetch the right dinosaur from the array! Let's set a few tags on the `UIView`s we have.

- [ ] In the `GuesserViewController` in `Main` storyboard, select the `First View` (gallimus silhouette).
- [ ] In the Attributes Inspector, note the Tag property. It is set to 0 by default. This is how we will tell apart the different views in code.

![Tag Property on View|800](https://i.imgur.com/AcE5UMc.png)

- [ ] Select the `Third View` (stegosaurus silhouette) in `GuesserViewController`. Set the tag property to 1 for this view.
- [ ] Select the `Second View` (tyrannosaurus silhouette) in `GuesserViewController`. Set the tag property to 2 for this view.
- [ ] Select the `Fourth View` (brachiosaurus silhouette) in `GuesserViewController`. Set the tag property to 3 for this view.

Let's test this out! First, remove the print statements we have in `viewDidLoad` in `GuesserViewController`:

```swift
// In GuesserViewController:

override func viewDidLoad() {
    super.viewDidLoad()
    ...

    // Remove these three lines
    print("Here are the different dinosaurs:")
    for dinosaur in dinosaurs {
        print(dinosaur)
    }
}
```

Next, in `viewDidLoad` of `DetailViewController` , add a print line to print the dinosaur's name. This is how we will test that we passed the correct dinosaur.

```swift
// In DetailViewController:

override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    if let dinosaur = dinosaur {
        print(dinosaur.name)
    }
}
```

Great! You should now be able to see the name of the dinosaur you've selected printed to the console when you navigate to the `DetailViewController`!

![Printed Dinosaur names|200](https://i.imgur.com/HocCQWc.png)

### Step 10: Set up the UI for the DetailViewController

Let's check out the UI for the `DetailViewController` screen. What kind of UI elements do you think might be needed for this screen? Try to guess using your existing knowledge.

![Detail View Controller UI|300](https://i.imgur.com/01fle6F.png)

^^^<span style="font-size:1em; font-weight: 500; color:#ff8c00">Once you give it a try, click this dropdown to check your guess.</span>^^^

Since we'll be showing the dinosaur image, we'll need a `UIImageView` to display it. The rest of the elements on the screen are `UILabels!`, just styled differently!

![DetailViewController elements|300](https://i.imgur.com/iRyeJhV.png)
^^^

- [ ] Add the UI elements you'll need from the Object library to your `Detail` screen. It's okay if you do not set auto layout just yet, you can just position the elements for now on the screen.

^^^<span style="font-size:1em; font-weight: 500; color:#ff8c00">Once you give it a try, click this dropdown to check your work.</span>^^^

Document Outline and UI Elements for `DetailViewController`:

![|500](https://i.imgur.com/9Oax0ka.png)

^^^

- [ ] Create IBOutlets from the `Main` storyboard to the `DetailViewController` for the elements that you'll be changing in code.

^^^<span style="font-size:1em; font-weight: 500; color:#ff8c00">Once you give it a try, click this dropdown to check your work.</span>^^^

You should have outlets for the following:

  ```swift
  // IBOutlets

  @IBOutlet weak var dinosaurImageView: UIImageView!
  @IBOutlet weak var dinosaurNameLabel: UILabel!

  @IBOutlet weak var typeLabel: UILabel!

  @IBOutlet weak var weightLabel: UILabel!
  @IBOutlet weak var heightLabel: UILabel!

  // Fact Labels
  @IBOutlet weak var factLabel1: UILabel!
  @IBOutlet weak var factLabel2: UILabel!
  @IBOutlet weak var factLabel3: UILabel!
  @IBOutlet weak var factLabel4: UILabel!
  ```

^^^

- [ ] Let's add the following to `viewDidLoad`, right after the print statement to configure the image and dynamic labels (labels where the content will change):

  ```swift
  if let dinosaur = dinosaur {
      // Configure the dinosaur image and dynamic labels
      dinosaurImageView.image = dinosaur.image
      dinosaurNameLabel.text = dinosaur.name
      typeLabel.text = dinosaur.type
      weightLabel.text = String(dinosaur.weight) + " KG"
      heightLabel.text = String(dinosaur.height) + " M"
      factLabel1.text = String(dinosaur.diet)
      factLabel2.text = String(dinosaur.era)
      factLabel3.text = String(dinosaur.region)
      factLabel4.text = String(dinosaur.speed) + " mph"
  }
  ```

- [ ] Run the app. You should see the image and labels with the dinosaur data! Note: You'll notice that the labels are cut off -- that is because we haven't applied our auto layout yet, and the labels will only be the size that they are currently stretched out to.

![Dinosaur Data Configured in Detail Screen|300](https://i.imgur.com/Xd2gs1P.gif)

- [ ] Configure the Detail screen with stack views and auto layout to update the UI.

^^^<span style="font-size:1em; font-weight: 500; color:#ff8c00">Once you give it a try, click this dropdown to check your work.</span>^^^

Your Document Outline for the `DetailViewController` should look similar to the following:

![DetailViewController Document Outline](https://i.imgur.com/K9qwZCO.png)
^^^

- [ ] Add customizations to your screens to add polish to your UI!

:::success
🎉 You now have finished setting up the Guessing Game! You can test your dinosaur trivia and add more dinosaurs as you see fit.
:::
