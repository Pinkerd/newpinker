package com.pinker.entity;

public class Corner {
    private final String SOURCESITE="corner";
    private String username;
    private String password;

    @Override
    public String toString() {
        return "Corner{" +
                "SOURCESITE='" + SOURCESITE + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                '}';
    }

    public String getSOURCESITE() {
        return SOURCESITE;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Corner(String username, String password) {

        this.username = username;
        this.password = password;
    }
}
