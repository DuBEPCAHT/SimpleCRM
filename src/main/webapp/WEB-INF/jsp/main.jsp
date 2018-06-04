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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.5/jspdf.debug.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/2.3.3/jspdf.plugin.autotable.js"></script>
   </head>
   <body>
   <div align="right">
    <form action="logout" method="post">
       <input class="signOutButton" type="submit" value="Sign Out"/>
     </form>
   </div>
     <div class="main">
       <div class="mainUserBlock">
         <div class="AddUserBlock">
           <div class="form" id="form1">
             <form>
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
         </div>

         <div class="FindUserBlock">
           <div class="form">
             <form>
               <fieldset class="account-info">
                 <legend>Поиск пользователя</legend>
                 <label>
                   id пользователя
                 </span><input type="number" name="id" id="id_field_find_user" placeholder="Введите id записи">
               </label>
             </fieldset>
             <fieldset class="account-action">
                 <button type="button" class="submit" id="find_user_by_id_rest">Поиск</button>
             </fieldset>
           </form>
         </div>

         <div class="form">
                      <form>
                        <fieldset class="account-info">
                          <legend>Поиск по департаменту</legend>
                          <label>
                            Название департамента
                          <input type="text" name="nameDep" placeholder="Введите департамент">
                        </label>
                      </fieldset>
                      <fieldset class="account-action">
                          <button type="button" class="submit" id="button_find_user_by_department">Найти</button>
                      </fieldset>
                    </form>
                  </div>
       </div>

       <div class="UserTableMain">
         <table class="table" id="table3">
           <caption>Список пользователей
            <button type="button" id="find_all_users_rest"/>
            <button type="button" id="saveUserPDF"/>
           </caption>
           <tr>
             <th>id</th>
             <th>Имя</th>
             <th>Фамилия</th>
             <th>Отчество</th>
             <th>Дата рождения</th>
             <th>Департамент</th>
             <th></th>
             <th></th>
           </tr>

       </table>
     </div>
   </div>



   <div class="departmentMain">

   <div class="form">
     <form>
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
           <button type="button" class="submit" id="button_add_department">Добавить</button>
       </fieldset>
     </form>
   </div>

   <div class="form">
             <form>
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
                   <button type="button" class="submit" id="button_department_for_user">Добавить</button>
               </fieldset>
             </form>
        </div>

     <div class="departmentTable">

       <table class="table" id="table2">
         <caption class="dep2">
         Департаменты
         <button type="button"  id="find_all_department_rest"/>
         <button type="button" id="saveDepartmentPDF"/>
         </caption>
         <tr class="dep4">
           <th>id</th>
           <th>Название</th>
           <th>Описание</th>
           <th></th>
           <th></th>
         </tr>
     </table>
       </div>

   </div>
   </div>
   </body>

</html>