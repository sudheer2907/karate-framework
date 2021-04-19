package com.karate.utils;

import java.util.logging.Level;
import java.util.logging.Logger;

public class StringUtils {
  public static Logger LOGGER;

  static {
    LOGGER = Logger.getLogger(Logger.GLOBAL_LOGGER_NAME);
  }

  // get return int number as return from given string
  public static int getIntString(String inputString) {
    int getVal = 0;
    try {
      String str = inputString.replaceAll("[^\\d.]+|\\.(?!\\d)", "");
      getVal = Integer.parseInt(str);
    } catch (NumberFormatException Ex) {
      LOGGER.log(Level.SEVERE, "Caught an exception while converting string:- " + inputString);
      LOGGER.log(Level.SEVERE, Ex.getMessage());
    }
    return getVal;
  }

  // get total count from showing result screen
  public int getTotalCnt(String inputString) {
    int getVal = 0;
    try {
      String str = inputString.substring(inputString.indexOf("of"));
      getVal = getIntString(str);
    } catch (NumberFormatException Ex) {
      LOGGER.log(Level.SEVERE, "Caught an exception on webElement getText:- " + inputString);
      LOGGER.log(Level.SEVERE, Ex.getMessage());
    }
    return getVal;
  }


}
