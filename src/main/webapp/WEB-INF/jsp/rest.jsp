<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"\>
        <title>Welcome</title>
        <link rel="stylesheet" href="css/style.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script src="js/main.js"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
   </head>
   <body>
   <h1 class="restTitle" align="center">[RESTfull Service]</h1>
   <div align="right">
           <form action="goToMain" method="get">
                <input type="submit" value="Main page"/>
           </form>
      </div>
   <div align="center">
   <h2 align="center"><font color="white">USER REST END-POINTS</font></h2>
    <div>
        <form action="restAllUsers" method="get">
             <input type="submit" value="REST Get All Users"/>
        </form>
    </div>

    <div class="AddUserBlock">
               <div class="form" id="form1">
                 <form method="post" action="addUser">
                   <fieldset class="account-info">
                     <legend>Добавить пользователя</legend>
                     <label>
                       Имя
                       <input type="text" name="firstName" placeholder="Введите имя" required/>
                       Фамилия
                       <input type="text" name="lastName" placeholder="Введите фамилию" required/>
                       Отчество
                       <input type="text" name="middleName" placeholder="Введите отчество"/>
                       Дата рождения
                       <input type="date" name="date" placeholder="Введите дату рождения" required/>
                       Номер департамента
                       <input type="number" name="codeDepartment" placeholder="Введите код департамента"/>
                     </label>
                   </fieldset>
                   <fieldset class="account-action">
                       <button type="button" class="submit" id="button1">Добавить</button>
                   </fieldset>
                 </form>
               </div>

    <div class="AddUserBlock">
               <div class="form" id="form1">
                 <form method="post" action="rest_update_user">
                   <fieldset class="account-info">
                     <legend>Обновить пользователя</legend>
                     <label class="updateUserLabel">
                       id
                       <input type="number" name="id" placeholder="Введите id" required/>
                       Имя
                       <input type="text" name="firstName" placeholder="Введите имя" required/>
                       Фамилия
                       <input type="text" name="lastName" placeholder="Введите фамилию" required/>
                       Отчество
                       <input type="text" name="middleName" placeholder="Введите отчество"/>
                       Дата рождения
                       <input type="date" name="date" placeholder="Введите дату рождения" required/>
                       Номер департамента
                       <input type="number" name="codeDepartment" placeholder="Введите код департамента"/>
                     </label>
                   </fieldset>
                   <fieldset class="account-action">
                       <button type="button" class="submit" id="button_update_user">Обновить</button>
                   </fieldset>
                 </form>
               </div>

    <div class="FindUserBlock">
               <div class="form">
                 <form method="post" action="rest_find_by_id">
                   <fieldset class="account-info">
                     <legend>Поиск/Удаление пользователя</legend>
                     <label>
                       id пользователя
                     </span><input type="number" name="id" placeholder="Введите id записи">
                   </label>
                 </fieldset>
                 <fieldset class="account-action">
                     <button type="submit" class="submit" >Поиск</button>
                     <button type="submit" class="submit" formaction="rest_del_user">Удалить</button>
                 </fieldset>
               </form>
    </div>

    <div class="form">
                      <form method="post" action="rest_find_user_by_department">
                        <fieldset class="account-info">
                          <legend>Поиск по департаменту</legend>
                          <label>
                            Название департамента
                          <input type="text" name="nameDep" placeholder="Введите департамент">
                        </label>
                      </fieldset>
                      <fieldset class="account-action">
                          <button type="button" class="submit">Найти</button>
                      </fieldset>
                    </form>
                  </div>
    </div>

    <h2 align="center"><font color="white">DEPARTMENTS REST END-POINTS</font></h2>     <div>

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

    <div class="form">
                 <form method="post" action="restSetDepartmentForUser">
                   <fieldset class="account-info" id="dep3">
                     <legend class="dep1">Добавить департамент пользователю</legend>
                     <label>
                       id пользователя
                       <input type="number" name="idUser" placeholder="id пользователя">
                       id департамента
                       <input type="number" name="idDep" placeholder="id департамента">
                     </label>
                   </fieldset>
                   <fieldset class="account-action">
                       <button type="submit" class="submit">Добавить</button>
                   </fieldset>
                 </form>
    </div>
    </div>
   </body>
</html>