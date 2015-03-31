import com.opensymphony.xwork2.ActionSupport;

public class Login extends ActionSupport {

    public String execute() throws Exception {

      //  if (isInvalid(getUsername())) return "input";

//        if (isInvalid(getPassword())) return "input";

        return "success";
    }

    private boolean isInvalid(String value) {
        return (value == null || value.length() == 0);
    }

    private String username;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    private String password;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}
