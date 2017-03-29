package conna;

import doa.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by hp on 2017/3/15.
 */
public class UserPackage {

    public int InsertUser(User user) {
        int row = 0;
        String sql = "INSERT INTO users_l (user, password, type)  VALUES (?,?,?)";
        Conn conn = new Conn();
        PreparedStatement ps = null;
        Connection connection = null;
        try {
            connection = conn.getConn();
            ps = connection.prepareStatement(sql);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getType());
            row = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            CloseAll(connection, null, ps);
        }
        return row;
    }

    public int DeleteUser(User user) {
        int row = 0;
        String sql = "DELETE FROM users_l WHERE id= ?";
        Conn conn = new Conn();
        Connection connection = conn.getConn();
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, user.getId());

            row = ps.executeUpdate();
            System.out.printf("" + row);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            CloseAll(connection, null, ps);
        }
        return row;
    }

    public User SingQuire(User user) {
        String sql = "SELECT * FROM users_l WHERE id= ?";
        Conn conn = new Conn();
        Connection connection = conn.getConn();
        ResultSet rs = null;
        PreparedStatement ps = null;
        User ReUser = null;
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, user.getId());
            rs = ps.executeQuery();
            while (rs.next()) {
                ReUser = new User();
                ReUser.setUsername(rs.getString("user"));
                ReUser.setPassword(rs.getString("password"));
                ReUser.setType(rs.getString("type"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            CloseAll(connection, rs, ps);
        }
        return ReUser;
    }

    public List<User> Inquire() {
        Conn conn = new Conn();
        Connection connection = conn.getConn();
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<User> list = new ArrayList<>();
        User user;
        String sql_inquire = "SELECT * FROM users_l";
        try {
            ps = connection.prepareStatement(sql_inquire);
            rs = ps.executeQuery();
//            rs = ps.executeQuery(sql_inquire);
            while (rs.next()) {
                user = new User();
                user.setId(rs.getString("id"));
                user.setUsername(rs.getString("user"));
                user.setPassword(rs.getString("password"));
                user.setType(rs.getString("type"));
                list.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            CloseAll(connection, rs, ps);
        }
        return list;
    }

    public int Modify(User user) {
        String sql_add = "UPDATE test.users_l SET user = ?,password = ? WHERE id = ?";
        Conn conn = new Conn();
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection connection = null;
        int row = 0;
        try {
            connection = conn.getConn();
            ps = connection.prepareStatement(sql_add);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getId());
            row = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            CloseAll(connection, rs, ps);
        }
        return row;
    }

    public ResultSet DoLogin(User user) {
        String sql_select = "SELECT *FROM users_l WHERE user = ? AND password = ? AND type = ?";
        Conn conn = new Conn();
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection connection = null;
        try {
            connection = conn.getConn();
            ps = connection.prepareCall(sql_select);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getType());
            rs = ps.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            CloseAll(connection, rs, ps);
        }
        return rs;
    }

    /*
    * 关闭流
    * */

    public void CloseAll(Connection cn, ResultSet rs, PreparedStatement ps) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (ps != null) {
            try {
                ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (cn != null) {
            try {
                cn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }
}
