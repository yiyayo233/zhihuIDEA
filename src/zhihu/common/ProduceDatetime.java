package zhihu.common;

import java.text.SimpleDateFormat;
import java.util.Date;

public  class ProduceDatetime {
    public static String Datetime(){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateTime  = simpleDateFormat.format(new Date());
        System.err.println("Datetime: "+dateTime);
        return dateTime;
    }

    public static String Date(){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String dateTime  = simpleDateFormat.format(new Date());
        System.err.println("Date: "+dateTime);
        return dateTime;
    }
}
