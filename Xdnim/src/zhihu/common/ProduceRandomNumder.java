package zhihu.common;

public class ProduceRandomNumder {
	public static String randomNumder(String type,int places) {
		String num = "";
		for (int i = 0; i < places; i++) {
			num = num + "9";
		}
		int numred = (int)(Math.random()*Integer.valueOf(num));
		return type+String.valueOf(numred);
	}

	public String randomNumder(int places) {
		String num = "";
		for (int i = 0; i < places; i++) {
			num = num + "9";
		}
		int numred = (int)(Math.random()*Integer.valueOf(num));
		return String.valueOf(numred);
	}
}
