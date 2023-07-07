/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.bean;

/**
 *
 * @author hakimchi
 */
public class Staff {
    private int staff_id;
    private String staff_name;
    private String staff_email;
    private String staff_phonenumber;
    private int staff_user_id;

    public Staff() {
    }

    public Staff(int staff_id, String staff_name, String staff_email, String staff_phonenumber, int staff_user_id) {
        this.staff_id = staff_id;
        this.staff_name = staff_name;
        this.staff_email = staff_email;
        this.staff_phonenumber = staff_phonenumber;
        this.staff_user_id = staff_user_id;
    }

    public int getStaff_id() {
        return staff_id;
    }

    public void setStaff_id(int staff_id) {
        this.staff_id = staff_id;
    }

    public String getStaff_name() {
        return staff_name;
    }

    public void setStaff_name(String staff_name) {
        this.staff_name = staff_name;
    }

    public String getStaff_email() {
        return staff_email;
    }

    public void setStaff_email(String staff_email) {
        this.staff_email = staff_email;
    }

    public String getStaff_phonenumber() {
        return staff_phonenumber;
    }

    public void setStaff_phonenumber(String staff_phonenumber) {
        this.staff_phonenumber = staff_phonenumber;
    }

    public int getStaff_user_id() {
        return staff_user_id;
    }

    public void setStaff_user_id(int staff_user_id) {
        this.staff_user_id = staff_user_id;
    }
}
