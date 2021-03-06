package dao;

import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.xml.bind.DatatypeConverter;

import model.User;

public class UserDao {

	public User findByLoginInfo(String loginId, String password) {
		Connection conn = null;
		try {
			// データベースへ接続
			conn = DBManager.getConnection();

			// TODO

			String sql = "select * from user where login_id = ? and password =?";

			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, loginId);
			password = changePassword(password);
			pStmt.setString(2, password);

			ResultSet rs = pStmt.executeQuery();

			if (!rs.next()) {
				return null;
			}

			String loginIdData = rs.getString("login_id");
			String nameData = rs.getString("name");
			User user = new User();
			user.setLoginId(loginIdData);
			user.setName(nameData);
			return user;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// データベース切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		return null;
	}

	public List<User> findAll() {
		Connection conn = null;
		List<User> userList = new ArrayList<User>();
		try {
			// データベースへ接続
			conn = DBManager.getConnection();
			// TODO

			String sql = "select * from user where id != 1";

			Statement stmt = conn.createStatement();

			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				String id = rs.getString("id");
				String loginId = rs.getString("login_id");
				String name = rs.getString("name");
				Date birthDate = rs.getDate("birth_date");
				String password = rs.getString("password");
				String createDate = rs.getString("create_date");
				String updateDate = rs.getString("update_date");
				User user = new User(id, loginId, name, birthDate, password, createDate, updateDate);

				userList.add(user);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// データベース切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return userList;

	}

	public int insertUserInfo(String loginId, String password, String name, String birthDate) {
		Connection conn = null;
		int rs = 0;
		try {
			// データベースへ接続
			conn = DBManager.getConnection();

			// TODO
			String sql = "insert into user(login_id,password,name,birth_date,create_date,update_date)values(?,?,?,?,now(),now())";

			PreparedStatement pStmt = conn.prepareStatement(sql);

			pStmt.setString(1, loginId);
			password = changePassword(password);
			pStmt.setString(2, password);
			pStmt.setString(3, name);
			pStmt.setString(4, birthDate);

			rs = pStmt.executeUpdate();
			//追加されたデータの数が戻り値として返ってくる

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// データベース切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return rs;

	}

	public User findUserInfo(String id) {

		Connection conn = null;
		User user = new User();

		try {
			// データベースへ接続
			conn = DBManager.getConnection();

			String sql = "select * from user where id = ?";

			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, id);

			ResultSet rs = pStmt.executeQuery();

			if (!rs.next()) {
				return null;
			}

			String idData = rs.getString("id");
			String loginId = rs.getString("login_id");
			String name = rs.getString("name");
			Date birthDate = rs.getDate("birth_date");
			String password = rs.getString("password");
			String createDate = rs.getString("create_date");
			String updateDate = rs.getString("update_date");
			user = new User(idData, loginId, name, birthDate, password, createDate, updateDate);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// データベース切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return user;

	}

	public int UpdateUserInfo(String password, String name, String birthDate, String id) {
		Connection conn = null;
		int rs = 0;
		try {
			// データベースへ接続
			conn = DBManager.getConnection();

			// TODO
			String sql = "update user set password = ?, name = ?, birth_date = ?, update_date = now() where id = ?";

			PreparedStatement pStmt = conn.prepareStatement(sql);

			password = changePassword(password);
			pStmt.setString(1, password);
			pStmt.setString(2, name);
			pStmt.setString(3, birthDate);
			pStmt.setString(4, id);

			rs = pStmt.executeUpdate();
			//更新されたデータの数が戻り値として返ってくる

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// データベース切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return rs;

	}

	public int updateExceptPassword(String name, String birthDate, String id) {
		Connection conn = null;
		int rs = 0;
		try {
			// データベースへ接続
			conn = DBManager.getConnection();

			// TODO
			String sql = "update user set name = ?, birth_date = ?, update_date = now() where id = ?";

			PreparedStatement pStmt = conn.prepareStatement(sql);

			pStmt.setString(1, name);
			pStmt.setString(2, birthDate);
			pStmt.setString(3, id);

			rs = pStmt.executeUpdate();
			//更新されたデータの数が戻り値として返ってくる

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// データベース切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return rs;

	}

	public int deleteUserInfo(String id) {
		Connection conn = null;
		int rs = 0;
		try {
			// データベースへ接続
			conn = DBManager.getConnection();

			// TODO

			String sql = "delete from user where id = ?";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			pStmt.setString(1, id);

			rs = pStmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// データベース切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return rs;

	}

	public String changePassword(String password) {

		//ハッシュを生成したい元の文字列
		String source = password;

		//ハッシュ生成前にバイト配列に置き換える際のCharset
		Charset charset = StandardCharsets.UTF_8;
		//ハッシュアルゴリズム
		String algorithm = "MD5";

		//ハッシュ生成処理
		byte[] bytes = null;
		try {
			bytes = MessageDigest.getInstance(algorithm).digest(source.getBytes(charset));
		} catch (NoSuchAlgorithmException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
		String result = DatatypeConverter.printHexBinary(bytes);
		//標準出力
		System.out.println(result);

		return result;

	}


	public List<User> searchUserInfo(String loginId, String name,String startDate,String endDate) {
		Connection conn = null;
		List<User> userList = new ArrayList<User>();
		try {
			// データベースへ接続
			conn = DBManager.getConnection();

			// TODO


			String sql = "select * from user where id != 1";

			if(!loginId.equals("")) {
				sql += " AND login_id = '" + loginId + "'";
			}

			if(!name.equals("")) {
				sql += " AND name like '%" + name + "%'";
			}

			if(!startDate.equals("")) {
				sql += " AND birth_date >= '" + startDate + "'";
			}

			if(!endDate.equals("")) {
				sql += " AND birth_date <= '" + endDate + "'";
			}



			Statement stmt = conn.createStatement();

			ResultSet rs = stmt.executeQuery(sql);


			while (rs.next()) {
				String id = rs.getString("id");
				String loginIdData = rs.getString("login_id");
				String nameData = rs.getString("name");
				Date birthDate = rs.getDate("birth_date");
				String password = rs.getString("password");
				String createDate = rs.getString("create_date");
				String updateDate = rs.getString("update_date");
				User user = new User(id, loginIdData, nameData, birthDate, password, createDate, updateDate);

				userList.add(user);

			}


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// データベース切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		return userList;
	}


}