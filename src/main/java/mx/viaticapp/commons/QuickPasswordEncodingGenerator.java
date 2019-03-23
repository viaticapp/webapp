package mx.viaticapp.commons;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 *
 * @author Fonseca
 */
public class QuickPasswordEncodingGenerator {

    public static void main(String[] args) {
        String password = "Fonseca$15";
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

        System.out.println(passwordEncoder.encode(password));
    }
}
