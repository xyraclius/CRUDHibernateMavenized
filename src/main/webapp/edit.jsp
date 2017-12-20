<%@page import="com.nabil.dao.MahasiswaDAO"%>
<%@page import="com.nabil.entity.MahasiswaEntity"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">     
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">     
        <link rel="stylesheet" type="text/css" href="css/bootstrap-datepicker3.min.css">     
        <link rel="stylesheet" type="text/css" href="css/build.css">      
        <title>Edit Page</title>
    </head>
    <body>
        <div class="col-md-4 col-md-offset-4">
            <form name="update_form" action="MahasiswaController" method="post">
                <center><h2>FORM UBAH DATA</h2></center>

                <c:set value="<%= MahasiswaDAO.findMahasiswa(Integer.parseInt(request.getParameter("id")))%>" var="get"/>
                <div class="form-group">                
                    <label for="ID">ID</label>                                        
                    <input required type="text" class="form-control" name="id" id="id" value="${get.id}" maxlength="5" readonly="readonly">
                </div>

                <div class="form-group">
                    <label for="Nama">Nama</label>
                    <input required type="text" class="form-control" name="nama" id="nama" value="${get.nama}" maxlength="25" onkeypress="return onlyAlphabets(event)">
                </div>

                <div class="form-group">
                    <label for="Kelas">Kelas</label>
                    <input required type="text" class="form-control" name="kelas" id="kelas" value="${get.kelas}" maxlength="3" onkeypress="return onlyNumeric(event)">
                </div>                                                                                 
                <div class="form-group">
                    <label class="radio" for="Jenis Kelamin" style="margin-left: -5%; margin-bottom: 3px">Jenis Kelamin</label>                  
                    <c:choose>
                        <c:when test="${get.jeniskelamin == 'Pria'}">
                            <div class="radio radio-danger radio-inline">
                                <input type="radio" name="jeniskelamin" id="Pria" value="Pria" checked><label for="Pria">Pria</label>
                            </div>
                            <div class="radio radio-danger radio-inline">
                                <input type="radio" name="jeniskelamin" id="Wanita" value="Wanita"><label for="Wanita">Wanita</label>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="radio radio-danger radio-inline">
                                <input type="radio" name="jeniskelamin" id="Pria" value="Pria"><label for="Pria">Pria</label>
                            </div>
                            <div class="radio radio-danger radio-inline">
                                <input type="radio" name="jeniskelamin" id="Wanita" value="Wanita" checked><label for="Wanita">Wanita</label>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>  
                <button type="submit" name="edit-data" class="btn btn-success col-md-6"><i class="fa fa-recycle"> Ubah</i></button>
                <a href="MahasiswaController?home" class="fa fa-close btn btn-danger col-md-6"> Batal</a>  
            </form>
        </div>
        <script type="text/javascript" src="js/javascript.js"></script>


    </body>
</html>
