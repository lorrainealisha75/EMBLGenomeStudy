package com.embl;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Import;

import com.embl.configuration.JpaConfiguration;


@Import(JpaConfiguration.class)
@SpringBootApplication(scanBasePackages={"com.embl"})// same as @Configuration @EnableAutoConfiguration @ComponentScan
public class EMBLGenomeStudy {

	public static void main(String[] args) {
		SpringApplication.run(EMBLGenomeStudy.class, args);
	}
}
