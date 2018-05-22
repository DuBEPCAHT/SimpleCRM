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
                                                        "<td><div align='center'><button class='iconDel' type='button' title='Удалить' onclick='del_by_id(" + objs[i].id + ")'/></div></td>" +
                                                 "</tr>");
                         }
                  }
            );
    };

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
                                                     "<td><div align='center'><button class='iconDel' type='button' title='Удалить' onclick='del_by_id_department(" + objs[i].id + ")'/></div></td>" +
                                              "</tr>");
                      }
                 }
            );
    };

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

function del_by_id_department(department_id){
var textId = $('#id_field_department').val();
             $.ajax({
                 url: 'http://localhost:8090/delDepartment',
                 method: 'POST',
                 data: {id: department_id},
                 }).then (function(data){
                    showAllDepartments();
                    }
                );
    }

$(document).ready(function() {
    showAllUsers();
    showAllDepartments();


    $('#find_all_users_rest').click(function(){
          showAllUsers();
    });

    $('#find_all_department_rest').click(function(){
           showAllDepartments();
    });

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


});


