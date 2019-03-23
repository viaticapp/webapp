package mx.viaticapp.model;

import java.io.Serializable;

/**
 *
 * @author Fonseca
 */
public enum UserProfileType implements Serializable {

    DEV("DEV"),
    ADMIN("ADMIN"),
    USER("USER");

    String userProfileType;

    private UserProfileType(String userProfileType) {
        this.userProfileType = userProfileType;
    }

    public String getUserProfileType() {
        return userProfileType;
    }

}
