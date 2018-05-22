<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"\>
        <title>Welcome</title>
        <link rel="stylesheet" href="css/style.css" />
   </head>
   <body>
   <h1 class="restTitle" align="center">RESTfull Service</h1>
   <div align="right">
        <form action="goToMain" method="get">
             <input type="submit" value="Main page"/>
        </form>
   </div>
    <div>
        <form action="restAllUsers" method="get">
             <input type="submit" value="REST Get All Users"/>
        </form>
    </div>

    <div>
        <form action="restAllDepartments" method="get">
             <input type="submit" value="REST Get All Departments"/>
         </form>
    </div>


    <div class="form">
         <form method="post" action="restDelDepartment">

           <fieldset class="account-info" id="dep3">
             <legend class="dep1">Удалить департамент</legend>
             <label>
               id департамента
               <input type="number" name="id" placeholder="id департамента">
             </label>
           </fieldset>
           <fieldset class="account-action">
               <button type="submit" class="submit">Удалить</button>
           </fieldset>
         </form>
    </div>

    <div class="form">
         <form method="post" action="restAddDepartment">
           <fieldset class="account-info" id="dep3">
             <legend class="dep1">Добавить департамент</legend>
             <label>
               Название
               <input type="text" name="depName" placeholder="Название департамента">
               Описание
               <input type="text" name="description" placeholder="Описание">
             </label>
           </fieldset>
           <fieldset class="account-action">
               <button type="submit" class="submit">Добавить</button>
           </fieldset>
         </form>
    </div>

   </body>
</html>