<%@include file="/WEB-INF/includes/header.jsp" %>
<fmt:setBundle basename="webProject.i18n.credential.credential" var="credential"/>
<fmt:setBundle basename="webProject.i18n.validation" var="validation"/>
<fmt:setBundle basename="webProject.i18n.backend.general" var="general"/>

<div class="row">
    <div class="col-xs-8 col-xs-offset-2 col-md-4 col-md-offset-4">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><fmt:message key="credential.signUp.title" bundle="${credential}"/></h3>
                <form method="POST" name="loginform" id="loginform"
                      action="<c:url value="${ApplicationResources.SIGN_UP_URI}"/>"
                      accept-charset="UTF-8" role="form">
<!-- userName -->
                    <div class="form-group validated required">
                        <label class="control-label" for="userName">
                            <fmt:message key="credential.username.label" bundle="${credential}"/></label>
                        <input type="text" class="form-control" id="userName"
                               placeholder="<fmt:message key="credential.username.label" bundle="${credential}"/>"
                               name="signUpUsername"
                               value="${sessionScope.username}"/>
                        <c:if test="${(not empty messages) && (not empty messages['signUpUsername'])}">
                            <label class="messages ${messages['signUpUsername'].type == 'ERROR' ? 'error' : ''}">
                                <fmt:message key="${messages['signUpUsername'].messageKey}" bundle="${validation}"/>
                            </label>
                        </c:if>
                    </div>
<!-- userEmail -->
                    <div class="form-group validated required">
                        <label class="control-label" for="userEmail">
                            <fmt:message key="credential.email.label" bundle="${credential}"/></label>
                        <input type="text" class="form-control ajax-validated" id="userEmail"
                               placeholder="<fmt:message key="credential.email.label" bundle="${credential}"/>"
                               name="userEmail"
                               value="${sessionScope.userEmail}"/>
                        <c:if test="${(not empty messages) && (not empty messages['userEmail'])}">
                            <label class="messages ${messages['userEmail'].type == 'ERROR' ? 'error' : ''}">
                                <fmt:message key="${messages['userEmail'].messageKey}" bundle="${validation}"/>
                            </label>
                        </c:if>
                    </div>

<!-- userPassword -->
                    <div class="form-group validated required">
                        <label class="control-label" for="userPassword">
                            <fmt:message key="credential.password.label" bundle="${credential}"/></label>
                        <input type="password" class="form-control ajax-validated" id="userPassword"
                               placeholder="<fmt:message key="credential.password.label" bundle="${credential}"/>"
                               name="password"/>
                        <c:if test="${(not empty messages) && (not empty messages['password'])}">
                            <label class="messages ${messages['password'].type == 'ERROR' ? 'error' : ''}">
                                <fmt:message key="${messages['password'].messageKey}" bundle="${validation}"/>
                            </label>
                        </c:if>
                    </div>

<!-- repeatPassword -->
                    <div class="form-group validated required">
                        <label class="control-label" for="repeatPassword">
                            <fmt:message key="credential.repeatPassword.label" bundle="${credential}"/></label>
                        <input type="password" class="form-control" id="repeatPassword"
                               placeholder="<fmt:message key="credential.repeatPassword.label" bundle="${credential}"/>"
                               name="repeatPassword"/>
                        <c:if test="${(not empty messages) && (not empty messages['password'])}">
                            <label class="messages ${messages['password'].type == 'ERROR' ? 'error' : ''}">
                                <fmt:message key="${messages['password'].messageKey}" bundle="${validation}"/>
                            </label>
                        </c:if>
                    </div>
<!-- userRole -->
                    <div class="form-group validated required">
                        <label class="control-label" for="userRole">
                            <fmt:message key="credential.userRole.label" bundle="${validation}"/></label>
                        <select id="userRole" class="form-control" name="userRole">
                            <c:forEach var="role" items="${roles}">
                                <option value="${role}" ${(sessionScope.userRole == role) ? 'selected' : ''}>
                                    <fmt:message key="${role}" bundle="${general}"/>
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    <p class="requiredFieldsMessage"><fmt:message key="requiredFieldsMessage" bundle="${general}"/></p>

                    <button type="submit"
                            class="btn btn-lg btn-primary btn-block disabled">
                        <fmt:message key="credential.signUp.label" bundle="${credential}"/></button>
                </form>
            </div>

        </div>
    </div>
</div>

<% session.removeAttribute(ApplicationResources.USERNAME_ATTR_NAME);%>
<% session.removeAttribute(ApplicationResources.USER_ROLE_ATTR_NAME);%>
<% session.removeAttribute(ApplicationResources.USER_EMAIL_ATTR_NAME);%>

<%@include file="/WEB-INF/includes/footer.jsp" %>

