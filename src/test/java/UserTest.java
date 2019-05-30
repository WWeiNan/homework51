import com.baizhi.dao.UserDao;
import com.baizhi.entity.User;
import org.aspectj.weaver.ast.Var;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring.xml")
public class UserTest {
    @Autowired
    private UserDao userDao;
//    用户注册
    @Test
    public  void registTest(){
        userDao.regist(new User("李四111111","111","110","123@com","221@com","业务系统1","冻结"));
    }
//    用户登录测试
    @Test
    public void loginTest(){
        User user = userDao.userLogin("111111", "111111");
        System.out.println(user);
    }
//    查询总的用户数
    @Test
    public void findTotalCountTest(){
        Integer totalCount = userDao.findTotalCount();
        System.out.println(totalCount);
    }
//    分页查询所有用户
    @Test
    public void queryAllUser(){
        List<User> list = userDao.queryAllUser(0,5);
        for (User user : list) {
            System.out.println(user);
        }
    }
//    根据用户名删除用户
    @Test
    public  void  delUserTest(){
        userDao.delUser("张三");
    }
//    修改用户状态
    @Test
    public void changeUserStatusTest(){
        userDao.changeUserStatus("12345567","激活");
    }
    //根据用户名查询用户
    @Test
    public  void  selectByUsernameTest(){
        User user = userDao.selectByUsername("111111");
        System.out.println(user);
    }
//    修改用户信息
    @Test
    public void updateUserTest(){
        User user   = new User("44444444",null, "77", null, null, null,null);
        System.out.println(user);
        userDao.updateUser(user);
    }
//    模糊查询用户信息
    @Test
    public void findLikeUserTest(){
        List<User> list = userDao.findLikeUsername("1");
        for (User user : list) {
            System.out.println(user);
        }
    }
//    模糊查询分页
@Test
public void queryLikeTest(){
    List<User> list = userDao.queryLike(0,2,"1");
    for (User user : list) {
        System.out.println(user);
    }
}
}
