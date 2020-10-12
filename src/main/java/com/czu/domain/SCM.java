package com.czu.domain;

public class SCM {
    private String cno;
    private String mno;
    private Integer num;

    public String getCno() {
        return cno;
    }

    public void setCno(String cno) {
        this.cno = cno;
    }

    public String getMno() {
        return mno;
    }

    public void setMno(String mno) {
        this.mno = mno;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    @Override
    public String toString() {
        return "SCM{" +
                "cno='" + cno + '\'' +
                ", mno='" + mno + '\'' +
                ", num=" + num +
                '}';
    }
}
