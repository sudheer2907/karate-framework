package main.java.com.karate.utils;

import java.util.logging.Logger;

import net.minidev.json.JSONArray;
import net.minidev.json.JSONObject;

public class IntegrationStatus {

  private final static Logger LOGGER = Logger.getLogger(IntegrationStatus.class.getName());

  public String getIntegrationStatus(String tool, JSONArray jsonArrayObj) {
    String status = "";
    JSONObject jsonObject;
    // Fetch the Integration Status
    for (int i = 0; i < jsonArrayObj.size(); ++i) {
      if (jsonArrayObj.get(i).toString().contains(tool)) {
        jsonObject = (JSONObject) jsonArrayObj.get(i);
        if (jsonObject.containsKey("status")) {
          status = (String) jsonObject.get("status");
        }
        break;
      }
    }
    if (status.equalsIgnoreCase("Completed") || status.equalsIgnoreCase("Failed")
        || status.equalsIgnoreCase("In Queue")) {
      status = "Integrated";
    } else {
      status = "NotIntegrated";
    }
    LOGGER.info(tool + " Integration status is " + status);
    return status;
  }

  public String getIntegrationUuid(String tool, JSONArray jsonArrayObj) {
    String integrationUuid = "";
    JSONObject jsonObject;
    // Fetch the Integration UUID
    for (int i = 0; i < jsonArrayObj.size(); ++i) {
      if (jsonArrayObj.get(i).toString().contains(tool)) {
        jsonObject = (JSONObject) jsonArrayObj.get(i);
        if (jsonObject.containsKey("integrationUuid")) {
          integrationUuid = (String) jsonObject.get("integrationUuid");
        }
        break;
      }
    }
    LOGGER.info(tool + " Integration Uuid is " + integrationUuid);
    return integrationUuid;
  }
}
