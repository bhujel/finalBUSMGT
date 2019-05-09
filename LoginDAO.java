
package Modal;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;


public class LoginDAO {
    
    public boolean check(Login l ){
        
        SignUp s = null;
        Configuration cf = null;
        SessionFactory sf = null;
        Session session = null;
        
        try{
            
            cf = new Configuration();
            cf.configure("cfg_package/hibernate.cfg.xml");
            sf = cf.buildSessionFactory();
            session = sf.openSession();
            
            Transaction tx = session.beginTransaction();
            
            s = (SignUp)session.get(SignUp.class, l.getUid());
            
            tx.commit();
        }
        catch(Exception e ){
            e.printStackTrace();
        }
        finally{
            session.close();
            sf.close();
        }
        if( s == null )
            return false;
        else
            return l.equals(s);
    }
    
}
