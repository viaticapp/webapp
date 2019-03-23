package mx.viaticapp.dao;

import java.util.List;
import mx.viaticapp.model.User;

/**
 *
 * @author Fonseca
 */
public interface UserDao {

    User findById(int id);

    User findByUsername(String username);

    void save(User user);

    void deleteByUsername(String username);

    List<User> findAllUsers();

}
