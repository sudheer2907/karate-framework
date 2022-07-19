package com.karate.utils;

import java.util.logging.Logger;

import net.minidev.json.JSONArray;
import net.minidev.json.JSONObject;

public class MasterDataTable {

  private final static Logger LOGGER = Logger.getLogger(MasterDataTable.class.getName());

  public String getMasterDataTablesEntryUUID(String name, JSONArray jsonArrayObj) {

    String masterDataTablesEntryUUID = "";

    JSONObject jsonObject;

    // Fetch the Integration UUID

    for (int i = 0; i < jsonArrayObj.size(); ++i) {

      if (jsonArrayObj.get(i).toString().contains(name)) {

        jsonObject = (JSONObject) jsonArrayObj.get(i);

        if (jsonObject.containsKey("uuid")) {

          masterDataTablesEntryUUID = (String) jsonObject.get("uuid");
        }

        break;
      }
    }

    LOGGER.info(name + " Entry Uuid is " + masterDataTablesEntryUUID);

    return masterDataTablesEntryUUID;
  }
}
