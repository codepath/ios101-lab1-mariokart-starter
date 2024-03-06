//
//  ViewController.swift
//  Mario Cart
//
//  Created by Charles Hieger on 1/25/19.
//  Copyright © 2019 Charles Hieger. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
                      UIGestureRecognizerDelegate {
  
  // Bowser
  @IBOutlet weak var kartView0: UIImageView!
  // Mario
  @IBOutlet weak var kartView1: UIImageView!
  // Toad
  @IBOutlet weak var kartView2: UIImageView!
  
  // Keeps track of the original position of the karts when the view is initially loaded
  private var originalKartCenters = [CGPoint]()
  
  // Called when the view controller has awakened and is finished
  // setting up it's views
  override func viewDidLoad() {
    super.viewDidLoad()
    
    originalKartCenters = [kartView0.center,
                           kartView1.center,
                           kartView2.center]
  }
  
  //  Called when user double-taps a kart
  @IBAction func didDoubleTapKart(_ sender: UITapGestureRecognizer) {
    // Exercise 1: Move the kart forward past the edge of the screen
    // Tip: Use the `translate` function below
      //translate(kart: sender.view, by: view.frame.width) // move the kart forward by the width of the containing view
    // Exercise 6: Move the kart back to its original position after you've moved it off the screen
    // Tip: Change your usage of the `translate` function to
    // use the optional completion closure
      translate(kart: sender.view, by: view.frame.width) {
        self.translate(kart: sender.view, by: -self.view.frame.width)
      }
  }
  
  private func translate(kart: UIView?,
                         by xPosition: Double,
                         animationDuration: Double = 0.6,
                         completion: (() -> Void)? = nil) {
    guard let kart = kart else { return }
    UIView.animateKeyframes(withDuration: animationDuration, delay: 0.0) {
      kart.center.x = kart.center.x + xPosition
    } completion: { finished in
      completion?()
    }
  }
  
  // Called when the user rotates a kart
  @IBAction func didRotateKart(_ sender: UIRotationGestureRecognizer) {
    // Exercise 2: Rotate the kart
    // Tip: Use the `rotate` function below
      rotate(kart: sender.view, gestureRecognizer: sender)
  }
  
  private func rotate(kart: UIView?,
                      gestureRecognizer: UIRotationGestureRecognizer) {
    guard let kart = kart else { return }
    kart.transform = kart.transform.rotated(by: gestureRecognizer.rotation)
    gestureRecognizer.rotation = 0
  }
  
  // Called when the user pinches a kart
  @IBAction func didPinchKart(_ sender: UIPinchGestureRecognizer) {
    // Exercise 3: Change the scale of the kart
    // Tip: Use the `scale` function below
      scale(kart: sender.view, gestureRecognizer: sender)
  }
  
  private func scale(kart: UIView?,
                     gestureRecognizer: UIPinchGestureRecognizer) {
    guard let kart = kart else { return }
    kart.transform = kart.transform.scaledBy(x: gestureRecognizer.scale,
                                             y: gestureRecognizer.scale)
    gestureRecognizer.scale = 1
  }
  
  // Called when the user pans on a kart
  @IBAction func didPanKart(_ sender: UIPanGestureRecognizer) {
    moveKart(using: sender)
  }
  
  // Exercise 4: Implement the `moveKart` function to move the kart based on the
  // location of the location of the gesture in the view
  private func moveKart(using gestureRecognizer: UIPanGestureRecognizer) {
      let location = gestureRecognizer.location(in: view) // get the location of the gesture
      let kartView = gestureRecognizer.view // get a reference to the kart
      kartView?.center = location // move the kart to that location
  }
  
  @IBAction func didLongPressBackground(_ sender: UILongPressGestureRecognizer) {
    if sender.state == .began {
      resetKarts()
    }
  }
  
  // Exercise 5: Implement `resetKarts` to reset the size and positioning of the karts
  private func resetKarts() {
      UIView.animate(withDuration: 0.4) { // these changes should occur over the duration of 0.4 seconds
        // reset the transformations for the karts to their original state
        self.kartView0.transform = .identity
        self.kartView1.transform = .identity
        self.kartView2.transform = .identity
        // reset the positions of the karts to their initial positions
        self.kartView0.center = self.originalKartCenters[0]
        self.kartView1.center = self.originalKartCenters[1]
        self.kartView2.center = self.originalKartCenters[2]
      }
  }
  
  // Called whenever the view becomes visible on the screen
  override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated) // since we're overriding this from the super class, we should call the super class implementation
      runStartingAnimationsOneByOne {
        self.raceKartsWithRandomizedSpeed()
      }
  }
  
  private func getKartReadyToRace(kart: UIImageView,
                                  completion: (() -> Void)? = nil) {
    UIView.animateKeyframes(
      withDuration: 0.6,
      delay: 0.0,
      animations: {
        kart.center.x = kart.center.x + 20
      },
      completion: { _ in
        completion?()
      })
  }
  
  // Exercise 7: Animate all karts all at once as if they were getting ready for a race
  // Tip: Use `getKartReadyToRace`
  private func runStartingAnimationsAllAtOnce() {
      getKartReadyToRace(kart: kartView0)
      getKartReadyToRace(kart: kartView1)
      getKartReadyToRace(kart: kartView2)
  }
  
  // Exercise 8: Animate all karts one-by-one
  // Tip: Use `getKartReadyToRace` and its completion closure
  private func runStartingAnimationsOneByOne(completion: (() -> Void)? = nil) {
      getKartReadyToRace(kart: kartView0) { // animate kartView0 first
        self.getKartReadyToRace(kart: self.kartView1) { // ...then kartView1
          self.getKartReadyToRace(kart: self.kartView2) { // ...then kartView2
            // runStartingAnimationsOneByOne also takes in an optional completion closure
            // so we'll go ahead and execute that closure only after the three animations are done
            // we use '?' since this argument is an optional (we'll talk about them in the next unit)
            completion?()
          }
        }
      }
  }
  
  // Exercise 9: Have the karts race all at once to the finish line!
  // Tip: Use the `translate` function above
  private func raceKartsWithSameSpeed() {
      translate(kart: kartView0, by: view.frame.width)
      translate(kart: kartView1, by: view.frame.width)
      translate(kart: kartView2, by: view.frame.width)
  }
  
  // Exercise 10: Have the karts race all at once to the finish line!
  // Tip: Use the `translate` function above
  private func raceKartsWithRandomizedSpeed() {
      let kartView0Speed = Double.random(in: 0.5...5) // get a random value between 0.5 and 5.0
      translate(kart: kartView0, by: view.frame.width, animationDuration: kartView0Speed)
      let kartView1Speed = Double.random(in: 0.5...5)
      translate(kart: kartView1, by: view.frame.width, animationDuration: kartView1Speed)
      let kartView2Speed = Double.random(in: 0.5...5)
      translate(kart: kartView2, by: view.frame.width, animationDuration: kartView2Speed)
  }
}

