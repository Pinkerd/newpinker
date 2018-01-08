import com.pinker.dao.TopicDao;
import com.pinker.dao.impl.TopicDaoImpl;
import org.junit.jupiter.api.Test;

public class TestTopic {


    private TopicDao top=new TopicDaoImpl();
    @Test
    public void topic(){

        int add = top.add("生活的往事", "生活即往事", "null", 1);
        System.out.println(1);
    }
}
