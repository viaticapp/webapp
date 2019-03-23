package mx.viaticapp.configuration;

import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletRegistration;
import mx.viaticapp.security.SecurityConfiguration;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

/**
 *
 * @author Fonseca
 */
public class AppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class[]{AppConfig.class, SecurityConfiguration.class};
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class[]{SecurityConfiguration.class};
    }

    @Override
    protected String[] getServletMappings() {
        return new String[]{"/"};
    }

    @Override
    protected void customizeRegistration(ServletRegistration.Dynamic registration) {
        registration.setMultipartConfig(getMultipartConfigElement());
    }

    private MultipartConfigElement getMultipartConfigElement() {
        MultipartConfigElement multipartConfigElement = new MultipartConfigElement(LOCATION, MAX_FILE_SIZE, MAX_REQUEST_SIZE, FILE_SIZE_THRESHOLD);
        return multipartConfigElement;
    }

    private static final String LOCATION = System.getProperty("java.io.tmpdir"); // Temporary location where files will be stored

    private static final long MAX_FILE_SIZE = 62914560; // 60MB : Max file size.

    private static final long MAX_REQUEST_SIZE = 62914560; // 60MB : Total request size containing Multi part.

    private static final int FILE_SIZE_THRESHOLD = 0; // Size threshold after which files will be written to disk

}
