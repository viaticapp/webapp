package mx.viaticapp.service;

import java.util.List;
import mx.viaticapp.model.UserProfile;

/**
 *
 * @author Fonseca
 */
public interface UserProfileService {

    UserProfile findById(int id);

    UserProfile findByType(String type);

    List<UserProfile> findAll();

}
