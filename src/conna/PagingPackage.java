package conna;

import doa.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by hp on 2017/3/28.
 */
public class PagingPackage extends UserPackage{
    /*
    * 计算记录总数
    * 实现分页功能
    * */
    public int CountsAll() {
        String sql_counts = "SELECT COUNT(*) FROM test.users_l;";
        Conn conn = new Conn();
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection connection = null;
        int row = 0;
        try {
            connection = conn.getConn();
            ps = connection.prepareCall(sql_counts);
            rs = ps.executeQuery();
            while (rs.next()) {
                row = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            CloseAll(connection, rs, ps);
        }
        return row;
    }

    /*
    * 提取每页数据*/
    public List<User> PartUser(int page) {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM test.users_l LIMIT ?,?;";
        Conn conn = new Conn();
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection connection = null;
        try {
            connection = conn.getConn();
            ps = connection.prepareCall(sql);
            ps.setInt(1, (page - 1) * User.PAGES_PER);
            ps.setInt(2, User.PAGES_PER);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
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
}
