package kr.softsoldesk.config;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperFactoryBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;




@ComponentScan("kr.co.softsoldesk.controller") //스캔할 패키지
@PropertySource("/WEB-INF/properties/db.properties")
@EnableWebMvc //Controller로 등록되어 있는 클래스 셋팅
@Configuration
public class ServletAppContext implements WebMvcConfigurer{
	
	@Value("${db.classname}")
	private String db_classname;
	
	@Value("${db.url}")
	private String db_url;
	
	@Value("${db.username}")
	private String db_username;
	
	@Value("${db.password}")
	private String db_password;

	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		// view 경로와 확장자 셋팅
		WebMvcConfigurer.super.configureViewResolvers(registry);
		registry.jsp("/WEB-INF/views/", ".jsp");
	}
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// 이미지,영상, 소리 등 정적파일 경로 매핑
		WebMvcConfigurer.super.addResourceHandlers(registry);
		registry.addResourceHandler("/**").addResourceLocations("/resources/");
	}
	
	   //데이터베이스 접속 정보 관리
	   @Bean
	   public BasicDataSource dataSource() {
	      BasicDataSource source = new BasicDataSource();
	      source.setDriverClassName(db_classname);
	      source.setUrl(db_url);
	      source.setUsername(db_username);
	      source.setPassword(db_password);
	      
	      return source;
	   }
	
	   //쿼리문과 접속 관리하는 객체(sqlSessionFactory 접속, 쿼리를 관리하는 객체)
	   @Bean
	   public SqlSessionFactory factory(BasicDataSource source) throws Exception{
	      SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
	      factoryBean.setDataSource(source);
	      SqlSessionFactory factory = factoryBean.getObject();
	      return factory;
	   }   
	
	
//	   //쿼리문 실행을 위한 객체(쿼리문을 관리하는 Mapper를 정의)
//	   @Bean
//	   public MapperFactoryBean<MapperInterface> test_mapper(SqlSessionFactory factory) throws Exception{
//	      MapperFactoryBean<MapperInterface> factoryBean = new MapperFactoryBean<MapperInterface>(MapperInterface.class);
//	      factoryBean.setSqlSessionFactory(factory);
//	      return factoryBean;
//	   }
//	   
	   
	
	

}