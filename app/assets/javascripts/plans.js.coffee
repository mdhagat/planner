# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Using $j instead of just $ to be more specific
#$j = jQuery

# Storing page elements to local variables
#clickme = $j '#change_segment_thumbnail1'
#clickme = $j '#save_plan_button1'
#bar = $j '.add_stay_section'

# Cool shortcut, instead of $j(document).ready(function(){
$ ->
    $('.change_segment_thumbnail').click ->
        $('.add_stay_section').animate {width:150}, 2000
