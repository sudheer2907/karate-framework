package test.runners;

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

public class TestRun {

  Results results;
  String threadCount = System.getenv("threadCount");

  /**
   * Run any particular test case with tags and feature file name.
   */
  @Test
  public void runMultipleFeatureFiles() {
    if (threadCount == null) {
      threadCount = "0";
    }
    results = Runner.builder().outputCucumberJson(true).path("classpath:features").tags("@Mytestcase")
        .parallel(Integer.valueOf(threadCount));
    generateReport(results.getReportDir());
    Assertions.assertEquals(0, results.getFailCount());
  }

  /**
   * Generate test case execution report post-execution.
   *
   * @param karateOutputPath - directory where you want to keep a report of test case executions.
   */
  public static void generateReport(String karateOutputPath) {
    Collection<File> jsonFiles =
        FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
    List<String> jsonPaths = new ArrayList<String>(jsonFiles.size());
    jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
    Configuration config = new Configuration(new File("target"), "Automation Execution Report");
    ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
    reportBuilder.generateReports();
  }
}
