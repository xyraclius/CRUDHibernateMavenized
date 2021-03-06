<%@page import="java.util.ArrayList"%>
<%@page import="com.nabil.entity.MahasiswaEntity"%>
<%@page import="com.nabil.dao.MahasiswaDAO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">     
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">                   
        <link rel="stylesheet" type="text/css" href="css/build.css">     
        <link rel="stylesheet" type="text/css" href="css/sweetalert2.min.css">             

        <title>Halaman Tampil Data</title>
    </head>
    <body>
    <center><h1>Aplikasi Pembelajaran CRUD Java Web | Nabil Fawwaz Elqayyim</h1></center>
    <center>
        <a  href="MahasiswaController?insertID" class="fa fa-plus-circle btn btn-primary"> Tambah</a>
    </center>    
    <br>
    <div class=" col-md-7 col-md-offset-2">    
        <table class="table table-bordered table-striped table-hover">        
            <thead>
                <tr>
                    <th><i class="fa fa-list-ol"></i> ID</th>
                    <th><i class="fa fa-vcard"></i> Nama</th>
                    <th><i class="fa fa-group"></i> Kelas</th>            
                    <th><i class="fa fa-venus-mars"></i> Jenis Kelamin</th>  
                    <th><i class="fa fa-gears"></i> Aksi</th>
                </tr>
            </thead>

            <c:forEach items="<%= MahasiswaDAO.getAllMahasiswa()%>" var="show">
                <tr>
                    <td>${show.id}</td>
                    <td>${show.nama}</td>
                    <td>${show.kelas}</td>
                    <td>${show.jeniskelamin}</td>   
                    <td>                                                         
                        <a class="btn btn-success fa fa-pencil-square-o" href="MahasiswaController?editID=${show.id}"> Ubah </a>                                        
                        <a class="btn btn-danger fa fa-trash-o" id="deleteData" href="MahasiswaController?deleteID=${show.id}"> Hapus</a>   
                    </td>
                </tr>
            </c:forEach>           

            <tr>
                <td colspan="6">
            <center id="clearMessage">
                <font color="green">
                <c:if test="${sessionScope.sm != null}">
                    <c:out value="${sessionScope.sm}"/>
                    <c:remove scope="session" var="sm"/>
                </c:if>
                </font>

                <font color="red">
                <c:if test="${sessionScope.em != null}">
                    <c:out value="${sessionScope.em}"/>
                    <c:remove scope="session" var="em"/>
                </c:if>
                </font>
            </center>            
            </td>
            </tr>
        </table>

    </div>

    <script src="js/jquery.min.js"></script>
    <script src="js/sweetalert2.min.js"></script>   
    <script src="js/javascript.js"></script>
    <script>
        $('#deleteData').on('click', function () {
            var getLink = $(this).attr("href");              
            swal({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                focusConfirm: false,
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.value) {
                    swal(
                            'Deleted!',
                            'Your data has been deleted.',
                            'success'
                            );
                    window.location = getLink;
                }
            });
            return false;
        });

    </script>
</body>
</html>
