package mx.viaticapp.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import mx.viaticapp.commons.FileValidator;
import mx.viaticapp.commons.MultiFileValidator;
import mx.viaticapp.model.FileBucket;
import mx.viaticapp.model.Release;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.rememberme.PersistentTokenBasedRememberMeServices;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import mx.viaticapp.model.User;
import mx.viaticapp.model.UserProfile;
import mx.viaticapp.service.UserProfileService;
import mx.viaticapp.service.UserService;
import net.lingala.zip4j.core.ZipFile;
import net.lingala.zip4j.exception.ZipException;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Fonseca
 */
@Controller
@RequestMapping("/")
@SessionAttributes({"roles"})
public class WebController {

    @Autowired
    UserService userService;

    @Autowired
    UserProfileService userProfileService;

    @Autowired
    MessageSource messageSource;

    @Autowired
    PersistentTokenBasedRememberMeServices persistentTokenBasedRememberMeServices;

    @Autowired
    AuthenticationTrustResolver authenticationTrustResolver;

    @Autowired
    FileValidator fileValidator;

    @Autowired
    MultiFileValidator multiFileValidator;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  LOGIN & LOGOUT
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////    
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage() {
        if (isCurrentAuthenticationAnonymous()) {
            return "login";
        } else {
            return "redirect:/home";
        }
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            persistentTokenBasedRememberMeServices.logout(request, response, auth);
            SecurityContextHolder.getContext().setAuthentication(null);
        }
        return "redirect:/login?logout";
    }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  HOME
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
    public String goHome(ModelMap model) {
        model.addAttribute("loggedinuser", userService.findByUsername(getPrincipal()));
        return "home";
    }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  USERS
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping(value = {"/users"}, method = RequestMethod.GET)
    public String listUsers(ModelMap model) {
        List<User> users = userService.findAllUsers();
        model.addAttribute("users", users);
        model.addAttribute("loggedinuser", getPrincipal());
        return "users";
    }

    @RequestMapping(value = {"/newuser"}, method = RequestMethod.GET)
    public String newUser(ModelMap model) {
        User newuser = new User();
        model.addAttribute("user", newuser);
        model.addAttribute("edit", false);
        model.addAttribute("loggedinuser", getPrincipal());
        return "newuser";
    }

    @RequestMapping(value = {"/newuser"}, method = RequestMethod.POST)
    public String saveUser(@Valid User user, BindingResult result,
            ModelMap model) {

        if (result.hasErrors()) {
            return "newuser";
        }

        if (!userService.isUsernameUnique(user.getId(), user.getUsername())) {
            FieldError usernameError = new FieldError("user", "username", messageSource.getMessage("non.unique.username", new String[]{user.getUsername()}, Locale.getDefault()));
            result.addError(usernameError);
            return "newuser";
        }

        userService.saveUser(user);

        model.addAttribute("success", "User " + user.getFirstName() + " " + user.getLastName() + " registered successfully");
        model.addAttribute("loggedinuser", getPrincipal());
        return "redirect:/users";
    }

    @RequestMapping(value = {"/edit-user-{username}"}, method = RequestMethod.GET)
    public String editUser(@PathVariable String username, ModelMap model) {
        User user = userService.findByUsername(username);
        model.addAttribute("user", user);
        model.addAttribute("edit", true);
        model.addAttribute("loggedinuser", getPrincipal());
        return "newuser";
    }

    @RequestMapping(value = {"/edit-user-{username}"}, method = RequestMethod.POST)
    public String updateUser(@Valid User user, BindingResult result,
            ModelMap model, @PathVariable String username) {

        if (result.hasErrors()) {
            return "newuser";
        }
        userService.updateUser(user);

        model.addAttribute("success", "User " + user.getFirstName() + " " + user.getLastName() + " updated successfully");
        model.addAttribute("loggedinuser", getPrincipal());
        return "redirect:/users";
    }

    @RequestMapping(value = {"/delete-user-{username}"}, method = RequestMethod.GET)
    public String deleteUser(@PathVariable String username) {
        userService.deleteUserByUsername(username);
        return "redirect:/users";
    }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  SESSION
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////    
    /**
     * This method will provide UserProfile list to views
     */
    @ModelAttribute("roles")
    public List<UserProfile> initializeProfiles() {
        return userProfileService.findAll();
    }

    /**
     * This method handles Access-Denied redirect.
     */
    @RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
    public String accessDeniedPage(ModelMap model) {
        model.addAttribute("loggedinuser", getPrincipal());
        return "accessDenied";
    }

    /**
     * This method returns the principal[user-name] of logged-in user.
     */
    private String getPrincipal() {
        String username = null;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        } else {
            username = principal.toString();
        }
        return username;
    }

    /**
     * This method returns true if users is already authenticated [logged-in],
     * else false.
     */
    private boolean isCurrentAuthenticationAnonymous() {
        final Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return authenticationTrustResolver.isAnonymous(authentication);
    }

}
