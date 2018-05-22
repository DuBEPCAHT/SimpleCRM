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
   <div align="right">
    <form action="logout" method="post">
       <input type="submit" value="Sign Out"/>
     </form>
     <form action="rest" method="get">
                  <input type="submit" value="RESTfull Service"/>
      </form>
   </div>
     <div class="main">
       <div class="mainUserBlock">
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
                   <button type="submit" class="submit" id="button1">Добавить</button>
               </fieldset>
             </form>
           </div>
         </div>

         <div class="FindUserBlock">
           <div class="form">
             <form method="post" action="find_by_id">
               <fieldset class="account-info">
                 <legend>Поиск/Удаление пользователя</legend>
                 <label>
                   id пользователя
                 </span><input type="number" name="id" placeholder="Введите id записи">
               </label>
             </fieldset>
             <fieldset class="account-action">
                 <button type="submit" class="submit">Поиск</button>
                 <button type="submit" class="submit" formaction="del">Удалить</button>
             </fieldset>
           </form>
         </div>

         <div class="form">
                      <form method="post" action="find_by_department">
                        <fieldset class="account-info">
                          <legend>Поиск по департаменту</legend>
                          <label>
                            Название департамента
                          <input type="text" name="nameDep" placeholder="Введите департамент">
                        </label>
                      </fieldset>
                      <fieldset class="account-action">
                          <button type="submit" class="submit">Найти</button>
                      </fieldset>
                    </form>
                  </div>
       </div>

       <div class="UserTableMain">
         <table class="table" id="table3">
           <caption>Список пользователей</caption>
           <tr>
             <th>id</th>
             <th>Имя</th>
             <th>Фамилия</th>
             <th>Отчество</th>
             <th>Дата рождения</th>
             <th>Департамент</th>
           </tr>
           <c:forEach items="${users}" var ="users">
           <tr>
             <td>${users.id}</td>
             <td>${users.firstName}</td>
             <td>${users.lastName}</td>
             <td>${users.middleName}</td>
             <td>${users.date}</td>
             <td>${users.departmentId}</td>
           </tr>
         </c:forEach>
       </table>
     </div>
   </div>



   <div class="departmentMain">

   <div class="form">
     <form method="post" action="addDepartment">
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
     <form method="post" action="delDepartment">

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
             <form method="post" action="setDepartmentForUser">
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

     <div class="departmentTable">

       <table class="table" id="table2">
         <caption class="dep2">Департаменты</caption>
         <tr class="dep4">
           <th>id</th>
           <th>Название</th>
           <th>Описание</th>
         </tr>
         <c:forEach  items="${departments}" var ="departments">
         <tr class="dep4">
           <td>${departments.id}</td>
           <td>${departments.depName}</td>
           <td>${departments.description}</td>
         </tr>
       </c:forEach>
     </table>
       </div>

   </div>
   </div>
   </body>

</html>