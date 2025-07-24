package models;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
// import java.util.ArrayList;

public class User {
    private Integer id;
    private String name;
    private String email;
    private String password;




    public User(String name, String email, String password)
    {
        this.name=name;
        this.email=email;
        this.password=password;
    }

    public User(String email, String password)
    {
        this.email=email;
        this.password=password;
    }

    // Getters 
    public Integer getId() {
        return id;
    }
    public String getName() {
        return name;
    }
    public String getEmail() {
        return email;
    }
    public String getPassword() {
        return password;
    }

    // Setters 
    public void setId(Integer id) {
        this.id = id;
    }
    public void setName(String name) {
        this.name = name;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public void setPassword(String password) {
        this.password = password;
    }


    public Integer verify()
    {
      try{
        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/crickdb?user=root&password=root");

        String query="select email from users where email=?";
        
        PreparedStatement ps= con.prepareStatement(query);
        
        ps.setString(1, this.email);

        ResultSet rs=  ps.executeQuery();

        
        if(!rs.next())
        {
          return 1;
        }
        
        query="select password from users where email=?";
        ps=con.prepareStatement(query);
        ps.setString(1, this.email);

        rs=ps.executeQuery();
      
        if(rs.next())
        {
            String pass=rs.getString("password");
            if(!pass.equals(this.password))
            {
                return 2;
            }
        }
        
      }catch(SQLException | ClassNotFoundException e){
        e.printStackTrace();
      }
      return 0;
    }

    public void save()
    {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/crickdb?user=root&password=root");

            String query="insert into users (name,email,password) value(?,?,?)";

            PreparedStatement ps=con.prepareStatement(query);

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);

            ps.executeUpdate();
            con.close();
        }catch(SQLException | ClassNotFoundException e){
            e.printStackTrace();
        } 
    }
    

    
}
