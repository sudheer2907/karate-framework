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

public final class APIRunner {

  /**
   * Constructor is private, it is just to limit object creation and to make this runner class
   * immutable.
   */
  private APIRunner() {}

  /**
   * Use this method if you want to execute any specific feature file.
   */
  public void runOneFeatureFile() {
    System.setProperty("karate.env", "qa");
    Results results = Runner.path("classpath:features/apitests/testFeatures/TestReqResPost.feature")
        .tags("~@Ignore").parallel(2);
    Assertions.assertEquals(0, results.getFailCount());
    generateReport(results.getReportDir());
  }

  /**
   * Use this method if you want to execute entire feature files available inside apitests folder.
   */
  @Test
  public void runMultipleFeatureFiles() {
    System.setProperty("karate.env", "qa");
    Results results = Runner.builder().outputCucumberJson(true)
        .path("classpath:features/apitests/testFeatures").tags("~@Ignore").parallel(2);
    Assertions.assertEquals(0, results.getFailCount());
    generateReport(results.getReportDir());
  }

  /**
   * Generate test case execution report post execution.
   *
   * @param karateOutputPath - directory where you want to keep report of test case executions.
   * @author sudheer.singh
   */
  public static void generateReport(String karateOutputPath) {
    Collection<File> jsonFiles =
        FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
    List<String> jsonPaths = new ArrayList<String>(jsonFiles.size());
    jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
    Configuration config = new Configuration(new File("target"), "ReqRes.in SampleAPI Testing");
    ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
    reportBuilder.generateReports();
  }
}
