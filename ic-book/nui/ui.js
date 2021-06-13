var strona = 0;


$(document).ready(function(){
 
 window.addEventListener( 'message', function( event ) {
        var item = event.data
        if ( item.showPlayerMenu == true ) {
                 strona = history.length;
          
$('.container-fluid').css('display','block');
        } else if ( item.showPlayerMenu == false ) { // Hide the menu 
           
$('.container-fluid').css('display','none');
$('body').css('background-color','transparent important!');
	$("body").css("background-image","none");

        }
    } );

})



function goBack() {
        if (strona !== history.length){
        window.history.back();
      } else {
        $.notify("Brak wczesniejszych stron", "error");
        return;
      }
}


      
function goForward() {
        if (strona !== history.length){
        window.history.forward();
      } else {
        $.notify("Brak stron", "error");
        return;
      }
}

