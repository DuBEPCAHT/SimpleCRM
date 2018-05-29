// AJAX REST //

///////////////////////////////////////
/////////   UTIL FUNCTION    /////////
/////////////////////////////////////

//Генерирует таблицу со всеми User
function showAllUsers() {
        $.ajax({
              url: "http://localhost:8090/restAllUsers",
              }).then (function(data){
                 console.log(data);
                 $('#table3 .UserDB').remove();
                 var objs = data;
                 for(var i= 0; i < objs.length; i++){
                     $('#table3').append("<tr class='UserDB'>" +
                                                "<td>" + objs[i].id + "</td>" +
                                                "<td>" + objs[i].firstName + "</td>" +
                                                "<td>" + objs[i].lastName + "</td>" +
                                                "<td>" + objs[i].middleName + "</td>" +
                                                "<td>" + objs[i].date + "</td>" +
                                                "<td>" + objs[i].departmentId + "</td>" +
                                                "<td>"+
                                                "<div align='center'><button class='iconDel' type='button' title='Удалить' onclick='del_by_id(" + objs[i].id + ")'/></div>" +
                                                "</td>" +
                                                "<td>"+
                                                "<div align='center'><button class='iconUpd' type='button' title='Обновить пользователя' onclick='upd_by_id_user(" + objs[i].id + ","
                                                                                                                                     + "\"" + objs[i].firstName + "\""  + ","
                                                                                                                                     + "\"" + objs[i].lastName  + "\"" + ","
                                                                                                                                     + "\"" + objs[i].middleName  + "\"" + ","
                                                                                                                                     + "\"" + objs[i].date  + "\"" + ","
                                                                                                                                     + "\"" + objs[i].departmentId  + "\"" + ","
                                                                                                                                     + (i) + ")'/></div>" +
                                                "</td>" +
                                         "</tr>");
                 }
          }
    );
}

//Генерирует строку в таблице для обновлени юзера по id
function upd_by_id_user(uId, uFirstName, uLastName, uMiddleName, uDate, uDepartmentId, columnNumber){
    $(".UserDB:eq(" + columnNumber + ")").replaceWith(
        "<tr class='UserDB'>" +
             "<td id='uIdUpdate'>" + uId + "</td>" +
             "<td id='uFNameUpdate'>" + "<input type='text' name='firstName' value='" + uFirstName + "'>" + "</td>" +
             "<td id='uLNameUpdate'>" + "<input type='text' name='lastName' value='" + uLastName + "'>" + "</td>" +
             "<td id='uMNameUpdate'>" + "<input type='text' name='middleName' value='" + uMiddleName + "'>" + "</td>" +
             "<td id='uDateUpdate'>" + "<input type='date' name='date' value='" + uDate + "'>" + "</td>" +
             "<td id='uDepIdUpdate'>" + "<input type='number' name='departmentId' value='" + uDepartmentId + "'>" + "</td>" +
             "<td>" +
             "<div align='center'><button class='yesUpdateDep' type='button' title='Обновить пользователя' onclick='applyUpdUser()'/></div>" +
             "</td>" +
             "<td>" +
             "<div align='center'><button class='noUpdateDep' type='button' title='Не обновлять пользователя' onclick='notApplyUpdUser()'/></div>" +
             "</td>" +
        "</tr>"
    );
}

//Нажатие кнопки обновить юзера(птичка)
function applyUpdUser(){
      var uid = $( "td#uIdUpdate" ).text();
      var fname = $( "td#uFNameUpdate input[name='firstName']" ).val();
      var lname = $( "td#uLNameUpdate input[name='lastName']" ).val();
      var mname = $( "td#uMNameUpdate input[name='middleName']" ).val();
      var udate = $( "td#uDateUpdate input[name='date']" ).val();
      var cdep = $( "td#uDepIdUpdate input[name='departmentId']" ).val();
         $.ajax({
             url: 'http://localhost:8090/rest_update_user',
             method: 'POST',
             data: {id: uid, firstName: fname, lastName: lname, middleName: mname, date: udate, codeDepartment: cdep},
             }).then (function(data){
                         showAllUsers();
                     }
              );
}


//Нажатие кнопки не обновлять юзера(крестик)
function notApplyUpdUser(){
    showAllUsers();
}
//Генерирует таблицу со всеми Department
function showAllDepartments() {
    $.ajax({
           url: "http://localhost:8090/restAllDepartments",
           }).then (function(data){
              console.log(data);
              $('#table2 #dep4del').remove();
              var objs = data;
              for(var i= 0; i < objs.length; i++){
                  $('#table2').append("<tr class='dep4' id='dep4del'>" +
                                             "<td>" + objs[i].id + "</td>" +
                                             "<td>" + objs[i].depName + "</td>" +
                                             "<td>" + objs[i].description + "</td>" +
                                              "<td>"+
                                              "<div align='center'><button class='iconDel' type='button' title='Удалить' onclick='del_by_id_department(" + objs[i].id + ")'/></div>"+
                                              "</td>" +
                                              "<td>"+
                                              "<div align='center'><button class='iconUpd' type='button' title='Обновить департамент' onclick='upd_by_id_department(" + objs[i].id + ","
                                                                                                                                                               + "\"" + objs[i].depName + "\""  + ","
                                                                                                                                                               + "\"" + objs[i].description  + "\"" + ","
                                                                                                                                                               + (i+1) + ")'/></div>"+
                                              "</td>" +
                                      "</tr>");
              }
         }
    );
};
//Удаляет User по id
function del_by_id(user_id){
var textId = $('#id_field_find_user').val();
             $.ajax({
                 url: 'http://localhost:8090/rest_del_user',
                 method: 'POST',
                 data: {id: user_id},
                 }).then (function(data){
                    showAllUsers();
                    }
                );
    }
//Удаляет Department по id
function del_by_id_department(department_id){
var textId = $('#id_field_department').val();
             $.ajax({
                 url: 'http://localhost:8090/restDelDepartment',
                 method: 'POST',
                 data: {id: department_id},
                 }).then (function(data){
                    showAllDepartments();
                    showAllUsers();
                    }
                );
    }


//Генерирует строку в таблице для обновлени департамент по id
function upd_by_id_department(departmentId, depName, description, columnNumber){
    $(".dep4:eq(" + columnNumber + ")").replaceWith(
        "<tr class='dep4' id='dep4del'>" +
             "<td id='depIdUpdate' abbr='id'>" + departmentId + "</td>" +
             "<td id='depNameUpdate'>" + "<input type='text' name='depName' value='" + depName + "'>" + "</td>" +
             "<td id='depDescriptionUpdate'>" + "<input type='text' name='depDescription' value='" + description + "'>" + "</td>" +
             "<td>" +
             "<div align='center'><button class='yesUpdateDep' type='button' title='Обновить департамент' onclick='applyUpdDep()'/></div>" +
             "</td>" +
             "<td>" +
             "<div align='center'><button class='noUpdateDep' type='button' title='Не обновлять департамент' onclick='notApplyUpdDep()'/></div>" +
             "</td>" +
        "</tr>"
    );
}
//Нажатие кнопки обновить департамент(птичка)
function applyUpdDep(){
    var did = $("td#depIdUpdate").text();
    var dName = $("td#depNameUpdate input[name='depName']").val();
    var description = $("td#depDescriptionUpdate input[name='depDescription']").val();
    $.ajax({
         url: 'http://localhost:8090/restUpdateDep',
         method: 'POST',
         data: {id: did, depName: dName, depDescription: description},
         }).then (function(data){
                     showAllDepartments();
                 }
          );
}
//Нажатие кнопки не обновлять департамент(крестик)
function notApplyUpdDep(){
    showAllDepartments();
}

function saveUserPDF(){
    $.ajax({
                      url: "http://localhost:8090/restAllUsers",
                      }).then (function(data){
                         var objs = data;
                         var columns = ["ID", "First Name", "Last Name", "Middle Name", "Date", "Department ID"];
                         var rows = [];
                         for(var i= 0; i < objs.length; i++){
                            rows[i] = [objs[i].id, objs[i].firstName, objs[i].lastName, objs[i].middleName, objs[i].date, objs[i].departmentId];
                         }
                         var doc = new jsPDF('p', 'pt');
                         doc.autoTable(columns, rows);
                         doc.save('user_table.pdf');
                  }
            );
}
function saveDepartmentPDF(){
    $.ajax({
                      url: "http://localhost:8090/restAllDepartments",
                      }).then (function(data){
                         var objs = data;
                         var columns = ["ID", "Name", "Description"];
                         var rows = [];
                         for(var i= 0; i < objs.length; i++){
                            rows[i] = [objs[i].id, objs[i].depName, objs[i].description];
                         }
                         var doc = new jsPDF('p', 'pt');
                         doc.autoTable(columns, rows);
                         doc.save('department_table.pdf');
                  }
            );
}


///////// EVENTS ////////
$(document).ready(function() {
    showAllUsers();
    showAllDepartments();

///////////////////////////////
/////////   USER     /////////
/////////////////////////////

    //Получить всех Users
    $('#find_all_users_rest').click(function(){
          showAllUsers();
    });

    //Получить User по id
     $('#find_user_by_id_rest').click(function(){
     var textId = $('#id_field_find_user').val();
        $.ajax({
            url: 'http://localhost:8090/rest_find_user_by_id',
            method: 'POST',
            data: {id: textId}
            }).then (function(data){
                           $('#table3 .UserDB').remove();
                           var objs = data;
                           for(var i= 0; i < objs.length; i++){
                               $('#table3').append("<tr class='UserDB'>" +
                                                          "<td>" + objs[i].id + "</td>" +
                                                          "<td>" + objs[i].firstName + "</td>" +
                                                          "<td>" + objs[i].lastName + "</td>" +
                                                          "<td>" + objs[i].middleName + "</td>" +
                                                          "<td>" + objs[i].date + "</td>" +
                                                          "<td>" + objs[i].departmentId + "</td>" +
                                                           "<td><div align='center'><button class='iconDel' type='button' title='Удалить' onclick='del_by_id(" + objs[i].id + ")'/></div></td>" +
                                                   "</tr>");
                           }
                    }
             );
     });

    //Удаляет User по id
     $('#del_user_by_id').click(function(){
          var textId = $('#id_field_find_user').val();
             $.ajax({
                 url: 'http://localhost:8090/rest_del_user',
                 method: 'POST',
                 data: {id: textId},
                 }).then (function(data){
                    showAllUsers();
                    }
                );
          });

    //Добавляет нового User
     $('#button1').click(function(){
          var fname = $( "input[name='firstName']" ).val();
          var lname = $( "input[name='lastName']" ).val();
          var mname = $( "input[name='middleName']" ).val();
          var udate = $( "input[name='date']" ).val();
          var cdep = $( "input[name='codeDepartment']" ).val();
             $.ajax({
                 url: 'http://localhost:8090/restAddUser',
                 method: 'POST',
                 data: {firstName: fname, lastName: lname, middleName: mname, date: udate, codeDepartment: cdep},
                 }).then (function(data){
                             showAllUsers();
                         }
                  );
          });

    //Получпет всех Users по установленному Department
     $('#button_find_user_by_department').click(function(){
               var dep = $( "input[name='nameDep']" ).val();
                  $.ajax({
                      url: 'http://localhost:8090/find_by_department',
                      method: 'POST',
                      data: {nameDep: dep},
                      }).then (function(data){
                           $('#table3 .UserDB').remove();
                           var objs = data;
                           for(var i= 0; i < objs.length; i++){
                               $('#table3').append("<tr class='UserDB'>" +
                                                          "<td>" + objs[i].id + "</td>" +
                                                          "<td>" + objs[i].firstName + "</td>" +
                                                          "<td>" + objs[i].lastName + "</td>" +
                                                          "<td>" + objs[i].middleName + "</td>" +
                                                          "<td>" + objs[i].date + "</td>" +
                                                          "<td>" + objs[i].departmentId + "</td>" +
                                                           "<td><div align='center'><button class='iconDel' type='button' title='Удалить' onclick='del_by_id(" + objs[i].id + ")'/></div></td>" +
                                                   "</tr>");
                                    }
                              }
                       );
               });

    //Скачать PDF таблицу пользователей
    $('#saveUserPDF').click(function () {
        saveUserPDF();
    });


///////////////////////////////////
/////////   DEPARTMENTS  /////////
/////////////////////////////////

    //Получить все Departments
     $('#find_all_department_rest').click(function(){
          showAllDepartments();
     });

    //Добавить департамет
    $('#button_add_department').click(function(){
          var dname = $( "input[name='depName']" ).val();
          var desc = $( "input[name='description']" ).val();
             $.ajax({
                 url: 'http://localhost:8090/restAddDepartment',
                 method: 'POST',
                 data: {depName: dname, description: desc},
                 }).then (function(data){
                             showAllDepartments();
                         }
                  );
          });

    //Связать департамент с пользователем
    $('#button_department_for_user').click(function(){
          var uId = $( "input[name='idUser']" ).val();
          var dId = $( "input[name='idDep']" ).val();
             $.ajax({
                 url: 'http://localhost:8090/restSetDepartmentForUser',
                 method: 'POST',
                 data: {idUser: uId, idDep: dId},
                 }).then (function(data){
                             showAllUsers();
                         }
                  );
          });

    //Скачать PDF таблицу департаментов
    $('#saveDepartmentPDF').click(function () {
        saveDepartmentPDF();
    });

});


