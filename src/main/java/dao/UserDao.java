package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import entities.User;
import entities.admin;
import tools.DBconnection;

public class UserDao {
	
	
	private static final String INSERT_USERS_SQL = "INSERT INTO users " + " (nom, prenom, email, telephone, password) VALUES  " + "(?, ?, ?, ?, ?);";
	private static final String SELECT_USER_BY_ID = "select idUser, nom, prenom, email, telephone, password from users where idUser =?";
	private static final String SELECT_ALL_USERS = "select * from users";
	private static final String DELETE_USERS_SQL = "delete from users where idUser = ?";
	private static final String UPDATE_USERS_SQL = "update users set nom = ?, prenom = ?, email = ?, telephone = ?, password = ? where idUser = ?";
	public UserDao() {
	
	}
	
	// insert user
	public int insertUser(User user) throws SQLException
	{	int res =0;
		System.out.println(INSERT_USERS_SQL);
		
		try(Connection con = DBconnection.connect();
				PreparedStatement preparedStatement = con.prepareStatement(INSERT_USERS_SQL)) {
			preparedStatement.setString(1, user.getNom());
			preparedStatement.setString(2, user.getPrenom());
			preparedStatement.setString(3, user.getEmail());
			preparedStatement.setString(4, user.getTelephone());
			preparedStatement.setString(5, user.getPassword());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
			
			res = 1;
			
		} catch (SQLException e) {
			printSQLException(e);
			res = -1;
		}
		
		return res;
	}
	
	// select user by id 
	public User selectUser(int idUser) throws SQLException
	{
		User user = null;
		try(Connection con = DBconnection.connect();
				PreparedStatement preparedStatement = con.prepareStatement(SELECT_USER_BY_ID)) {
			
			preparedStatement.setInt(1, idUser);
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next())
			{
				String nom = rs.getString("nom");
				String prenom = rs.getString("prenom");
				String email = rs.getString("email");
				String telephone = rs.getString("telephone");
				String password = rs.getString("password");
				user = new User(idUser, nom, prenom, email, telephone, password);
			}
			
		} catch (SQLException e) {
			printSQLException(e);
		}
		return user;
		
	}
	
	// select all users 
	public List<User> selectAllUsers() throws SQLException
	{
		List<User> users = new ArrayList<>();
		try(Connection con = DBconnection.connect();
				PreparedStatement preparedStatement = con.prepareStatement(SELECT_ALL_USERS)) {
			
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next())
			{
				int idUser = rs.getInt("idUser");
				String nom = rs.getString("nom");
				String prenom = rs.getString("prenom");
				String email = rs.getString("email");
				String telephone = rs.getString("telephone");
				String password = rs.getString("password");
				users.add(new User(idUser, nom, prenom, email, telephone, password));
			}
			
			
			
		} catch (SQLException e) {
			printSQLException(e);
		}
		return users;
	}
	
	// update user
	public int updateUser(User user) throws SQLException
	{
		int rowUpdated = 0;
		try(Connection con = DBconnection.connect();
				PreparedStatement statement = con.prepareStatement(UPDATE_USERS_SQL)) {
			System.out.println("update User :"+statement);
			statement.setString(1, user.getNom());
			statement.setString(2, user.getPrenom());
			statement.setString(3, user.getEmail());
			statement.setString(4, user.getTelephone());
			statement.setString(5, user.getPassword());
			statement.setInt(5, user.getIdUser());
			
			rowUpdated = statement.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			rowUpdated = -1;
		}

		
		return rowUpdated;
		
	}
	
	// delete user
	public int deleteUser(int idUser) throws SQLException
	{
		int rowDeleted = 0;
		try(Connection con = DBconnection.connect();
				PreparedStatement statement = con.prepareStatement(DELETE_USERS_SQL)) {
			statement.setInt(1, idUser);
			rowDeleted = statement.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			rowDeleted = -1;
		}
		
		return rowDeleted;
	}
	
	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}
	
	
	
public User userLogin(String email, String password) {
		
		User u = new User();
		
		try {
			Connection con = DBconnection.connect();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from users where email = '"+email+"' and password = '"+password+"'");
			
			
			if(rs.next()) {
				
				u.setIdUser(rs.getInt(1));
				u.setNom(rs.getString(2));
				u.setPrenom(rs.getString(3));
				u.setEmail(rs.getString(4));
				u.setTelephone(rs.getString(5));
				u.setPassword(rs.getString(6));
			}else {
				
				u = null;
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return u;
		
		
	}

}
