import com.pinker.dao.FriendDao;
import com.pinker.service.FriendService;
import com.pinker.service.Impl.FriendServiceImpl;
import com.pinker.service.Impl.UserServiceImpl;
import com.pinker.service.ThirdPartyService;
import com.pinker.service.UserService;
import com.pinker.util.IDUtil;
import com.pinker.util.JDBCUtils;
import org.junit.jupiter.api.Test;

import java.sql.Connection;

public class WTYTest {

    @Test
    public void testConn(){
        Connection conn=JDBCUtils.getConnection();
        System.out.println(conn);
    }

    @Test
    public void friendTest(){
        FriendService friendService=new FriendServiceImpl();
        FriendDao friendDao;

    }

    @Test
    public void testTiemId(){

        System.out.println(IDUtil.createID());
    }


    @Test
    public void testThird(){
        UserService userService= new UserServiceImpl();
        userService.addThirdUser(4501318,"9936402","asdasdasd","123123123");


    }
}
