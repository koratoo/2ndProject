package kr.softsoldesk.config;

import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.DispatcherServlet;


//Spring 환경설정 방법1
public class SpringConfigClass implements WebApplicationInitializer{
    
	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
		//Spring Framework 프로젝트 설정을 위한 클래스의 객체생성
		AnnotationConfigWebApplicationContext servletAppContext=new AnnotationConfigWebApplicationContext();
		servletAppContext.register(ServletAppContext.class);
		
		//요청 발생 시 요청을 처리하는 서블릿을 DispatcherServlet으로 설정
		DispatcherServlet dispatcherServlet=new DispatcherServlet(servletAppContext);
		//매개변수로 선언된 servletContext객체를 이용하여 servlet 추가
		ServletRegistration.Dynamic servlet = servletContext.addServlet("dispatcher", dispatcherServlet);
		
		//부가 설정
		servlet.setLoadOnStartup(1);
		servlet.addMapping("/");
		
		//======================================================================
		//일반 Bean등록
		AnnotationConfigWebApplicationContext rootAppContext=new AnnotationConfigWebApplicationContext();
		rootAppContext.register(RootAppContext.class);
		
		//listener 구현
		ContextLoaderListener listener=new ContextLoaderListener(rootAppContext);
		servletContext.addListener(listener);
		//filter 구현
		FilterRegistration.Dynamic filter=servletContext.addFilter("encodingFilter", CharacterEncodingFilter.class);
		filter.setInitParameter("encoding", "UTF-8");
		//dispatcher에 의해서 편집한 경로 UTF-8로 셋팅
		filter.addMappingForServletNames(null, false, "dispatcher");	
	}
}
