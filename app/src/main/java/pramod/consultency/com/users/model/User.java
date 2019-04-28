package pramod.consultency.com.users.model;

public class User {
    private int id;
    private String name;
    private String email;


    private String mobile;

    public User(int id,String name, String email,String mobile) {
        this.name = name;
        this.email = email;
        this.mobile =mobile;
        this.id=id;

    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public int getId() {
        return id;
    }


    public String getMobile() {
        return mobile;
    }

}
