package listeners;
import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.*;
import javax.servlet.annotation.WebListener;

@WebListener
public class InitContextListener implements ServletContextListener{
	public void contextInitialized(ServletContextEvent e) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		DataSource ds = null;
		try {
			ds = getDataSource();
		}
		catch(NamingException ex) {
			System.err.println("Impossibile ottene DataSource");
			System.exit(-1);
		}
		e.getServletContext().setAttribute("software_ds", ds);
		ServletContextListener.super.contextInitialized(e);
		
		
		
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		ServletContextListener.super.contextDestroyed(sce);
	}
	
	
	private DataSource getDataSource() throws NamingException {
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		
		DataSource ds = (DataSource)envCtx.lookup("jdbc/software_house_web");
		if(ds == null) {
			throw new NamingException();
		}
		return ds;
	}
}
