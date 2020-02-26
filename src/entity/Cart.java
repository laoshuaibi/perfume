package entity;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class Cart {
	private HashMap<Items, Integer> goods;
	private double totalPrice;
	private int num;
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public Cart() {
		goods = new HashMap<Items, Integer>();
		totalPrice = 0.0;
	}
	
	public HashMap<Items, Integer> getGoods() {
		return goods;
	}
	public void setGoods(HashMap<Items, Integer> goods) {
		this.goods = goods;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public boolean addGoodsInCart(Items item , int num) {
		if(goods.containsKey(item)) {
			goods.put(item, goods.get(item)+num);
		}
		else {
			goods.put(item, num);
		}
		calTotalPrice();
		calTotalNum();
		return true;
	}
	public boolean removeGoodsFromCart(Items item) {
		goods.remove(item);
		calTotalPrice();
		calTotalNum();
		return true;
	}
	public double calTotalPrice() {
		double sum = 0.0;
		Set<Items> keys = goods.keySet();
		Iterator<Items> it = keys.iterator();
		while(it.hasNext()) {
			Items i = it.next();
			sum += i.getPrice() * goods.get(i);
		}
		this.setTotalPrice(sum);
		return getTotalPrice();
	}
	public int calTotalNum() {
		int num=0;
		Set<Items> keys = goods.keySet();
		Iterator<Items> it = keys.iterator();
		while(it.hasNext()) {
			Items i = it.next();
			num += goods.get(i);
		}
		this.setNum(num);
		return getNum();
	}
	
}
