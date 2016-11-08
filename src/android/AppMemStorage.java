package org.apache.cordova.appmemstorage;

import java.util.HashMap;

import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class AppMemStorage extends CordovaPlugin {
    // use ConcurrentHashMap for background threading
    private static HashMap<String, String> dict = new HashMap<String, String>();

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        if (action.equals("get")) {
            this.get(args.getString(0), callbackContext);
            return true;
        } else if (action.equals("set")) {
            this.set(args.getString(0), args.getString(1), callbackContext);
            return true;
        } else if (action.equals("remove")) {
            this.remove(args.getString(0), callbackContext);
            return true;
        } else if (action.equals("all")) {
            this.all(callbackContext);
            return true;
        } else if (action.equals("count")) {
            this.count(callbackContext);
            return true;
        } else if (action.equals("keys")) {
            this.keys(callbackContext);
            return true;
        } else if (action.equals("clear")) {
            this.clear(callbackContext);
            return true;
        }
        return false;
    }

    private void get(String key, CallbackContext callbackContext) {
        if (key == null) {
            callbackContext.error("key is required");
        } else {
            callbackContext.success(dict.get(key));
        }
    }

    private void set(String key, String value, CallbackContext callbackContext) {
        if (key == null) {
            callbackContext.error("key is required");
        } else if (value == null) {
            callbackContext.error("value is required");
        } else {
            dict.put(key, value);
            callbackContext.success();
        }
    }

    private void remove(String key, CallbackContext callbackContext) {
        if (key == null) {
            callbackContext.error("key is required");
        } else {
            dict.remove(key);
            callbackContext.success();
        }
    }

    private void all(CallbackContext callbackContext) {
        callbackContext.success(new JSONObject(dict));
    }

    private void count(CallbackContext callbackContext) {
        callbackContext.success(dict.size());
    }

    private void keys(CallbackContext callbackContext) {
        callbackContext.success(new JSONArray(dict.keySet()));
    }

    private void clear(CallbackContext callbackContext) {
        dict.clear();
        callbackContext.success();
    }
}
