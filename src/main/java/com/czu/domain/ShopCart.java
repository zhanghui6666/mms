package com.czu.domain;

public class ShopCart {
    private String mno;
    private String mname;
    private String mefficacy;
    private String mprice;
    private Integer num;

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

    public String getMprice() {
        return mprice;
    }

    public void setMprice(String mprice) {
        this.mprice = mprice;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    @Override
    public String toString() {
        return "ShopCart{" +
                "mno='" + mno + '\'' +
                ", mname='" + mname + '\'' +
                ", mefficacy='" + mefficacy + '\'' +
                ", mprice='" + mprice + '\'' +
                ", num=" + num +
                '}';
    }
}
