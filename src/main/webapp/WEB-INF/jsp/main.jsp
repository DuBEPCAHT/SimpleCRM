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
                 <legend>Add User</legend>
                 <label>
                   First name
                   <input type="text" name="firstName" placeholder="first name" required/>
                   Last name
                   <input type="text" name="lastName" placeholder="last name" required/>
                   Middle name
                   <input type="text" name="middleName" placeholder="middle name"/>
                   Birthday date
                   <input type="date" name="date" placeholder="date" required/>
                   Department number
                   <input type="number" name="codeDepartment" placeholder="number"/>
                 </label>
               </fieldset>
               <fieldset class="account-action">
                   <button type="button" class="submit" id="button1">Add</button>
               </fieldset>
             </form>
           </div>
         </div>

         <div class="FindUserBlock">
           <div class="form">
             <form>
               <fieldset class="account-info">
                 <legend>Find User</legend>
                 <label>
                   User ID
                 </span><input type="number" name="id" id="id_field_find_user" placeholder="user id">
               </label>
             </fieldset>
             <fieldset class="account-action">
                 <button type="button" class="submit" id="find_user_by_id_rest">Find</button>
             </fieldset>
           </form>
         </div>

         <div class="form">
                      <form>
                        <fieldset class="account-info">
                          <legend>Find User by Department</legend>
                          <label>
                            Department name
                          <input type="text" name="nameDep" placeholder="department name">
                        </label>
                      </fieldset>
                      <fieldset class="account-action">
                          <button type="button" class="submit" id="button_find_user_by_department">Find</button>
                      </fieldset>
                    </form>
                  </div>
       </div>

       <div class="UserTableMain">
         <table class="table" id="table3">
           <caption>Users
            <button type="button" id="find_all_users_rest"/>
            <button type="button" id="saveUserPDF"/>
           </caption>
           <tr>
             <th>id</th>
             <th>First name</th>
             <th>Last name</th>
             <th>Middle name</th>
             <th>Birthday date</th>
             <th>Department</th>
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
         <legend class="dep1">Add Department</legend>
         <label>
           Department name
           <input type="text" name="depName" placeholder="name">
           Description
           <input type="text" name="description" placeholder="description">
         </label>
       </fieldset>
       <fieldset class="account-action">
           <button type="button" class="submit" id="button_add_department">Add</button>
       </fieldset>
     </form>
   </div>

   <div class="form">
             <form>
               <fieldset class="account-info" id="dep3">
                 <legend class="dep1">Add Department to User</legend>
                 <label>
                   User ID
                   <input type="number" name="idUser" placeholder="user id">
                   Department ID
                   <input type="number" name="idDep" placeholder="department id">
                 </label>
               </fieldset>
               <fieldset class="account-action">
                   <button type="button" class="submit" id="button_department_for_user">Add</button>
               </fieldset>
             </form>
        </div>

     <div class="departmentTable">

       <table class="table" id="table2">
         <caption class="dep2">
         Departments
         <button type="button"  id="find_all_department_rest"/>
         <button type="button" id="saveDepartmentPDF"/>
         </caption>
         <tr class="dep4">
           <th>id</th>
           <th>Name</th>
           <th>Description</th>
           <th></th>
           <th></th>
         </tr>
     </table>
       </div>

   </div>
   </div>
   </body>

</html>