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
    // YOUR CODE HERE
    
    // Exercise 6: Move the kart back to its original position after you've moved it off the screen
    // Tip: Change your usage of the `translate` function to
    // use the optional completion closure
    // YOUR CODE HERE
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
    // YOUR CODE HERE
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
    // YOUR CODE HERE
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
    // YOUR CODE HERE
  }
  
  @IBAction func didLongPressBackground(_ sender: UILongPressGestureRecognizer) {
    if sender.state == .began {
      resetKarts()
    }
  }
  
  // Exercise 5: Implement `resetKarts` to reset the size and positioning of the karts
  private func resetKarts() {
    // YOUR CODE HERE
  }
  
  // Called whenever the view becomes visible on the screen
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
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
    // YOUR CODE HERE
  }
  
  // Exercise 8: Animate all karts one-by-one
  // Tip: Use `getKartReadyToRace` and its completion closure
  private func runStartingAnimationsOneByOne(completion: (() -> Void)? = nil) {
    // YOUR CODE HERE
  }
  
  // Exercise 9: Have the karts race all at once to the finish line!
  // Tip: Use the `translate` function above
  private func raceKartsWithSameSpeed() {
    // YOUR CODE HERE
  }
  
  // Exercise 10: Have the karts race all at once to the finish line!
  // Tip: Use the `translate` function above
  private func raceKartsWithRandomizedSpeed() {
    // YOUR CODE HERE
  }
}

