package Util;

public class StringUtil {
    public static boolean isEmpty(String string){
        if(string == null || "".equals(string)) return true;
        return false;
    }
}
