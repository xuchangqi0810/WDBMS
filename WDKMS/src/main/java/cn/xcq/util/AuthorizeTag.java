package cn.xcq.util;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.tagext.BodyTagSupport;

import cn.xcq.dao.IPrivilegeDAO;
import cn.xcq.entity.Privilege;
import cn.xcq.entity.UserInfo;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
//标签
	public class AuthorizeTag  extends BodyTagSupport {
	//你提供一个用户名字，我给一个用户拥有的权限集合，并且操作是在权限的DAO中
	    private IPrivilegeDAO privilegeDAO;
	    private String URL;
	    public String getURL() {  
	        return URL;  
	    }  
	      
	    public void setURL(String uRL) {  
	        URL = uRL;  
	    }  
	    @Override  
	    public int doStartTag() {
	        // 如果URL不空就显示URL，否则就不显  
	        if (null != URL) {
	        	getUserDao();
	        	HttpServletRequest request = (HttpServletRequest)pageContext.getRequest();
	        	UserInfo info=(UserInfo)request.getSession().getAttribute("user");
	        	List<Privilege> list = privilegeDAO.getAllPrivilege(info.getUid());
	        	
	        	for (Privilege item : list) {
					System.out.println(URL+"==========================");
					if(item.getUrl().equals(URL)){
						  //正确渲染该标签
						  return EVAL_BODY_INCLUDE;  
					}
				}
	          
	        }  
	        return this.SKIP_BODY;  
	    }
		public void getUserDao() {
			  WebApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(pageContext.getServletContext());
			privilegeDAO=(IPrivilegeDAO)applicationContext.getBean("IPrivilegeDAO");
		}

}
