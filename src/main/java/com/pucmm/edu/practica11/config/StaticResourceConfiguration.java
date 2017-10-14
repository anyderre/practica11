package com.pucmm.edu.practica11.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
/**
 * Created by Dany 27/09/2017
 */

@Configuration
public class StaticResourceConfiguration extends WebMvcConfigurerAdapter {
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        String directory;

         directory ="file:///C:/fotos/clientes/";
         registry.addResourceHandler("/archivos/**").addResourceLocations(directory);

    }
}