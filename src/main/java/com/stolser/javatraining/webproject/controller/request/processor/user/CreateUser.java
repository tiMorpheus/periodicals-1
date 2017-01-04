package com.stolser.javatraining.webproject.controller.request.processor.user;

import com.stolser.javatraining.webproject.controller.form.validator.front.message.FrontMessageFactory;
import com.stolser.javatraining.webproject.controller.form.validator.front.message.FrontendMessage;
import com.stolser.javatraining.webproject.controller.request.processor.RequestProcessor;
import com.stolser.javatraining.webproject.model.entity.user.Credential;
import com.stolser.javatraining.webproject.model.entity.user.User;
import com.stolser.javatraining.webproject.service.UserService;
import com.stolser.javatraining.webproject.service.impl.UserServiceImpl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

import static com.stolser.javatraining.webproject.controller.ApplicationResources.*;

public class CreateUser implements RequestProcessor {

    private UserService userService = UserServiceImpl.getInstance();
    private FrontMessageFactory messageFactory = FrontMessageFactory.getInstance();

    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) {
        Map<String, FrontendMessage> messages = new HashMap<>();
        HttpSession session = request.getSession();
        String redirectUri;

        String username = request.getParameter(SIGN_UP_USERNAME_PARAM_NAME);
        String password = request.getParameter(PASSWORD_PARAM_NAME);
        String repeatPassword = request.getParameter(REPEAT_PASSWORD_PARAM_NAME);
        String userRole = request.getParameter("userRole");

        Credential credential = userService.findOneCredentialByUserName(username);

        if (doesUsernameExistInDb(credential)) {
            messages.put(SIGN_UP_USERNAME_PARAM_NAME,
                    messageFactory.getError(USERNAME_IS_NOT_UNIQUE_TRY_ANOTHER_ONE));

            redirectUri = SIGN_IN_URI;
        } else if (arePasswordsNotEqual(password, repeatPassword)) {
            messages.put(PASSWORD_PARAM_NAME,
                    messageFactory.getError("validation.passwordsAreNotEqual"));

            redirectUri = SIGN_IN_URI;
        } else {
            createUser(username, password, userRole);
            redirectUri = selectRedirectUriByUserRole(userRole);
        }


        return null;

    }

    private String selectRedirectUriByUserRole(String userRole) {

        return null;
    }

    private void createUser(String username, String password, String userRole) {
        Credential.Builder credentialBuilder = new Credential.Builder();
        credentialBuilder.setUserName(username)
                .setPasswordHash(getPasswordHash(password));

        User.Builder userBuilder = new User.Builder();
        userBuilder.setStatus(User.Status.ACTIVE);

        userService.createNewUser(userBuilder.build(), credentialBuilder.build(), userRole);

    }

    private String getPasswordHash(String password) {
        return password;
    }

    private boolean arePasswordsNotEqual(String password, String repeatPassword) {
        return !password.equals(repeatPassword);
    }

    private boolean doesUsernameExistInDb(Credential credential) {
        return credential != null;
    }
}
