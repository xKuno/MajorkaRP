$('.card-with-player').click(function () {

    var chosenCharacterId =  $(this).data('character-id');

    $('.card').removeClass('chosen-character');

    if (chosenCharacterId > 0) {
        $(this).addClass('chosen-character');
    }
});

$('.create-button').click(function () {

    var chosenCharacterId = $(this).data('character-id');		
    var isCharacter = 'false';
	if(chosenCharacterId == 1){
    $.post("http://esx_kashacters/CharacterChosen", JSON.stringify({
        charid: chosenCharacterId,
        ischar: ($('.chosen-character').attr("data-ischar") == "false"),
    }));
    Kashacter.CloseUI();
	}
    if(chosenCharacterId == 2){
    $.post("http://esx_kashacters/Get2Postac", JSON.stringify({
        charid: chosenCharacterId,
        ischar: ($('.chosen-character').attr("data-ischar") == "false"),
    }));
    Kashacter.CloseUI();
    }
    if(chosenCharacterId == 3){
    $.post("http://esx_kashacters/Get3Postac", JSON.stringify({
        charid: chosenCharacterId,
        ischar: ($('.chosen-character').attr("data-ischar") == "false"),
    }));
    Kashacter.CloseUI();
    }
    if(chosenCharacterId == 4){
    $.post("http://esx_kashacters/Get4Postac", JSON.stringify({
        charid: chosenCharacterId,
        ischar: ($('.chosen-character').attr("data-ischar") == "false"),
    }));
    Kashacter.CloseUI();
    }
});
	
$('.play-button').click(function () {
    $('#load-char').css({"display":"block"});

    var chosenCharacterId = $(this).data('character-id');

    $.post("http://esx_kashacters/CharacterChosen", JSON.stringify({
        charid: chosenCharacterId,
        ischar: ($('.chosen-character').attr("data-ischar") == "true"),
    }));
    Kashacter.CloseUI();
    setTimeout(function() {
        $('#load-char').css({"display":"none"});
    }, 5000);
});


$('.delete-button').click(function () {

    var chosenCharacterId = $(this).data('character-id');

	if (chosenCharacterId > 0) {
		$('#deletechar').data('character-id', chosenCharacterId);
		$('#delete-char').modal('show');
    } else {
		Kashacter.CloseUI();
	}
    
});



$("#deletechar").click(function () {
	
	var chosenCharacterId =  $(this).data('character-id');
	
	if (chosenCharacterId > 0) {
		$.post("http://esx_kashacters/DeleteCharacter", JSON.stringify({
			charid: chosenCharacterId,
		}));
    }

    Kashacter.CloseUI();
});



/* TRASH BELOW FROM ORIGINAL CODER */

(() => {
    Kashacter = {};

    Kashacter.ShowUI = function (data) {
        $('.character-container').css('display', 'block');
        if (data.characters !== null) {
            $('.card-with-player').css('display', 'none');
            $('.card-without-player').css('display', 'block');
            $.each(data.characters, function (index, char) {
                if (char.charid !== 0) {
                    var charid = char.identifier.charAt(4);
                    $('#c-name-' + charid).html(char.firstname);

                    $('#c-fullname-' + charid).html(char.firstname + ' ' + char.lastname);
                    var dateString = new Date(char.dateofbirth).toLocaleString('en-US');
                    $('#c-dob-' + charid).html(dateString.substring(0, dateString.length - 12));
                    $('#c-gender-' + charid).html((char.sex === 'm') ? 'Mezczyzna' : (char.sex === 'f') ? 'Kobieta' : 'Unknown');
                    $('#c-height-' + charid).html(char.height + ' cm');
                    $('#c-phone-' + charid).html(char.phone_number);
                    $('#c-bank-' + charid).html('$' + char.bank.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
                    $('#c-cash-' + charid).html('$' + char.money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));

                    $('#character-without-' + charid).css('display', 'none');
                    $('#character-with-' + charid).css('display', 'block');
                    $('#character-with-' + charid).attr('is-character', 'true');
                    ShowLoading(false)
                }
            });
        }
    };

    Kashacter.CloseUI = function () {
        $('.character-container').css('display', 'none');
        $('.card').removeClass('chosen-character');
        // $('.play-button').css('display', 'none');
        // $('.delete-button').css('display', 'none');
        $('.card-with-player').css('display', 'none');
        $('.card-without-player').css('display', 'block');

    };
    Kashacter.ShowWelcome = function() {
         $('.charWelcome').css({"display":"block"});
         $('#changelog').css({"display":"block"});
         IsInMainMenu = true
    };
    Kashacter.HideWelcome = function() {
         $('.charWelcome').css({"display":"none"});
         $('#changelog').css({"display":"none"});
         IsInMainMenu = false
    };
    window.onload = function(e) {
        window.addEventListener('message', function(event) {
            switch(event.data.action) {
                case 'openui':
                    Kashacter.ShowUI(event.data);
                    ShowLoading(false)
                    break;
                case 'openwelcome':
                $.post("http://esx_kashacters/ShowSelection", JSON.stringify({}));
                ShowLoading(true)
                    break;
                case 'displayback':
                     $('.top-bar2').css({"display":"block"});
                     $('.bottom-bar2').css({"display":"block"});
                    $('.BG').css({"display":"block"});
                    break;
            }
        })
        document.onkeydown = function(data) {
            if (data.which == 13 && IsInMainMenu) {
                Kashacter.HideWelcome();
                $.post("http://esx_kashacters/ShowSelection", JSON.stringify({}));
                ShowLoading(true)
            }
        }
    }

})();


function ShowLoading(display) {
    if (display) {
        $("#load-allchar").css("display", "block")
    } else {
        $("#load-allchar").css("display", "none")
    }
}