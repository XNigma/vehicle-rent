$(function () {

    function display(bool) {
        if (bool) {
            $("html").show();
        } else {
            $("html").hide();
        }
    }
    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type == "show") {
            if (item.status == true) {
                $("html").fadeIn();
                display(true)
            } else {
                display(false)
            }
        }
    })  

    window.addEventListener('message', function (event) {
        if (event.data.action == 'update') {
           let data = event.data.data;
               switch (event.data.type) {
                    case 'money': {
                       $('#money').html(`<span>Money: `+ data.value +`</span>`);                        
                       break;
                    }
               }
           }
       }
   );

    document.onkeyup = function (data) {
        if (data.which == 27) {
            $("html").fadeOut("slow");
            $.post('https://ng_vrent/close', JSON.stringify({}));
            return
        }
    };  

    $("#btn-car").click(function () {
        $.post('https://ng_vrent/car', JSON.stringify({}));
        return
    })

    $("#btn-moto").click(function () {
        $.post('https://ng_vrent/moto', JSON.stringify({}));
        return
    })

    $("#btn-bike").click(function () {
        $.post('https://ng_vrent/bike', JSON.stringify({}));
        return
    })
    
})