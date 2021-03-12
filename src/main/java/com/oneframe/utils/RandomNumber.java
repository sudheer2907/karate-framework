package com.oneframe.utils;

import java.util.Random;

public class RandomNumber {

  public RandomNumber() {

  }

  public int getRandomNumber(int range) {
    // Create instance of random class
    Random rand = new Random();
    // Generate random integer in range 0 to (range-1)
    int randInt = rand.nextInt(range);
    return randInt;
  }

}
