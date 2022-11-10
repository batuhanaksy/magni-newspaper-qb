$(document).ready(function(){

    $('.container').css('display', 'none');
    $('.edit').css('display', 'none');
    hide2();

    window.addEventListener("message", function(event){
        var data = event.data
        if (data.action == 'open') {
            $(".container").fadeIn(500);
            var img1 = ($('#img1').attr('src'))
            $('#img1').attr('src',data.ss);
            var img2 = ($('#img2').attr('src'))
            $('#img2').attr('src',data.ss1);
            var img3 = ($('#img3').attr('src'))
            $('#img3').attr('src',data.ss2);
            document.getElementById("time").innerHTML = data.time
            document.getElementById("fpheader").innerHTML = data.fpheader
            document.getElementById("fpnews").innerHTML = data.fpnews
            document.getElementById("spheader").innerHTML = data.spheader
            document.getElementById("spnews").innerHTML = data.spnews
            document.getElementById("tpheader").innerHTML = data.tpheader
            document.getElementById("tpnews").innerHTML = data.tpnews

        }else {
            $(".edit").fadeIn(500);
            $(".editfp").fadeIn(500);
            $(".editsp").fadeIn(500);
            $(".edittp").fadeIn(500);
            $("#secondpageheader").fadeIn(500);
            $("#thirdpageheader").fadeIn(500);
            $("#firstpageheader").fadeIn(500);
            $("#secondpagenews").fadeIn(500);
            $("#thirdpagenews").fadeIn(500);
            $("#firstpagenews").fadeIn(500);
        }
    });

    function close() { 
        $.post('https://magni-newspaper/close', JSON.stringify({display: false}));
        $('.container').css('display', 'none');
        $('.edit').css('display', 'none');
    }

    function hide2(){
        $('#firstpagenews').css('display', 'none');
        $('#firstpageheader').css('display', 'none');
        $('#secondpageheader').css('display', 'none');
        $('#secondpagenews').css('display', 'none');
        $('#thirdpageheader').css('display', 'none');
        $('#thirdpagenews').css('display', 'none');
        $('.editfp').css('display', 'none');
        $('.editsp').css('display', 'none');
        $('.edittp').css('display', 'none');
    }

    $(document).on("click", ".editfp", function () {
        var firstpageheader = $("#firstpageheader").val()
        var firstpagenews = $("#firstpagenews").val()
        var firstpagephoto = $("#firstpagephoto").val()
        var today= new Date().toLocaleDateString();
        if (firstpageheader != "" && firstpagenews != "" && firstpagephoto !="") {
            document.getElementById("firstpageheader").value = ""
            document.getElementById("firstpagenews").value = ""
            document.getElementById("firstpagephoto").value = ""
            $.post('https://magni-newspaper/firstpage', JSON.stringify({fpheader: firstpageheader, fpnews: firstpagenews,fpphoto: firstpagephoto,time: today}));
            notify("First field successfully changed", "success")
        } else {
            notify("Fill in all fields", "error")
        }
    });

    $(document).on("click", ".editsp", function () {
        var secondpageheader = $("#secondpageheader").val()
        var secondpagenews = $("#secondpagenews").val()
        var secondpagephoto = $("#secondpagephoto").val()
        var today= new Date().toLocaleDateString();
        if (secondpageheader != "" && secondpagenews != "" && secondpagephoto != "") {
            document.getElementById("secondpageheader").value = ""
            document.getElementById("secondpagenews").value = ""
            document.getElementById("secondpagephoto").value = ""
            $.post('https://magni-newspaper/secondpage', JSON.stringify({spheader: secondpageheader, spnews: secondpagenews, spphoto: secondpagephoto,time: today}));
            notify("Second field successfully changed", "success")
        } else {
            notify("fill in all fields", "error")
        }
    });

    $(document).on("click", ".edittp", function () {
        var thirdpageheader = $("#thirdpageheader").val()
        var thirdpagenews = $("#thirdpagenews").val()
        var thirdpagephoto = $("#thirdpagephoto").val()
        var today= new Date().toLocaleDateString();
        if (thirdpageheader != "" && thirdpagenews != "" && thirdpagephoto != "") {
            document.getElementById("thirdpageheader").value = ""
            document.getElementById("thirdpagenews").value = ""
            document.getElementById("thirdpagephoto").value = ""
            $.post('https://magni-newspaper/thirdpage', JSON.stringify({tpheader: thirdpageheader, tpnews: thirdpagenews, tpphoto: thirdpagephoto,time: today}));
            notify("Third field successfully changed", "success")
        } else {
            notify("fill in all fields", "error")
        }
    });

    $(document).on("click", "#next1", function () {
        $('.thirdpage').css('display', 'none');
        $('.firstpage').css('display', 'none');
        $('.secondpage').css('display', 'block');
        $('#back2').css('display', 'none');
    });

    $(document).on("click", "#next1edit", function () {
        $('.thirdpage').css('display', 'none');
        $('.firstpage').css('display', 'none');
        $('.secondpage').css('display', 'block');
    });

    $(document).on("click", "#back2edit", function () {
        $('.thirdpage').css('display', 'none');
        $('.firstpage').css('display', 'none');
        $('.secondpage').css('display', 'block');
    });

    $(document).on("click", "#back1back", function () {
        $('.thirdpage').css('display', 'none');
        $('.firstpage').css('display', 'block');
        $('.secondpage').css('display', 'none');
    });

    $(document).on("click", "#next2edit", function () {
        $('.thirdpage').css('display', 'block');
        $('.firstpage').css('display', 'none');
        $('.secondpage').css('display', 'none');
    });

    $(document).on("click", "#next2", function () {
        $('.thirdpage').css('display', 'block');
        $('.firstpage').css('display', 'none');
        $('.secondpage').css('display', 'none');
    });

    $(document).on("click", "#back2", function () {
        $('.thirdpage').css('display', 'none');
        $('.firstpage').css('display', 'block');
        $('.secondpage').css('display', 'none');
    });

    $(document).on("click", "#back3", function () {
        $('.thirdpage').css('display', 'none');
        $('#back2').css('display', 'block');
        $('.firstpage').css('display', 'none');
        $('.secondpage').css('display', 'block');
    });
    
    $(document).on("click", ".firstpagedetail", function () {
        $('.secondpage').css('display', 'none');
        $('.thirdpage').css('display', 'none');
        $('.firstpage').css('border-right', 'none');
        $('.firstpagedetail').css('display', 'none');
        $('.geridondur').css('display', 'block');
        $('.firstpage').css('left', '30vh');
        $('.firstpage').css('width', '79vh');
    });

    $(document).on("click", ".secondpagedetail", function () {
        $('.firstpage').css('display', 'none');
        $('.secondpage').css('top', '0vh');
        $('.secondpage').css('border-right', 'none');
        $('.secondpagedetail').css('display', 'none');
        $('.geridondur').css('display', 'block');
        $('.secondpage').css('left', '30vh');
        $('.secondpage').css('width', '79vh');
    });

    $(document).on("click", ".thirdpagedetail", function () {
        $('.firstpage').css('display', 'none');
        $('.secondpage').css('display', 'none');
        $('.thirdpage').css('top', '0vh');
        $('.thirdpagedetail').css('display', 'none');
        $('.thirdpage').css('left', '45vh');
        $('.geridondur').css('display', 'block');
        $('.thirdpage').css('left', '30vh');
        $('.thirdpage').css('width', '79vh');
    });

    $(document).on("click", ".geridondur", function () {
        $('.firstpage').css('display', 'block');
        $('.secondpage').css('display', 'block');
        $('.thirdpage').css('display', 'block');
        $('.geridondur').css('display', 'none');
        $('.firstpagedetail').css('display', 'block');
        $('.secondpagedetail').css('display', 'block');
        $('.thirdpagedetail').css('display', 'block');
        $('.firstpage').css('border-right', '0.1px solid rgb(0, 0, 0)');
        $('.secondpage').css('border-right', '0.1px solid rgb(0, 0, 0)');
        $('.secondpage').css('top', '-72vh');
        $('.thirdpage').css('left', '92vh');
        $('.thirdpage').css('top', '-145vh');   
        $('.firstpage').css('width', '45vh');
        $('.firstpage').css('left', '0vh');
        $('.secondpage').css('left', '48vh');
        $('.thirdpage').css('left', '92vh');
        $('.secondpage').css('width', '45vh');
        $('.thirdpage').css('width', '45vh');
    });

    document.addEventListener('keyup', function (data) {
        if (data.which == 27) {
           close();
        }
    });

    notify = function (text, type) {
        $(".notify").fadeOut(0)
        let renk = "#333"
        if (type == "error") {
          renk = "#FF3131"
        } else if (type == "success") {
          renk = "#689f38"
        }
      
        $(".notify").fadeIn(100)
        $(".notify").html(text)
        $(".notify").css("background", renk);
        $(".notify").fadeOut(3000)
      }

})