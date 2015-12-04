package com.jkx.web.ConnectionPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.junit.Test;

public class Web_JdbcTest {

	@Test
	public void dbcpDataSourceTest() {
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			// 获取连接
			conn = new Web_JdbcUtils().getConnection();
			String sql = "insert into test(name) values(?)";
			st = conn.prepareStatement(sql);
			st.setString(1, "冉椿林");
			st.executeUpdate();
			// 获取插入数据自动生成的主键
			rs = st.getGeneratedKeys();
			if (rs.next()) {

				System.out.println("已插入第" + rs.getInt(0) + "条数据！");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 关闭连接
			Web_JdbcUtils.release(conn, st, rs);
		}
	}
}