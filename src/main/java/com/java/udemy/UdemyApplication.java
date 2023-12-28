package com.java.udemy;

		import org.springframework.beans.factory.annotation.Value;
		import org.springframework.boot.SpringApplication;
		import org.springframework.boot.autoconfigure.SpringBootApplication;
		import org.springframework.context.annotation.Bean;
		import org.springframework.web.servlet.config.annotation.CorsRegistry;
		import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

		import org.jetbrains.annotations.NotNull;

		import org.springframework.beans.factory.annotation.Value;
		import org.springframework.boot.SpringApplication;
		import org.springframework.boot.autoconfigure.SpringBootApplication;
		import org.springframework.context.annotation.Bean;
		import org.springframework.web.servlet.config.annotation.CorsRegistry;
		import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@SpringBootApplication
public class UdemyApplication {

	@Value(value = "${frontend.root.url}")
	private String FRONTEND_URL;

	public static void main(String[] args) {
		SpringApplication.run(UdemyApplication.class, args);
	}

	@Bean
	public WebMvcConfigurer corsConfigurer() {
		return new WebMvcConfigurer() {
			@Override
			public void addCorsMappings(CorsRegistry registry) {
				registry.addMapping("/**")
						.allowCredentials(true)
						.exposedHeaders("Access-Control-Allow-Origin")
						.maxAge(3600L)
						.allowedOrigins("http://localhost:4200","http://localhost:4201")  // Thay đổi thành địa chỉ của ứng dụng Angular của bạn
						.allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS");
			}
		};
	}
}
