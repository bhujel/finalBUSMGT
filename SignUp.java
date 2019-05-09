
package Modal;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="signup")
public class SignUp {
    
    @Id
    private int uid;
    private String fname;
    private String lname;
    private String pwd;
    private String ph;
    private String em;
    private String pik;
    private String gender;
    private String acc;
//    private String add;

    public SignUp() {
    }

    public SignUp(int uid, String fname, String lname, String pwd, String ph, String em, String pik, String gender, String acc) {
        this.uid = uid;
        this.fname = fname;
        this.lname = lname;
        this.pwd = pwd;
        this.ph = ph;
        this.em = em;
        this.pik = pik;
        this.gender = gender;
        this.acc = acc;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getPh() {
        return ph;
    }

    public void setPh(String ph) {
        this.ph = ph;
    }

    public String getEm() {
        return em;
    }

    public void setEm(String em) {
        this.em = em;
    }

    public String getPik() {
        return pik;
    }

    public void setPik(String pik) {
        this.pik = pik;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAcc() {
        return acc;
    }

    public void setAcc(String acc) {
        this.acc = acc;
    }

//    public String getAdd() {
//        return add;
//    }
//
//    public void setAdd(String add) {
//        this.add = add;
//    }
}
