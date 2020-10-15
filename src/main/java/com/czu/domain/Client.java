package com.czu.domain;

import java.util.Date;

public class Client {
    private String cno;
    private String cpassword;
    private String spassword;
    private String cname;
    private String csex;
    private String cage;
    private String caddress;
    private String cphone;
    private String csymptom;
    private Date cdate;
    private String cremark;
    private Integer cid;


    @Override
    public String toString() {
        return "Client{" +
                "cno='" + cno + '\'' +
                ", cpassword='" + cpassword + '\'' +
                ", spassword='" + spassword + '\'' +
                ", cname='" + cname + '\'' +
                ", csex='" + csex + '\'' +
                ", cage='" + cage + '\'' +
                ", caddress='" + caddress + '\'' +
                ", cphone='" + cphone + '\'' +
                ", csymptom='" + csymptom + '\'' +
                ", cdate=" + cdate +
                ", cremark='" + cremark + '\'' +
                ", cid=" + cid +
                '}';
    }

    public String getSpassword() {
        return spassword;
    }

    public void setSpassword(String spassword) {
        this.spassword = spassword;
    }

    public String getCno() {
        return cno;
    }

    public void setCno(String cno) {
        this.cno = cno;
    }

    public String getCpassword() {
        return cpassword;
    }

    public void setCpassword(String cpassword) {
        this.cpassword = cpassword;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCsex() {
        return csex;
    }

    public void setCsex(String csex) {
        this.csex = csex;
    }

    public String getCage() {
        return cage;
    }

    public void setCage(String cage) {
        this.cage = cage;
    }

    public String getCaddress() {
        return caddress;
    }

    public void setCaddress(String caddress) {
        this.caddress = caddress;
    }

    public String getCphone() {
        return cphone;
    }

    public void setCphone(String cphone) {
        this.cphone = cphone;
    }

    public String getCsymptom() {
        return csymptom;
    }

    public void setCsymptom(String csymptom) {
        this.csymptom = csymptom;
    }

    public Date getCdate() {
        return cdate;
    }

    public void setCdate(Date cdate) {
        this.cdate = cdate;
    }

    public String getCremark() {
        return cremark;
    }

    public void setCremark(String cremark) {
        this.cremark = cremark;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }
}
