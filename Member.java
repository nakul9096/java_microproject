package com.example;
import java.util.List;

public class Member {
    private String name, age, phone, adhar, email, password, acc, accounttype, country, ifsc, balance;
    private List<Transaction> transactions;

    public Member() {
        super();
    }

    public Member(String name, String age, String phone, String adhar, String email, String password, String acc,
                  String accounttype, String country, String ifsc, String balance, List<Transaction> transactions) {
        super();
        this.name = name;
        this.age = age;
        this.phone = phone;
        this.adhar = adhar;
        this.email = email;
        this.password = password;
        this.acc = acc;
        this.accounttype = accounttype;
        this.country = country;
        this.ifsc = ifsc;
        this.balance = balance;
        this.transactions = transactions;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAdhar() {
        return adhar;
    }

    public void setAdhar(String adhar) {
        this.adhar = adhar;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAcc() {
        return acc;
    }

    public void setAcc(String acc) {
        this.acc = acc;
    }

    public String getAccounttype() {
        return accounttype;
    }

    public void setAccounttype(String accounttype) {
        this.accounttype = accounttype;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getIfsc() {
        return ifsc;
    }

    public void setIfsc(String ifsc) {
        this.ifsc = ifsc;
    }

    public String getBalance() {
        return balance;
    }

    public void setBalance(String balance) {
        this.balance = balance;
    }

    public List<Transaction> getTransactions() {
        return transactions;
    }

    public void setTransactions(List<Transaction> transactions) {
        this.transactions = transactions;
    }
}
