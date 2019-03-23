package mx.viaticapp.service;

import java.util.List;
import mx.viaticapp.model.User;

/**
 *
 * @author Fonseca
 */
public interface UserService {

    User findById(int id);

    User findByUsername(String username);

    void saveUser(User user);

    void updateUser(User user);

    void deleteUserByUsername(String username);

    List<User> findAllUsers();

    boolean isUsernameUnique(Integer id, String username);

}
