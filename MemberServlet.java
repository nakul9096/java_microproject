package com.example;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.ArrayList;
@WebServlet("/MemberServlet")
public class MemberServlet extends HttpServlet 
{
    private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        doPost(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        String action = request.getParameter("action");
            if ("register".equals(action)) 
            {
            String name = request.getParameter("name");
            String age = request.getParameter("age");
            String phone = request.getParameter("phone");
            String adhar = request.getParameter("adhar");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String acc = request.getParameter("acc");
            String accounttype = request.getParameter("accounttype");
            String country = request.getParameter("country");
            String ifsc = request.getParameter("ifsc");
            String balance = request.getParameter("balance");
            List<Transaction> transactions = new ArrayList<>();
            Member member = new Member(name, age, phone, adhar, email, password, acc, accounttype, country, ifsc, balance, transactions);
            DAOtrust dao = new DAOtrust();
            String result = dao.insert(member);
            if (result.equals("data entered successfully")) 
            {
                response.sendRedirect("success.html");
            } else 
            {
                response.getWriter().print(result);
            }
        } else if ("login".equals(action)) 
        {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            DAOtrust dao = new DAOtrust();
            Member member = dao.getMemberByEmailAndPassword(email, password);
            if (member != null) 
            {
                request.setAttribute("member", member);
                request.setAttribute("name", member.getName());
                HttpSession session = request.getSession();
                session.setAttribute("email", member.getEmail());
                session.setAttribute("name", member.getName());
                RequestDispatcher rd = request.getRequestDispatcher("dashboard.jsp");
                rd.forward(request, response);
            } else
            {
                String errorMessage = "Login failed, invalid credentials!";
                request.setAttribute("errorMessage", errorMessage);
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
            }
        } else if ("profile".equals(action)) 
        {
        	String email = request.getParameter("email");
        	DAOtrust dao = new DAOtrust();
        	Member member = dao.getMemberByEmail(email);
        	if (member != null) 
        	{
        	request.setAttribute("member", member);
        	request.setAttribute("name", member.getName());
        	request.setAttribute("email", member.getEmail());
        	RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
        	rd.forward(request, response);
        	} else 
        	{
        	String errorMessage = "Profile not found for the given email!";
        	request.setAttribute("errorMessage", errorMessage);
        	RequestDispatcher rd = request.getRequestDispatcher("dashboard.jsp");
        	rd.forward(request, response);
        	}
        } else if ("transfer".equals(action)) {
            String sourceAccount = request.getParameter("source-account");
            String destinationAccount = request.getParameter("destination-account");
            double amount = Double.parseDouble(request.getParameter("amount"));

            DAOtrust dao = new DAOtrust();
            Member sourceMember = dao.getMemberByAccount(sourceAccount);
            Member destMember = dao.getMemberByAccount(destinationAccount);

            if (sourceMember != null && destMember != null) {
                double sourceBalance = Double.parseDouble(sourceMember.getBalance());
                double destBalance = Double.parseDouble(destMember.getBalance());

                if (sourceBalance >= amount) {
                    // Update balances
                    sourceBalance -= amount;
                    destBalance += amount;

                    sourceMember.setBalance(Double.toString(sourceBalance));
                    destMember.setBalance(Double.toString(destBalance));

                    // Update balances in the database
                    boolean updateSource = dao.updateMemberBalance(sourceMember);
                    boolean updateDest = dao.updateMemberBalance(destMember);

                    if (updateSource && updateDest) {
                        // Redirect to success page after successful transfer
                        response.sendRedirect("success3.html");
                    } else {
                        response.getWriter().print("Error updating balances");
                    }
                } else {
                	response.sendRedirect("inserror.html");
                }
            } else {
                response.getWriter().print("Source or destination account not found");
            }
        } else if ("edit_profile".equals(action)) {
            String email = request.getParameter("email");
            String name = request.getParameter("name");
            String age = request.getParameter("age");
            String adhar = request.getParameter("adhar");
            String phone = request.getParameter("phone");
            String country = request.getParameter("country");
            String ifsc = request.getParameter("ifsc");

            DAOtrust dao = new DAOtrust();
            Member member = new Member(name, age, phone, adhar, email, "", "", "", country, ifsc, "",new ArrayList<>());
            
            boolean isUpdated = dao.updateMemberProfile(member);

            if (isUpdated) 
            {
                // Profile updated successfully
                response.sendRedirect("success2.html");
            } else 
            {
                String errorMessage = "Failed to update profile";
                request.setAttribute("errorMessage", errorMessage);
                RequestDispatcher rd = request.getRequestDispatcher("edit_profile.jsp");
                rd.forward(request, response);
            }
         // Inside the "balance" action block in your doPost method
        } else if ("balance.jsp".equals(action)) {
            String email = (String) request.getSession().getAttribute("email");
            DAOtrust dao = new DAOtrust();
            String balance = dao.getBalanceByEmail(email);
            if (balance != null) {
                request.setAttribute("balance", balance); // Set balance as an attribute
                RequestDispatcher rd = request.getRequestDispatcher("balance.jsp");
                rd.forward(request, response);
            } else {
                String errorMessage = "Balance information not available!";
                request.setAttribute("errorMessage", errorMessage);
                RequestDispatcher rd = request.getRequestDispatcher("dashboard.jsp");
                rd.forward(request, response);
            }
        }else if ("show_transactions".equals(action)) {
            String account = request.getParameter("account");
            DAOtrust dao = new DAOtrust();
            List<Transaction> transactions = dao.getTransactionsForAccount(account);

            request.setAttribute("transactions", transactions);
            RequestDispatcher rd = request.getRequestDispatcher("transaction.jsp");
            rd.forward(request, response);
        } else 
        {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action specified");
        }
    }
}