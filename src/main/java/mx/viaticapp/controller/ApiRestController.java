package mx.viaticapp.controller;

import mx.viaticapp.model.User;
import mx.viaticapp.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Fonseca
 */
@RestController
@RequestMapping("/restapi")
public class ApiRestController {

    static final Logger logger = LoggerFactory.getLogger(ApiRestController.class);

    @Autowired
    UserService userService;

    @RequestMapping(value = "/{username}", method = RequestMethod.GET)
    ResponseEntity<User> checkClient(@PathVariable String username) {
        logger.info("username : {}", username);
        User user = userService.findByUsername(username);
        return new ResponseEntity<User>(user, HttpStatus.OK);
    }

}
