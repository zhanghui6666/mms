package com.czu.domain;

import java.util.Date;

public class Orders {
    private Integer oid;
    private String cno;
    private String mno;
    private String mname;
    private String mefficacy;
    private Integer mprice;
    private Integer num;
    private Integer totalprice;
    private Date date;

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

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

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public String getMefficacy() {
        return mefficacy;
    }

    public void setMefficacy(String mefficacy) {
        this.mefficacy = mefficacy;
    }

    public Integer getMprice() {
        return mprice;
    }

    public void setMprice(Integer mprice) {
        this.mprice = mprice;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Integer getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(Integer totalprice) {
        this.totalprice = totalprice;
    }

    @Override
    public String toString() {
        return "Orders{" +
                "oid=" + oid +
                ", cno='" + cno + '\'' +
                ", mno='" + mno + '\'' +
                ", mname='" + mname + '\'' +
                ", mefficacy='" + mefficacy + '\'' +
                ", mprice=" + mprice +
                ", num=" + num +
                ", totalprice=" + totalprice +
                ", date=" + date +
                '}';
    }
}
