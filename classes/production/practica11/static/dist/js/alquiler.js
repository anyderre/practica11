/**
 * Created by saleta on 10/5/2016.
 */

$( document ).ready(function() {

    $('#submit-alquiler').click( function() {
        $.get("/validar_existencia?id="+ $('#equipo').val(), function(data, status){
            if(data.valido){
                $('#form-alquiler').submit();
            }
            else{
                $('#mensaje-validacion').text(data.mensaje);
            }

        });
    });


});
