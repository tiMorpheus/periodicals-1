<%@ page import="com.stolser.javatraining.webproject.controller.ApplicationResources" %>
<%@include file="../../includes/general.jsp" %>
<%@include file="../../includes/header.jsp" %>
<fmt:setBundle basename="webProject.i18n.admin.periodical" var="langPeriodical"/>
<fmt:setBundle basename="webProject.i18n.admin.general" var="general"/>

<div class="row">
    <div class="col-md-8 col-md-offset-2">
        <h1><fmt:message key="createPeriodical.title" bundle="${langPeriodical}"/></h1>
        <h3><fmt:message key="title.top" bundle="${langPeriodical}"/></h3>

        <form class="form-horizontal"
              method="post"
              action="<% out.print(ApplicationResources.PERIODICAL_CREATE_NEW_REST); %>">
            <div class="form-group hidden">
                <div class="col-sm-9">
                    <input id="periodicalId" type="text" class="form-control"
                           name="periodicalId"
                           value="<c:out value="${periodical.id}"/>"/>
                </div>
            </div>
            <div class="form-group">
                <label for="periodicalName" class="col-sm-3 control-label">
                    <fmt:message key="name.label" bundle="${langPeriodical}"/></label>
                <div class="col-sm-9">
                    <input id="periodicalName" type="text" class="form-control"
                           name="periodicalName"
                           value="<c:out value="${periodical.name}"/>"
                           placeholder="<fmt:message key="name.label" bundle="${langPeriodical}"/>"/>
                </div>
            </div>
            <div class="form-group">
                <label for="periodicalCategory" class="col-sm-3 control-label">
                    <fmt:message key="category.label" bundle="${langPeriodical}"/></label>
                <div class="col-sm-9">
                    <input id="periodicalCategory" type="text" class="form-control"
                           name="periodicalCategory"
                           value="<c:out value="${periodical.category}"/>"
                           placeholder="<fmt:message key="category.label" bundle="${langPeriodical}"/>"/>
                </div>
            </div>
            <div class="form-group">
                <label for="periodicalPublisher" class="col-sm-3 control-label">
                    <fmt:message key="publisher.label" bundle="${langPeriodical}"/></label>
                <div class="col-sm-9">
                    <input id="periodicalPublisher" type="text" class="form-control"
                           name="periodicalPublisher"
                           value="<c:out value="${periodical.publisher}"/>"
                           placeholder="<fmt:message key="publisher.label" bundle="${langPeriodical}"/>"/>
                </div>
            </div>
            <div class="form-group">
                <label for="periodicalDescription" class="col-sm-3 control-label">
                    <fmt:message key="description.label" bundle="${langPeriodical}"/></label>
                <div class="col-sm-9">
                    <textarea id="periodicalDescription" class="form-control" rows="3"
                              name="periodicalDescription"
                              placeholder="<fmt:message key="description.label" bundle="${langPeriodical}"/>">
                        <c:out value="${periodical.description}"/>
                    </textarea>
                </div>
            </div>
            <div class="form-group">
                <label for="periodicalCost" class="col-sm-3 control-label">
                    <fmt:message key="oneMonthCost.label" bundle="${langPeriodical}"/></label>
                <div class="col-sm-9">
                    <input id="periodicalCost" type="text" class="form-control"
                           name="periodicalCost"
                           value="<c:out value="${periodical.oneMonthCost}"/>"
                           placeholder="<fmt:message key="oneMonthCost.label" bundle="${langPeriodical}"/>"/>
                </div>
            </div>
            <div class="form-group">
                <label for="periodicalStatus" class="col-sm-3 control-label">
                    <fmt:message key="status.label" bundle="${langPeriodical}"/></label>
                <div class="col-sm-9">
                    <select id="periodicalStatus" class="form-control"
                            name="periodicalStatus">
                        <c:forEach items="${statuses}" var="status">
                            <option ${status == periodical.status ? 'selected' : ''}
                                    value="<c:out value='${status}'/>">
                                <c:out value='${status}'/>
                            </option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <button type="submit"
                    class="btn btn-lg btn-primary">
                <fmt:message key="savePeriodicalBtn.label" bundle="${langPeriodical}"/></button>
        </form>

    </div>

</div>

<%@include file="../../includes/footer.jsp" %>