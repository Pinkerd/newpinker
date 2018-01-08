package com.pinker.service;

import com.pinker.service.Impl.TopicServiceImpl;
import org.junit.jupiter.api.Test;

class TopicServiceTest {
    @Test
    void uploadTopic() {
        TopicService topicService= new TopicServiceImpl();

        topicService.uploadTopic(123345,"test","testcontent",9);

    }

}