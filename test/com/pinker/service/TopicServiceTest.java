package com.pinker.service;

import com.pinker.service.serviceimpl.TopicServiceImpl;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class TopicServiceTest {
    @Test
    void uploadTopic() {
        TopicService topicService= new TopicServiceImpl();

        topicService.uploadTopic(123345,"test","testcontent",9);

    }

}