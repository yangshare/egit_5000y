package com.jkx.web.ConnectionPool;

import java.io.InputStream;
import java.io.PrintWriter;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLFeatureNotSupportedException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.Properties;
import java.util.logging.Logger;

import javax.sql.DataSource;

/**
 * @ClassName: JdbcPool
 * @Description:编写数据库连接池
 */
public class Web_JdbcUtils implements DataSource {

	/**
	 * @Field: listConnections 使用LinkedList集合来存放数据库链接，
	 *         由于要频繁读写List集合，所以这里使用LinkedList存储数据库连接比较合适
	 */
	private static LinkedList<Connection> listConnections = new LinkedList<Connection>();

	static {
		/*
		 * 在静态代码块(static)中加载db.properties数据库配置文件,此时，为何不采用构造器？
		 * 因为，在调用类中，如果调用本类不是静态的一些方法，则需要实例化本类才能调用，此时就会执行一次
		 * 构造器初始化操作，多次调用则会多次执行构造器初始化操作，而此处，很明显，每调用一次则会在连接池
		 * 中多加入10个连接。而静态代码块可以保证，就算多次实例化本类，也只执行一次代码块内容。
		 */

		InputStream in = Web_JdbcUtils.class.getClassLoader()
				.getResourceAsStream("db.properties");
		Properties prop = new Properties();
		try {
			prop.load(in);
			String driver = prop.getProperty("driverClassName");
			String url = prop.getProperty("url");
			String username = prop.getProperty("username");
			String password = prop.getProperty("password");
			// String unicode = prop.getProperty("connectionProperties");
			// 数据库连接池的初始化连接数大小
			int jdbcPoolInitSize = Integer.parseInt(prop
					.getProperty("initialSize"));
			// 加载数据库驱动
			Class.forName(driver);
			for (int i = 0; i < jdbcPoolInitSize; i++) {
				Connection conn = DriverManager.getConnection(url, username,
						password);// + "?" + unicode
				// System.out.println("获取到了链接" + conn);
				// 将获取到的数据库连接加入到listConnections集合中，listConnections集合此时就是一个存放了数据库连接的连接池
				listConnections.add(conn);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	public PrintWriter getLogWriter() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	public void setLogWriter(PrintWriter out) throws SQLException {
		// TODO Auto-generated method stub

	}

	public void setLoginTimeout(int seconds) throws SQLException {
		// TODO Auto-generated method stub

	}

	public int getLoginTimeout() throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	public <T> T unwrap(Class<T> iface) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	public boolean isWrapperFor(Class<?> iface) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	/*
	 * 获取数据库连接 Connection.getInterfaces() 与 new Class[]{Connection.class}
	 * 2个使用方式的原因： Connection.getInterfaces() 与数据库驱动有关，数据库驱动不同
	 * Connection.getInterfaces() 的结果也就不同；Connection.getInterfaces() 返回的是
	 * Class[] 数组，此数组的第一个元素必
	 * 须是Connection才能把创建的代理类转为Connection对象，否则就会报：java.lang.ClassCastException
	 */
	public Connection getConnection() throws SQLException {
		// 如果数据库连接池中的连接对象的个数大于0
		if (listConnections.size() > 0) {
			// 从listConnections集合中获取一个数据库连接
			final Connection conn = listConnections.removeFirst();
			// System.out.println("取出一个连接后连接池大小为" + listConnections.size());
			// 返回Connection对象的代理对象
			return (Connection) Proxy.newProxyInstance(Web_JdbcUtils.class
					.getClassLoader(), new Class[] { Connection.class },// conn.getClass().getInterfaces()
					new InvocationHandler() {
						public Object invoke(Object proxy, Method method,
								Object[] args) throws Throwable {
							if (!method.getName().equals("close")) {
								return method.invoke(conn, args);
							} else {
								// 如果调用的是Connection对象的close方法，就把conn还给数据库连接池
								listConnections.add(conn);
								//System.out.println("已将" + conn + "还给数据库连接池！");
								System.out.println("数据库连接池容量为"
										+ listConnections.size());
								return null;
							}
						}
					});
		} else {
			throw new RuntimeException("对不起，数据库忙");
		}
	}

	public Connection getConnection(String username, String password)
			throws SQLException {
		return null;
	}

	/**
	 * @Method: release
	 * @Description: 释放资源，
	 *               释放的资源包括Connection数据库连接对象，负责执行SQL命令的Statement对象，存储查询结果的ResultSet对象
	 * @param conn
	 * @param st
	 * @param rs
	 */
	public static void release(Connection conn, Statement st, ResultSet rs) {
		if (rs != null) {
			try {
				// 关闭存储查询结果的ResultSet对象
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			rs = null;
		}
		if (st != null) {
			try {
				// 关闭负责执行SQL命令的Statement对象
				st.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (conn != null) {
			try {
				// 将Connection连接对象还给数据库连接池
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public Logger getParentLogger() throws SQLFeatureNotSupportedException {
		// TODO Auto-generated method stub
		return null;
	}
}