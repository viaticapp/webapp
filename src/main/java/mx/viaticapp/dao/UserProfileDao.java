package mx.viaticapp.dao;

import java.util.List;
import mx.viaticapp.model.UserProfile;

/**
 *
 * @author Fonseca
 */
public interface UserProfileDao {

    List<UserProfile> findAll();

    UserProfile findByType(String type);

    UserProfile findById(int id);
}
