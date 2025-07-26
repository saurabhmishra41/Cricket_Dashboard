package utils;

import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;

public class AppUtil {
    public static boolean checkRecaptchaResponse(String gRecaptchaResponse) {
        String SECRET_KEY = "6LfGC44rAAAAAP6TEJRWGeAcFZvF-OU2U2UWBhXg";

        String reqURL = "https://www.google.com/recaptcha/api/siteverify?secret=" + SECRET_KEY + "&response="
                + gRecaptchaResponse;

        boolean flag = false;
        try {

            URL url = new URL(reqURL);

            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

            connection.setRequestMethod("POST");
            connection.setDoOutput(true);
            connection.connect();

            DataOutputStream dos = new DataOutputStream(connection.getOutputStream());

            dos.flush();
            dos.close();

            InputStream is = connection.getInputStream();

            JsonReader jr = Json.createReader(is);

            JsonObject jo = jr.readObject();

            jr.close();

            flag = jo.getBoolean("success");
        } catch (MalformedURLException | ProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return flag;

    }
}
