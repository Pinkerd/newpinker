import com.pinker.dao.BlogDao;
import com.pinker.dao.impl.BlogDaoImpl;
import com.pinker.entity.Blog;
import org.junit.jupiter.api.Test;

import java.util.List;

/**
 * 博文内容的测试类
 */
public class BlogTest {
    private BlogDao blog=new BlogDaoImpl();

    @Test
    public void findUser(){

        List<Blog> list = blog.findUser(6);
        System.out.println(list.toString());

    }
}
