<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
<html>
<head>
<title>Login Page</title>
<style>

.box {
    width:20%;
    height:200px;
    background:#FFF;
    margin:40px auto;
    margin-top: 250px;
}

h1 {
    font-family: monospace;
}


.effect7
{
    background-color: honeydew;
    content:"";
    z-index:-1;
    -webkit-box-shadow:0 0 20px rgba(0,0,0,0.8);
    -moz-box-shadow:0 0 20px rgba(0,0,0,0.8);
    box-shadow:0 0 20px rgba(0,0,0,0.8);
    top:0;
    bottom:0;
    left:10px;
    right:10px;
    -moz-border-radius:100px / 10px;
    border-radius:100px / 10px;
}

</style>
</head>
<body>
    <div>
        <div id="box" class="box effect7">
        <h1 align="center">Authorization</h1>
            <div align="center">
                <a href="google"><img src="https://api.icons8.com/download/f772747c534ee02e104c27e01512297f70a5bf44/Color/PNG/512/Logos/google_plus-512.png" width="100"  border="0" alt="google"></a>
            </div>
        </div>
	</div>

</body>
</html>