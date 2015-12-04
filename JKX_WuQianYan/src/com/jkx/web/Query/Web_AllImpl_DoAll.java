package com.jkx.web.Query;

import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.jkx.web.ConnectionPool.Web_JdbcUtils;

public class Web_AllImpl_DoAll<E> {
	Connection conn = null;
	PreparedStatement st = null;
	Object object;
	Class<E> objclass;
	ResultSet rs = null;

	/*
	 * ------------构造方法----------- 该类构造方法有两个，如果需要传入对象，实例时用第一个，否则适用第二个
	 */
	@SuppressWarnings("unchecked")
	public Web_AllImpl_DoAll(Object obj) {
		this.object = obj;
		this.objclass = (Class<E>) obj.getClass();
		// System.out.println(objclass.toString());
	}

	public Web_AllImpl_DoAll() {
	}

	/*
	 * 新闻点击量加1
	 */
	public boolean ClickNumInsert(String clicknum, int id) {
		try {
			String ClickNum = String.valueOf(Integer.parseInt(clicknum) + 1);
			this.UpdateById("w_about_news", id, "newsClicks", ClickNum);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	/*
	 * -----------------Query------------------ 此处提供ID查询和所有字段查询
	 */
	public ArrayList<Object> QueryById(String TableName, int id)
			throws SQLException {
		ArrayList<Object> AlistTest = null;
		try {
			AlistTest = new ArrayList<Object>();
			String sql = "select * from " + TableName + " where id=" + id;
			conn = new Web_JdbcUtils().getConnection();
			st = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_UPDATABLE);
			st.executeQuery();
			rs = st.getResultSet();
			if (rs.next()) {
				rs.beforeFirst();
				System.out.println("已查询到内容！");
				while (rs.next()) {
					object = objclass.newInstance(); // 该代码必须写入while内部，否则，arraylist中
					// 始终插入的所以数据均为读出的最后一条。
					// 获得该类的所有属性
					Field[] fields = objclass.getDeclaredFields();
					int i = 1;
					for (Field field : fields) {
						PropertyDescriptor pd = new PropertyDescriptor(field
								.getName(), objclass);
						// 获得set方法
						Method set = pd.getWriteMethod();
						set.invoke(object, new Object[] { rs.getObject(i) });
						// //获得get方法
						// Method get = pd.getReadMethod();
						// Object getValue = get.invoke(obj, new Object[]{});
						// System.out.println("field:"+field.getName()+"---getValue:"+getValue);
						i++;
					}
					AlistTest.add(object);
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Web_JdbcUtils.release(conn, st, rs);
			System.out.println("所得集合容量:   " + AlistTest.size());
		}
		return AlistTest;
	}

	public ArrayList<Object> QueryAll(String TableName) {
		ArrayList<Object> AlistTest = null;
		try {
			AlistTest = new ArrayList<Object>();
			String sql = "select * from " + TableName;
			conn = new Web_JdbcUtils().getConnection();
			st = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_UPDATABLE);
			st.executeQuery();
			rs = st.getResultSet();
			if (rs.next()) {
				rs.beforeFirst();
				while (rs.next()) {
					object = objclass.newInstance();
					Field[] fields = objclass.getDeclaredFields();
					int i = 1;
					for (Field field : fields) {
						PropertyDescriptor pd = new PropertyDescriptor(field
								.getName(), objclass);
						Method set = pd.getWriteMethod();
						set.invoke(object, new Object[] { rs.getObject(i) });
						i++;
					}
					AlistTest.add(object);
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Web_JdbcUtils.release(conn, st, rs);
			System.out.println("所得集合容量:   " + AlistTest.size());
		}
		return AlistTest;
	}

	/*
	 * @param:dbCaseorTypeName为数据库相应字段名
	 * 
	 * @param:CaseorTypeName为传入相应的参数
	 */
	public ArrayList<Object> QueryByCaseorTypeName(String TableName,
			String dbCaseorTypeName, String CaseorTypeName) throws SQLException {
		ArrayList<Object> AlistTest = null;
		try {
			AlistTest = new ArrayList<Object>();
			String sql = "select * from " + TableName + " where "
					+ dbCaseorTypeName + "='" + CaseorTypeName + "'";
//			System.out.println("productName sql="+sql);
			conn = new Web_JdbcUtils().getConnection();
			st = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_UPDATABLE);
			st.executeQuery();
			rs = st.getResultSet();
			if (rs.next()) {
				rs.beforeFirst();
				System.out.println("已查询到内容！");
				while (rs.next()) {
					object = objclass.newInstance(); // 该代码必须写入while内部，否则，arraylist中
					// 始终插入的所以数据均为读出的最后一条。
					// 获得该类的所有属性
					Field[] fields = objclass.getDeclaredFields();
					int i = 1;
					for (Field field : fields) {
						PropertyDescriptor pd = new PropertyDescriptor(field
								.getName(), objclass);
						// 获得set方法
						Method set = pd.getWriteMethod();
						set.invoke(object, new Object[] { rs.getObject(i) });
						i++;
					}
					AlistTest.add(object);
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Web_JdbcUtils.release(conn, st, rs);
			System.out.println("所得集合容量:   " + AlistTest.size());
		}
		return AlistTest;
	}

	/*
	 * ---------Insert----------- 插入语句使用insert方法重载，有多少字段就使用多少参数的insert方法
	 * Insert方法前请先使用
	 */

	// --------CheackRename-------
	public boolean CheackRename(String TableName, String dbname, String name) {
		try {
			String sql = "select * from " + TableName + " where " + dbname
					+ "='" + name + "'";
			conn = new Web_JdbcUtils().getConnection();
			st = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_UPDATABLE);
			st.executeQuery();
			rs = st.getResultSet();
			if (rs.next()) {
				return false;
			} else {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return true;
		} finally {
			Web_JdbcUtils.release(conn, st, rs);
		}
	}

	// 1个参数：
	public int Insert(String TableName, String dbname1, String name1) {
		int i = 0;
		try {
			String sql = "insert into " + TableName + "(" + dbname1
					+ ") values('" + name1 + "')";
			conn = new Web_JdbcUtils().getConnection();
			st = conn.prepareStatement(sql);
			i = st.executeUpdate();
			System.out.println("已插入数据！");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Web_JdbcUtils.release(conn, st, rs);
		}
		return i;
	}

	// 2个参数：
	public int Insert(String TableName, String dbname1, String dbname2,
			String name1, String name2) {
		int i = 0;
		try {
			String sql = "insert into " + TableName + "(" + dbname1 + ","
					+ dbname2 + ") values('" + name1 + "','" + name2 + "')";
			conn = new Web_JdbcUtils().getConnection();
			st = conn.prepareStatement(sql);
			i = st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Web_JdbcUtils.release(conn, st, rs);
		}
		return i;
	}

	// 3个参数：
	public int Insert(String TableName, String dbname1, String dbname2,
			String dbname3, String name1, String name2, String name3) {
		int i = 0;
		try {
			String sql = "insert into " + TableName + "(" + dbname1 + ","
					+ dbname2 + "," + dbname3 + ") values('" + name1 + "','"
					+ name2 + "','" + name3 + "')";
			conn = new Web_JdbcUtils().getConnection();
			st = conn.prepareStatement(sql);
			i = st.executeUpdate();
			System.out.println("已插入数据！");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Web_JdbcUtils.release(conn, st, rs);
		}
		return i;
	}

	// 4个参数：
	public int Insert(String TableName, String dbname1, String dbname2,
			String dbname3, String dbname4, String name1, String name2,
			String name3, String name4) {
		int i = 0;
		try {
			String sql = "insert into " + TableName + "(" + dbname1 + ","
					+ dbname2 + "," + dbname3 + "," + dbname4 + ") values('"
					+ name1 + "','" + name2 + "','" + name3 + "','" + name4
					+ "')";
			conn = new Web_JdbcUtils().getConnection();
			st = conn.prepareStatement(sql);
			i = st.executeUpdate();
			System.out.println("已插入数据！");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Web_JdbcUtils.release(conn, st, rs);
		}
		return i;
	}

	// 5个参数：
	public int Insert(String TableName, String dbname1, String dbname2,
			String dbname3, String dbname4, String dbname5, String name1,
			String name2, String name3, String name4, String name5) {
		int i = 0;
		try {
			String sql = "insert into " + TableName + "(" + dbname1 + ","
					+ dbname2 + "," + dbname3 + "," + dbname4 + "," + dbname5
					+ ") values('" + name1 + "','" + name2 + "','" + name3
					+ "','" + name4 + "','" + name5 + "')";
			conn = new Web_JdbcUtils().getConnection();
			st = conn.prepareStatement(sql);
			i = st.executeUpdate();
			System.out.println("已插入数据！");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Web_JdbcUtils.release(conn, st, rs);
		}
		return i;
	}

	// 6个参数：
	public int Insert(String TableName, String dbname1, String dbname2,
			String dbname3, String dbname4, String dbname5, String dbname6,
			String name1, String name2, String name3, String name4,
			String name5, String name6) {
		int i = 0;
		try {
			String sql = "insert into " + TableName + "(" + dbname1 + ","
					+ dbname2 + "," + dbname3 + "," + dbname4 + "," + dbname5
					+ "," + dbname6 + ") values('" + name1 + "','" + name2
					+ "','" + name3 + "','" + name4 + "','" + name5 + "','"
					+ name6 + "')";
			conn = new Web_JdbcUtils().getConnection();
			st = conn.prepareStatement(sql);
			i = st.executeUpdate();
			System.out.println("已插入数据！");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Web_JdbcUtils.release(conn, st, rs);
		}
		return i;
	}

	// 7个参数：
	public int Insert(String TableName, String dbname1, String dbname2,
			String dbname3, String dbname4, String dbname5, String dbname6,
			String dbname7, String name1, String name2, String name3,
			String name4, String name5, String name6, String name7) {
		int i = 0;
		try {
			String sql = "insert into " + TableName + "(" + dbname1 + ","
					+ dbname2 + "," + dbname3 + "," + dbname4 + "," + dbname5
					+ "," + dbname6 + "," + dbname7 + ") values('" + name1
					+ "','" + name2 + "','" + name3 + "','" + name4 + "','"
					+ name5 + "','" + name6 + "','" + name7 + "')";
			conn = new Web_JdbcUtils().getConnection();
			st = conn.prepareStatement(sql);
			i = st.executeUpdate();
			System.out.println("已插入数据！");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Web_JdbcUtils.release(conn, st, rs);
		}
		return i;
	}

	// 8个参数：
	public int Insert(String TableName, String dbname1, String dbname2,
			String dbname3, String dbname4, String dbname5, String dbname6,
			String dbname7, String dbname8, String name1, String name2,
			String name3, String name4, String name5, String name6,
			String name7, String name8) {
		int i = 0;
		try {
			String sql = "insert into " + TableName + "(" + dbname1 + ","
					+ dbname2 + "," + dbname3 + "," + dbname4 + "," + dbname5
					+ "," + dbname6 + "," + dbname7 + "," + dbname8
					+ ") values('" + name1 + "','" + name2 + "','" + name3
					+ "','" + name4 + "','" + name5 + "','" + name6 + "','"
					+ name7 + "','" + name8 + "')";
			conn = new Web_JdbcUtils().getConnection();
			st = conn.prepareStatement(sql);
			i = st.executeUpdate();
			System.out.println("已插入数据！");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Web_JdbcUtils.release(conn, st, rs);
		}
		return i;
	}

	// 9个参数：
	public int Insert(String TableName, String dbname1, String dbname2,
			String dbname3, String dbname4, String dbname5, String dbname6,
			String dbname7, String dbname8, String dbname9, String name1,
			String name2, String name3, String name4, String name5,
			String name6, String name7, String name8, String name9) {
		int i = 0;
		try {
			String sql = "insert into " + TableName + "(" + dbname1 + ","
					+ dbname2 + "," + dbname3 + "," + dbname4 + "," + dbname5
					+ "," + dbname6 + "," + dbname7 + "," + dbname8 + ","
					+ dbname9 + ") values('" + name1 + "','" + name2 + "','"
					+ name3 + "','" + name4 + "','" + name5 + "','" + name6
					+ "','" + name7 + "','" + name8 + "','" + name9 + "')";
			conn = new Web_JdbcUtils().getConnection();
			st = conn.prepareStatement(sql);
			i = st.executeUpdate();
			System.out.println("已插入数据！");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Web_JdbcUtils.release(conn, st, rs);
		}
		return i;
	}

	// 10个参数：
	public int Insert(String TableName, String dbname1, String dbname2,
			String dbname3, String dbname4, String dbname5, String dbname6,
			String dbname7, String dbname8, String dbname9, String dbname10,
			String name1, String name2, String name3, String name4,
			String name5, String name6, String name7, String name8,
			String name9, String name10) {
		int i = 0;
		try {
			String sql = "insert into " + TableName + "(" + dbname1 + ","
					+ dbname2 + "," + dbname3 + "," + dbname4 + "," + dbname5
					+ "," + dbname6 + "," + dbname7 + "," + dbname8 + ","
					+ dbname9 + "," + dbname10 + ") values('" + name1 + "','"
					+ name2 + "','" + name3 + "','" + name4 + "','" + name5
					+ "','" + name6 + "','" + name7 + "','" + name8 + "','"
					+ name9 + "','" + name10 + "')";
			conn = new Web_JdbcUtils().getConnection();
			st = conn.prepareStatement(sql);
			i = st.executeUpdate();
			System.out.println("已插入数据！");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Web_JdbcUtils.release(conn, st, rs);
		}
		return i;
	}

	/*
	 * -------------Delete------------
	 * 
	 * @param:TableName为相应表名，删除操作适用于所有表。
	 */
	public int DeleteById(String TableName, int id) {
		int i = 0;
		try {
			String sql = "delete from " + TableName + " where id=" + id;
			conn = new Web_JdbcUtils().getConnection();
			st = conn.prepareStatement(sql);
			i = st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Web_JdbcUtils.release(conn, st, rs);
		}
		return i;
	}

	/*
	 * ----------------Update--------------
	 * 
	 * @param:dbname为数据相应字段，更新操作适用于所有表，但只能 一个字段，一个字段地更新，即 多次调用该方法即可更新多个字段
	 */
	public int UpdateById(String TableName, int id, String dbName, String name) {
		int i = 0;
		try {
			String sql = "update " + TableName + " set " + dbName + "='" + name
					+ "' where id=" + id;
			conn = new Web_JdbcUtils().getConnection();
			st = conn.prepareStatement(sql);
			i = st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Web_JdbcUtils.release(conn, st, rs);
		}
		return i;
	}
}
