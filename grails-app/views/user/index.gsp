<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-user" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>

            <table>
                <thead>
                <tr>
                    <th class="sortable"><a href="/user/index?sort=username&amp;max=10&amp;order=asc">Username</a></th>
                    <th class="sortable"><a href="/user/index?sort=email&amp;max=10&amp;order=asc">Email</a></th>
                    <th class="sortable"><a href="/user/index?sort=tel&amp;max=10&amp;order=asc">Tel</a></th>
                    <th></th>
                    <th></th>
                    <th class="sortable"><a href="/user/index?sort=tel&amp;max=10&amp;order=asc">Role</a></th>
                </tr>
                </thead>
                <tbody>
                    <g:each in="${userList}" var="user">
                        <tr class="even">
                            <td><g:link controller="user" action="show" id="${user.id}">${user.username}</g:link></td>
                            <td>${user.email}</td>
                            <td>${user.tel}</td>
                            <td><button><g:link controller="user" action="edit" id="${user.id}">Modifier</g:link></button></td>
                            <td><button onclick="return confirm('Etes-vous sûr?')"><g:link controller="user" action="delete" id="${user.id}">Supprimer</g:link></button></td>
                            <g:each in="${user.getAuthorities()}" var="userRole">
                                <td>${userRole.authority}</td>
                            </g:each>
                        </tr>
                    </g:each>
                </tbody>
            </table>

            <div class="pagination">
                <g:paginate total="${userCount ?: 0}" />
            </div>
        </div>
    </body>
</html>