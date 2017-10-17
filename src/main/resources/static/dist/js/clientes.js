/**
 *  Created by Dany 13/10/2017
 */
$( document ).ready(function() {
    $('.buscar-clientes').click(function () {
        $.get("/clientes/", function(data, status){
            $('.clientes').empty();
            alert("There")
            data.forEach(function (doc) {
                alert(doc);
                console.log(doc)
                $('.clientes').append($('<option>', {
                    value: doc.cedula,
                    text: doc.nombre +" " +doc.apellido
                }));
            })
        });
    });


});