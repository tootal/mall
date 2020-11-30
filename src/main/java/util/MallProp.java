package util;

import java.io.*;
import java.util.Properties;

public class MallProp {
    private static final String prop_path = "mall.properties";
    public static Properties getProp() {
        Properties prop = new Properties();
        try {
            prop.load(MallProp.class.getClassLoader().getResourceAsStream(prop_path));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return prop;
    }
    public static String get(String key) {
        return getProp().getProperty(key);
    }
}
