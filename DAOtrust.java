package com.example;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;
public class DAOtrust {
    private String dburl = "jdbc:mysql://localhost:3306/bank";
    private String dbuname = "root";
    private String dbpassword = "root";
    private String dbdriver = "com.mysql.cj.jdbc.Driver";
    public void loadDriver(String dbdriver) 
    {
        try 
        {
            Class.forName(dbdriver);
        } catch (ClassNotFoundException e) 
        {
            e.printStackTrace();
        }
    }
    public Connection getConnection() 
    {
        Connection con = null;
        try 
        {
            con = DriverManager.getConnection(dburl, dbuname, dbpassword);
        } catch (SQLException e) 
        {
            e.printStackTrace();
        }
        return con;
    }
    public String insert(Member member) 
    {
        loadDriver(dbdriver);
        Connection con = getConnection();
        String result = "data entered successfully";
        String sql = "INSERT INTO bank_login (name, age, phone, adhar, email, password, acc, accounttype, country, ifsc) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, member.getName());
            ps.setString(2, member.getAge());
            ps.setString(3, member.getPhone());
            ps.setString(4, member.getAdhar());
            ps.setString(5, member.getEmail());
            ps.setString(6, member.getPassword());
            ps.setString(7, member.getAcc());
            ps.setString(8, member.getAccounttype());
            ps.setString(9, member.getCountry());
            ps.setString(10, member.getIfsc());
            int rowsInserted = ps.executeUpdate();
            if (rowsInserted <= 0) 
            {
                result = "data not entered";
            }
            ps.close();
        } catch (SQLException e) 
        {
            e.printStackTrace();
            result = "data not entered";
        } finally 
        {
            try 
            {
                if (con != null) 
                {
                    con.close();
                }
            } catch (SQLException e) 
            {
                e.printStackTrace();
            }
        }
        return result;
    }
    public Member getMemberByEmailAndPassword(String email, String password) 
    {
        loadDriver(dbdriver);
        Connection con = getConnection();
        Member member = null;
        String sql = "SELECT * FROM bank_login WHERE email=? AND password=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String name = rs.getString("name");
                String age = rs.getString("age");
                String phone = rs.getString("phone");
                String adhar = rs.getString("adhar");
                String acc = rs.getString("acc");
                String accounttype = rs.getString("accounttype");
                String country = rs.getString("country");
                String ifsc = rs.getString("ifsc");
                String balance = rs.getString("balance");
                List<Transaction> transactions = getTransactionsForAccount(acc);
                member = new Member(name, age, phone, adhar, email, password, acc, accounttype, country, ifsc, balance, transactions);
            }
            ps.close();
        } catch (SQLException e) 
        {
            e.printStackTrace();
        } finally 
        {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) 
            {
                e.printStackTrace();
            }
        }
        return member;
    }
    public ResultSet getData(Connection con) 
    {
        ResultSet rs = null;
        try {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM bank_login");
            rs = ps.executeQuery();
        } catch (SQLException e) 
        {
            e.printStackTrace();
        }
        return rs;
    }
    public Member getMemberByEmail(String email) 
    {
        loadDriver(dbdriver);
        Connection con = getConnection();
        Member member = null;
        String sql = "SELECT * FROM bank.bank_login WHERE email=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String name = rs.getString("name");
                String age = rs.getString("age");
                String phone = rs.getString("phone");
                String adhar = rs.getString("adhar");
                String acc = rs.getString("acc");
                String accounttype = rs.getString("accounttype");
                String country = rs.getString("country");
                String ifsc = rs.getString("ifsc");
                String balance = rs.getString("balance");
                List<Transaction> transactions = new ArrayList<>();
                member = new Member(name, age, phone, adhar, email, "", acc, accounttype, country, ifsc, balance, transactions);
            }
            ps.close();
        } catch (SQLException e) 
        {
            e.printStackTrace();
        } finally 
        {
            try 
            {
                if (con != null) 
                {
                    con.close();
                }
            } catch (SQLException e) 
            {
                e.printStackTrace();
            }
        }
        return member;
    }
    public boolean updateMemberProfile(Member member) 
    {
        loadDriver(dbdriver);
        Connection con = getConnection();
        boolean isUpdated = false;
        String sql = "UPDATE bank_login SET name=?, age=?, adhar=?, phone=?, country=?, ifsc=? WHERE email=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, member.getName());
            ps.setString(2, member.getAge());
            ps.setString(3, member.getAdhar());
            ps.setString(4, member.getPhone());
            ps.setString(5, member.getCountry());
            ps.setString(6, member.getIfsc());
            ps.setString(7, member.getEmail());
            int rowsUpdated = ps.executeUpdate();
            isUpdated = rowsUpdated > 0;
            ps.close();
        } catch (SQLException e) 
        {
            e.printStackTrace();
        } finally 
        {
            try {
                if (con != null) 
                {
                    con.close();
                }
            } catch (SQLException e) 
            {
                e.printStackTrace();
            }
        }
        return isUpdated;
    }
    public Member getMemberByAccount(String account) {
        loadDriver(dbdriver);
        Connection con = getConnection();
        Member member = null;
        String sql = "SELECT * FROM bank_login WHERE acc=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, account);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String name = rs.getString("name");
                String age = rs.getString("age");
                String phone = rs.getString("phone");
                String adhar = rs.getString("adhar");
                String email = rs.getString("email");
                String password = rs.getString("password");
                String acc = rs.getString("acc");
                String accounttype = rs.getString("accounttype");
                String country = rs.getString("country");
                String ifsc = rs.getString("ifsc");
                String balance = rs.getString("balance");
                List<Transaction> transactions = getTransactionsForAccount(account);// Add balance column to your table
                member = new Member(name, age, phone, adhar, email, password, acc, accounttype, country, ifsc,balance,transactions);
                member.setBalance(balance);
            }
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return member;
    }

    public boolean updateMemberBalance(Member member) {
        loadDriver(dbdriver);
        Connection con = getConnection();
        boolean isUpdated = false;
        String sql = "UPDATE bank_login SET balance=? WHERE acc=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, member.getBalance());
            ps.setString(2, member.getAcc());
            int rowsUpdated = ps.executeUpdate();
            isUpdated = rowsUpdated > 0;
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return isUpdated;
    }
    public String getBalanceByEmail(String email) {
        loadDriver(dbdriver);
        Connection con = getConnection();
        String balance = "N/A"; // Default value if balance is not found
        String sql = "SELECT balance FROM bank_login WHERE email=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                balance = rs.getString("balance");
            }
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return balance;
    }
    public List<Transaction> getTransactionsForAccount(String account) {
        List<Transaction> transactions = new ArrayList<>();
        loadDriver(dbdriver);
        Connection con = getConnection();

        String sql = "SELECT * FROM transactions WHERE source_account=? OR destination_account=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, account);
            ps.setString(2, account);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int transactionId = rs.getInt("transaction_id");
                String date = rs.getString("date");
                double amount = rs.getDouble("amount");

                Transaction transaction = new Transaction(transactionId, date, amount);
                transactions.add(transaction);
            }

            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return transactions;
    }
}