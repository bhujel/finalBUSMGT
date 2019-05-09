
package Modal;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="create1")
public class Create {
    
    private String bno;
    private String dname;
    
    @Id
    private int did;
    private String dcon1;
    private String route;
    private String shift;

    public Create(){
        
    }
    public Create(String bno, String dname, int did, String dcon1, String route, String shift) {
        this.bno = bno;
        this.dname = dname;
        this.did = did;
        this.dcon1 = dcon1;
        this.route = route;
        this.shift = shift;
    }

    public String getBno() {
        return bno;
    }

    public void setBno(String bno) {
        this.bno = bno;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }

    public int getDid() {
        return did;
    }

    public void setDid(int did) {
        this.did = did;
    }

    public String getDcon() {
        return dcon1;
    }

    public void setDcon(String dcon) {
        this.dcon1 = dcon;
    }

    public String getRoute() {
        return route;
    }

    public void setRoute(String route) {
        this.route = route;
    }

    public String getShift() {
        return shift;
    }

    public void setShift(String shift) {
        this.shift = shift;
    }
    
}
