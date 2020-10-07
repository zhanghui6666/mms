package com.czu.domain;

public class Agency {
        private Character cno;
        private String aname;
        private String asex;
        private String aphone;
        private String aewmark;
        private  Integer aid;

    public Character getCno() {
        return cno;
    }

    public void setCno(Character cno) {
        this.cno = cno;
    }

    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname;
    }

    public String getAsex() {
        return asex;
    }

    public void setAsex(String asex) {
        this.asex = asex;
    }

    public String getAphone() {
        return aphone;
    }

    public void setAphone(String aphone) {
        this.aphone = aphone;
    }

    public String getAewmark() {
        return aewmark;
    }

    public void setAewmark(String aewmark) {
        this.aewmark = aewmark;
    }

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public String toString() {
        return "Agency{" +
                "cno=" + cno +
                ", aname='" + aname + '\'' +
                ", asex='" + asex + '\'' +
                ", aphone='" + aphone + '\'' +
                ", aewmark='" + aewmark + '\'' +
                ", aid=" + aid +
                '}';
    }
}
