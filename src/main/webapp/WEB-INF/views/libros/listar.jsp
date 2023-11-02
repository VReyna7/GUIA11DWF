<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="S" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Lista de libros</title>
    <jsp:include page="/WEB-INF/views/cabecera.jsp"/>
</head>
<body>
<jsp:include page="/WEB-INF/views/menu.jsp"/>
    <div class="container">
        <div class="row">
            <h3>Lista de libros</h3>
        </div>
        <div class="row">
            <div class="col-md-12">
                <a class="btn btn-primary btn-md" href="<s:url value="/libros/create"/>"><s:message code="libros.nuevo"/></a>
                <br><br>
                <table class="table table-striped table-bordered table-hover" id="tabla">
                    <thead>
                    <tr>
                        <th><s:message code="libros.codigo"/></th>
                        <th><s:message code="libros.nombre"/></th>
                        <th><s:message code="libros.existencias"/></th>
                        <th><s:message code="libros.precio"/></th>
                        <th><s:message code="editorial.nombre"/></th>
                        <th><s:message code="autor.nombre"/></th>
                        <th><s:message code="genero.nombre"/></th>
                        <th><s:message code="operaciones"/></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listaLibros}" var="libro">
                        <tr>
                            <td>${libro.codigoLibro}</td>
                            <td>${libro.nombreLibro}</td>
                            <td>${libro.existencias}</td>
                            <td>${libro.precio}</td>
                            <td>${libro.editorialesByCodigoEditorial.nombreEditorial}</td>
                            <td>${libro.autoresByCodigoAutor.nombreAutor}</td>
                            <td>${libro.generosByIdGenero.nombreGenero}</td>
                            <td style="display: flex; flex-direction: row">
                                <a class="btn btn-primary" href="<s:url value="/libros/edit/${libro.codigoLibro}"/>">
                                    <span class="glyphicon glyphicon-edit"></span>
                                    <s:message code="editar"/>
                                </a>
                                <a class="btn btn-danger" href="javascript:eliminar('${libro.codigoLibro}')">
                                    <span class="glyphicon glyphicon-trash"></span>
                                    <s:message code="eliminar"/>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
<script>

    $(document).ready(function(){
        $('#tabla').dataTable( {
            "language": {
                "url": "https://cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
            }
        });
    });
    function eliminar(id){
        alertify.confirm("Realmente desea eliminar este libro?", function (e){
            if(e){
                location.href="delete/"+id;
            }
        });
    }
</script>
</body>
</html>