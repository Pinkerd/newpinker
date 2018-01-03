package com.pinker.entity;

import java.util.Date;

/**
 * 关注的话题
 */
public class ConcernTopic {
    //用户Id
    private int uesrId;
    //话题Id
    private int topicId;
    //关注话题时间
    private Date concernTime;

    public ConcernTopic() {
    }

    public ConcernTopic(int uesrId, int topicId, Date concernTime) {
        this.uesrId = uesrId;
        this.topicId = topicId;
        this.concernTime = concernTime;
    }

    public int getUesrId() { return uesrId; }

    public void setUesrId(int uesrId) {
        this.uesrId = uesrId;
    }

    public int getTopicId() {
        return topicId;
    }

    public void setTopicId(int topicId) {
        this.topicId = topicId;
    }

    public Date getConcernTime() {
        return concernTime;
    }

    public void setConcernTime(Date concernTime) {
        this.concernTime = concernTime;
    }

    @Override
    public String toString() {
        return "ConcernTopic{" +
                "uesrId=" + uesrId +
                ", topicId=" + topicId +
                ", concernTime=" + concernTime +
                '}';
    }
}
