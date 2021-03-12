package com.oneframe.runners;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

class UITestRunner {

  @Test
  public void testFeatures() {
    System.setProperty("karate.env", "qa");
    Results results =
        Runner.path("classpath:features/uitests/testFeatures/TestSeleniumEasyInputForms.feature")
            .parallel(2);
    Assertions.assertEquals(0, results.getFailCount());
  }

  /**
   * Generate test case execution report post execution.
   *
   * @param karateOutputPath - directory where you want to keep report of test case executions.
   * @author sudheer.singh
   */
  private static void generateReport(String karateOutputPath) {
    Collection<File> jsonFiles =
        FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
    List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
    jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
    Configuration config = new Configuration(new File("target"), "demo");
    ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
    reportBuilder.generateReports();
  }
}
