<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">     
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">                             
        <link rel="stylesheet" type="text/css" href="css/build.css">     
        <link rel="stylesheet" type="text/css" href="css/sweetalert2.min.css">             

        <title>Insert Page</title>
    </head>

    <body>
    <center><h2>FORM TAMBAH DATA</h2></center>
    <div class="col-md-4 col-md-offset-4">
        <form action="MahasiswaController?insert-data" method="post" id="insert_form">
            <div class="form-group">       
                <div class="input-group">
                    <label for="ID">ID</label>
                    <input required class="form-control" name="id" id="id" placeholder="ID" maxlength="5" readonly>   
                    <span class="input-group-btn">
                        <button class="btn btn-info" type="button" onclick="getRandomInt()" style="margin-bottom: -25px">Hasilkan ID</button>
                    </span>
                </div>                    
            </div>

            <div class="form-group">               
                <label for="Nama">Nama</label>
                <input required type="text" class="form-control" name="nama" id="nama" placeholder="Nama" maxlength="25" onkeypress="return onlyAlphabets(event)">
            </div>

            <div class="form-group">
                <label for="Kelas">Kelas</label>
                <input required type="text" class="form-control" name="kelas" id="kelas" placeholder="Kelas" maxlength="3" onkeypress="return onlyNumeric(event)">
            </div>

            <div class="form-group">
                <label class="radio" for="Jenis Kelamin" style="margin-left: -5%; margin-bottom: 3px">Jenis Kelamin</label>
                <div class="radio radio-danger radio-inline">
                    <input type="radio" name="jeniskelamin" id="Pria" value="Pria"><label for="Pria">Pria</label>
                </div>
                <div class="radio radio-danger radio-inline">
                    <input type="radio" name="jeniskelamin" id="Wanita" value="Wanita"><label for="Wanita">Wanita</label>
                </div>
            </div>

            <button type="submit" class="btn btn-success col-md-6" id="saveData"><i class="fa fa-plus"> Tambah</i></button>
            <a href="MahasiswaController?home" class="fa fa-close btn btn-danger col-md-6"> Batal</a>            
        </form>
    </div>

    <script src="js/jquery.min.js"></script>
    <script src="js/sweetalert2.min.js"></script>   
    <script src="js/javascript.js"></script>
    <script>
                    $('#saveData').on('click', function () {
                        var form = $('#insert_form');
                        swal({
                            title: 'Save Data',
                            text: "Are you sure want to save this data?!",
                            type: 'warning',
                            showCancelButton: true,
                            confirmButtonColor: '#3085d6',
                            focusConfirm: false,
                            cancelButtonColor: '#d33',
                            confirmButtonText: 'Yes, save it!'
                        }).then((result) => {
                            if (result.value) {
                                swal(
                                        'Saved!',
                                        'Your data has been saved.',
                                        'success'
                                        );
                                form.submit();
                            }
                        });
                        return false;
                    });

    </script>
</body>   
</html>
