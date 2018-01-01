import com.pinker.dao.FriendDao;
import com.pinker.service.FriendService;
import com.pinker.service.Impl.FriendServiceImpl;
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
}
