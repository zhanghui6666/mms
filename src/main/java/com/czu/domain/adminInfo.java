package com.czu.domain;

public class adminInfo {
    private Integer aid;
    private String aname;
    private String apassword;
    private String aaccess;

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname;
    }

    public String getApassword() {
        return apassword;
    }

    public void setApassword(String apassword) {
        this.apassword = apassword;
    }

    public String getAaccess() {
        return aaccess;
    }

    public void setAaccess(String aaccess) {
        this.aaccess = aaccess;
    }

    @Override
    public String toString() {
        return "adminInfo{" +
                "aid=" + aid +
                ", aname='" + aname + '\'' +
                ", apassword='" + apassword + '\'' +
                ", aaccess='" + aaccess + '\'' +
                '}';
    }
}
