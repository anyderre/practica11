/**
 *  Created by Dany 16/10/2017
 */

$( document ).ready(function() {
        $.get("/sub_familias/", function(data, status){
                var headers = [];
                var values = [];
            data.forEach(function (d) {
                headers.push(d[1]);
                values.push(parseFloat(d[0]).toPrecision(4));

            });
            var max = Math.ceil(Math.max(values));
            console.log(max);
            $("#demo").jChart({
                name: "Promedios de duracion de alquiler por subfamilia",
                headers: headers,
                values: values,
                footers: [max/4,max/2,max*(3/4),max],
                colors: ["#1000ff","#006eff","#00b6ff","#00fff6","#00ff90"]
            });
        });

    $.get("/familias/", function(data, status){
        var headers = [];
        var values = [];
        data.forEach(function (d) {
            headers.push(d[1]);
            values.push(parseFloat(d[0]).toPrecision(4));

        });
        var max = Math.ceil(Math.max(values));
        console.log(max);
        $("#demo2").jChart({
            name: "Promedios de duracion de alquiler por familia",
            headers: headers,
            values: values,
            footers: [max/4,max/2,max*(3/4),max],



            colors: ["#1000ff","#006eff","#00b6ff","#00fff6","#00ff90"]
        });



    });




});
