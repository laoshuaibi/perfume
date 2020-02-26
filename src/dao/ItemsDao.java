package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import entity.Items;
import util.DBHelper;

public class ItemsDao {
	public static ArrayList<Items> getAllItems(){
		Connection  conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<Items> list = new ArrayList<Items>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from perfume;";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				Items item = new Items();
				item.setBrand(rs.getString("Brand"));
				item.setDesc(rs.getString("Desc"));
				item.setEngname(rs.getString("Engname"));
				item.setId(rs.getInt("Id"));
				item.setName(rs.getString("Name"));
				item.setPhoto(rs.getString("Photo"));
				item.setPrice(rs.getDouble("Price"));
				item.setStock(rs.getInt("Stock"));
				list.add(item);
			}
			return list;
		}
		catch(Exception e){
			e.printStackTrace();
			return null;
		}
		finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception e3) {
					e3.printStackTrace();
				}
			}
		}
	}
	public static Items getItemsById(int id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "select *from perfume where id=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			if (rs.next()) {
				Items item = new Items();
				item.setBrand(rs.getString("Brand"));
				item.setDesc(rs.getString("Desc"));
				item.setEngname(rs.getString("Engname"));
				item.setId(rs.getInt("Id"));
				item.setName(rs.getString("Name"));
				item.setPhoto(rs.getString("Photo"));
				item.setPrice(rs.getDouble("Price"));
				item.setStock(rs.getInt("Stock"));
				return item;
			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception e3) {
					e3.printStackTrace();
				}
			}
		}
	}
}
