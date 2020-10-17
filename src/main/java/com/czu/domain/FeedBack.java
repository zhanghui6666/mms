package com.czu.domain;

public class FeedBack {
    private Integer fid;
    private String cno;
    private String cname;
    private String ctext;

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public String getCno() {
        return cno;
    }

    public void setCno(String cno) {
        this.cno = cno;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCtext() {
        return ctext;
    }

    public void setCtext(String ctext) {
        this.ctext = ctext;
    }

    @Override
    public String toString() {
        return "FeedBack{" +
                "fid=" + fid +
                ", cno='" + cno + '\'' +
                ", cname='" + cname + '\'' +
                ", ctext='" + ctext + '\'' +
                '}';
    }
}
