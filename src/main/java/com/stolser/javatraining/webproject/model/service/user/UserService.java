package com.stolser.javatraining.webproject.model.service.user;

import com.stolser.javatraining.webproject.model.entity.user.Credential;
import com.stolser.javatraining.webproject.model.entity.user.User;

import java.util.List;

public interface UserService {
    User findOneById(long id);

    Credential findOneCredentialByUserName(String userName);

    User findOneUserByUserName(String userName);

    List<User> findAll();
}
