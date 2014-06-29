package vote.system.generate;

import java.util.Random;

/**
 * 生成验证ID，与投票用户匹配
 * @author ZhongJie
 *
 */
public class Generate {
	
	/*验证ID生成，长度在10-15位之间*/
	public static String getRandomString(){
		String base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";//生成字符串从此序列中取
	    Random random = new Random();   
	    StringBuffer sb = new StringBuffer();
	    int length = getLength(10, 15);
	    System.out.println(length);
	    for (int i = 0; i < length; i++) {   
	        int number = random.nextInt(base.length());   
	        sb.append(base.charAt(number));   
	    }   
	    return sb.toString();
	}
	
	/*[min,max]区间数字*/
	public static int getLength(int min,int max){
		Random random = new Random();
        int length = random.nextInt(max)%(max-min+1) + min;
        return length;
	}
	
	public static void main(String[] args){
		System.out.println(getRandomString());
	}
}
