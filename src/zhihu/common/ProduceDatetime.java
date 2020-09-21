package zhihu.common;

import java.text.SimpleDateFormat;
import java.util.*;

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

    public static List<String> Dates(int dey){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(new Date());
        List<String> strings = new ArrayList<>();
        for (int i = 1; i <= dey; i++) {
            calendar.add(calendar.DATE,-1);
            String date2= simpleDateFormat.format(calendar.getTime());
            System.out.println(date2);
            strings.add(date2);
        }
        return strings;
    }
}
