package com.lanwon;

import org.springframework.batch.core.configuration.annotation.EnableBatchProcessing;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.lanwon.config.BatchConfiguration;


@SpringBootApplication
public class SrpingBatchApplication {

	public static void main(String[] args) {
		SpringApplication.run(SrpingBatchApplication.class, args);
	}
	
	//https://spring.io/guides/gs/batch-processing/
/*	public static void main(String [] args) {
	     System.exit(SpringApplication.exit(SpringApplication.run(
	       BatchConfiguration.class, args)));
	 }*/
	
}
