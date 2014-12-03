package lt.vu.mif.ps5.kupra.service;

import java.util.List;
import lt.vu.mif.ps5.kupra.entity.User;

public interface UserService {

	User getUser(long userId);

    List<User> getAll();

    long addUser(String loginname, String username, String password, String email, String name, String lastname, String address);

}
