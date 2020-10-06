package com.czu.domain;

public class Medicine {
    private Integer mno;
    private String mname;
    private String mmode;
    private String mefficacy;
    private Integer mprice;
    private Integer mnumber;
    private Integer mid;

    public Integer getMno() {
        return mno;
    }

    public void setMno(Integer mno) {
        this.mno = mno;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public String getMmode() {
        return mmode;
    }

    public void setMmode(String mmode) {
        this.mmode = mmode;
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

    public Integer getMnumber() {
        return mnumber;
    }

    public void setMnumber(Integer mnumber) {
        this.mnumber = mnumber;
    }

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    @Override
    public String toString() {
        return "Medicine{" +
                "mno=" + mno +
                ", mname='" + mname + '\'' +
                ", mmode='" + mmode + '\'' +
                ", mefficacy='" + mefficacy + '\'' +
                ", mprice=" + mprice +
                ", mnumber=" + mnumber +
                ", mid=" + mid +
                '}';
    }
}
