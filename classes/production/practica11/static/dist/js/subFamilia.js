/**
 * Created by Dany 13/10/2017
 */

$( document ).ready(function() {
    $.get("/subfamilias?id="+ $('#familia').val(), function(data, status){
         $('#sub-familia').empty();
        // $('#sub-familia').find('option').removeClass('selected')
        data.forEach(function (sub) {

            var selected = parseInt(sub.id) === parseInt($('#sub-familia').val());
            console.log(sub);
            // console.log(sub.id);
            //
            $('#sub-familia').append($('<option>', {
                value: sub.id,
                text: sub.nombre
                 // selected: selected
                // overflow: hidden

            }));
        })
    });

    $('#familia').on('change', function() {
        $.get("/subfamilias?id="+ $('#familia').val(), function(data, status){
            $('#sub-familia').empty();
            data.forEach(function (sub) {
                var html = '<option value="'+data.id+'" >'+data.nombre+'</option>';
                $('#sub-familia').append($('<option>', {
                    value: sub.id,
                    text: sub.nombre
                }));
            })
        });
    });


});
