<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Editar libro</title>
    <jsp:include page="/WEB-INF/views/cabecera.jsp"/>
</head>
<body>
<jsp:include page="/WEB-INF/views/menu.jsp"/>
<div class="container">
    <div class="row">
        <h3>Editar editorial</h3>
    </div>
    <div class="row">
        <div class=" col-md-7">
            <f:form action="edit" modelAttribute="libro" method="post">
                <f:errors path="*" element="div" cssClass="alert alert-danger" />
                <div class="well well-sm"><strong><span class="glyphicon glyphicon-asterisk"></span>Campos requeridos</strong></div>
                <div class="form-group">
                    <label for="codigoLibro"><s:message code="libros.codigo"/></label>
                    <div class="input-group">
                        <f:input path="codigoLibro" cssClass="form-control" readonly="true"/>
                        <span class="input-group-addon"><span
                                class="glyphicon glyphicon-asterisk"></span></span>
                    </div>
                    <f:errors path="codigoLibro" cssClass="alert alert-danger" />
                </div>
                <div class="form-group">
                    <label for="nombreLibro"><s:message code="libros.nombre"/></label>
                    <div class="input-group">
                        <f:input path="nombreLibro" cssClass="form-control"/>
                        <span class="input-group-addon"><span
                                class="glyphicon glyphicon-asterisk"></span></span>
                    </div>
                    <f:errors path="nombreLibro" cssClass="alert alert-danger" />
                </div>
                <div class="form-group">
                    <label for="existencias"><s:message code="libros.existencias"/>:</label>
                    <div class="input-group">
                        <f:input path="existencias" cssClass="form-control" type="number"/>
                        <span class="input-group-addon"><span
                                class="glyphicon glyphicon-asterisk"></span></span>
                    </div>
                    <f:errors path="existencias" cssClass="alert alert-danger" />
                </div>
                <div class="form-group">
                    <label for="precio"><s:message code="libros.precio"/>:</label>
                    <div class="input-group">
                        <f:input path="precio" cssClass="form-control" type="number"/>
                        <span class="input-group-addon"><span
                                class="glyphicon glyphicon-asterisk"></span></span>
                    </div>
                    <f:errors path="precio" cssClass="alert alert-danger" />
                </div>
                <div class="form-group">
                    <label for="autor"><s:message code="autor.nombre"/>:</label>
                    <div class="input-group">
                        <f:select path="autoresByCodigoAutor.codigoAutor" cssClass="form-control" id="autor">
                            <f:options items="${listaAutores}"
                                       itemLabel="nombreAutor"
                                       itemValue="codigoAutor"/>
                        </f:select>
                        <span class="input-group-addon"><span
                                class="glyphicon glyphicon-asterisk"></span></span>
                    </div>
                </div>
                <div class="form-group">
                    <label
                            for="editorialesByCodigoEditorial.codigoEditorial"><s:message code="editorial.nombre"/>:</label>
                    <div class="input-group">
                        <f:select path="editorialesByCodigoEditorial.codigoEditorial" cssClass="form-control">
                            <f:options items="${listaEditoriales}"
                                       itemLabel="nombreEditorial"
                                       itemValue="codigoEditorial"/>
                        </f:select>
                        <span class="input-group-addon"><span
                                class="glyphicon glyphicon-asterisk"></span></span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="generosByIdGenero.idGenero"><s:message code="genero.nombre"/>:</label>
                    <div class="input-group">
                        <f:select path="generosByIdGenero.idGenero"
                                  cssClass="form-control">
                            <f:options items="${listaGeneros}"
                                       itemLabel="nombreGenero"
                                       itemValue="idGenero"/>
                        </f:select>
                        <span class="input-group-addon"><span
                                class="glyphicon glyphicon-asterisk"></span></span>
                    </div>
                </div>
                <f:button class="btn btn-info"><s:message code="guardar"/></f:button>
                <a class="btn btn-danger" href="<s:url value="/libros/list"/>"><s:message code="cancelar"/></a>
            </f:form>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/views/pie.jsp"/>
</body>
</html>
