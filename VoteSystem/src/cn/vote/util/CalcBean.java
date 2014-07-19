package cn.vote.util;

public class CalcBean {
	private int num1;
	 private int num2;
	 
	 public void setNum1(int num1) {
	  this.num1 = num1;
	 }
	 public void setNum2(int num2) {
	  this.num2 = num2;
	 }
	 
	 public double getPercentResult() {
	  double result = (double)num1/(double)num2;
	  result =(double)Math.round(result*10000)/100;
	  return result;
	 }
}
