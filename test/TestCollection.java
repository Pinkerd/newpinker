import com.pinker.dao.CollectionBlogDao;
import com.pinker.dao.impl.CollectionBlogDaoImpl;
import com.pinker.entity.CollectionBlog;
import org.junit.jupiter.api.Test;

import java.util.List;

public class TestCollection {
    private CollectionBlogDao coo=new CollectionBlogDaoImpl();

    @Test
    public void collection(){

        List<CollectionBlog> list = coo.findAllByUerId(6);
        System.out.println(list);
    }
}
