package entity;

import java.util.Date;

/**
 * @author yangxin
 * @time 2018/12/24  14:20
 */
public class User {
    private long userId;

    private long userType;

    private String userName;

    private String userPassword;

    private String userEmail;

    private int userAge;

    private Date createTime;

    public User(long userType, String userName, String userPassword, String userEmail, int userAge) {
        this.userType = userType;
        this.userName = userName;
        this.userPassword = userPassword;
        this.userEmail = userEmail;
        this.userAge = userAge;
    }

    public User() {
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", userType=" + userType +
                ", userName='" + userName + '\'' +
                ", userPassword='" + userPassword + '\'' +
                ", userEmail='" + userEmail + '\'' +
                ", userAge=" + userAge +
                ", createTime=" + createTime +
                '}';
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public long getUserType() {
        return userType;
    }

    public void setUserType(long userType) {
        this.userType = userType;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public int getUserAge() {
        return userAge;
    }

    public void setUserAge(int userAge) {
        this.userAge = userAge;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null ) return false;
        if(o instanceof  Integer){
            if((long)o ==this.userId){
                return  true;
            }
        }
        if(o instanceof  User){
            if(((User) o).userId==this.userId ){
                return  true;
            }
        }
        return  false;
    }

    @Override
    public int hashCode() {
        int result = (int) (userId ^ (userId >>> 32));
        result = 31 * result + (int) (userType ^ (userType >>> 32));
        result = 31 * result + (userName != null ? userName.hashCode() : 0);
        result = 31 * result + (userPassword != null ? userPassword.hashCode() : 0);
        result = 31 * result + (userEmail != null ? userEmail.hashCode() : 0);
        result = 31 * result + userAge;
        result = 31 * result + (createTime != null ? createTime.hashCode() : 0);
        return result;
    }
}
