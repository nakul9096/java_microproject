package com.example;
public class Transaction {
    private int transactionId;
    private String date;
    private double amount;

    public Transaction(int transactionId, String date, double amount) {
        this.transactionId = transactionId;
        this.date = date;
        this.amount = amount;
    }

    public int getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(int transactionId) {
        this.transactionId = transactionId;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }
}
