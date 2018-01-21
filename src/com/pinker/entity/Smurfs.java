package com.pinker.entity;

public class Smurfs {
    private String username;

    private String nickname;

    private final String SOURCESITE="Smurfs";

    @Override
    public String toString() {
        return "Smurfs{" +
                "username='" + username + '\'' +
                ", nickname='" + nickname + '\'' +
                ", OURCESITE='" + SOURCESITE + '\'' +
                '}';
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getSOURCESITE() {
        return SOURCESITE;
    }

    public Smurfs(String username, String nickname) {

        this.username = username;
        this.nickname = nickname;
    }
}
