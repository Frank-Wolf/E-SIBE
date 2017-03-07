/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    $('.bl  li:has(ul)').click(function(e){
        e.preventDefault();
        
        
        
        if($(this).hasClass('activado'))
        {
         $(this).removeClass('activado');   
         $(this).children('ul').slideUp();
        }
        else
        {
            $('.bl li ul').slideUp();
            $('.bl li').removeClass('activado');
            $(this).addClass('activado');
            $(this).children('ul').slideDown();
            
        }
    });
});

