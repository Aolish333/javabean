package conna;

import doa.User;
import org.junit.Test;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Created by hp on 2017/3/21.
 */
public class UserPackageTest {
    @Test
    public void test() {
        UserPackage dao = new UserPackage();
        User user = new User();
        user.setUsername("456");
        user.setPassword("456456");
        user.setType("普通用户");
        System.out.printf(""+dao.InsertUser(user));
    }
    @Test
    public void test1() {
        User user;
        List<User> userList = new ArrayList<User>();
        UserPackage up = new UserPackage();
        userList = up.Inquire();
        Iterator<User> iterator = userList.iterator();
        while (iterator.hasNext()) {
            user = iterator.next();
           System.out.println (user.toString());
        }
    }
    @Test
    public void TestDelete(){
        UserPackage up = new UserPackage();
        User user = new User();
        user.setId("10");
        up.DeleteUser(user);
    }
    @Test
    public void TestDoLogin(){
        UserPackage up = new UserPackage();
        User user = new User();
        user.setUsername("123");
        user.setPassword("123456");
        user.setType("普通用户");
        System.out.println(up.DoLogin(user));
    }
    @Test
    public void Single(){
        User user = new User();
        user.setId("33");
        UserPackage userPackage = new UserPackage();
        User user1 = userPackage.SingQuire(user);
    }
}