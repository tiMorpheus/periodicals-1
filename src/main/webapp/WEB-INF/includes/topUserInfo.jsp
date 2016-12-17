<fmt:setBundle basename="webProject.i18n.backend.general" var="langGeneral"/>

<p class="text-right"><span class="userFullName"><c:out value="${thisUser.lastName}"/>
            <c:out value="${thisUser.firstName}"/></span>
    <a href="<c:url value="/backend/users/currentUser"/>" class="btn btn-primary myAccountBtn" role="button">
    <fmt:message key="myAccount.label" bundle="${langGeneral}"/></a>
    <a href="<c:url value="/backend/signOut"/>">
    <fmt:message key="signout.label" bundle="${langGeneral}"/></a></p>
