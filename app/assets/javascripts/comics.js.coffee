# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

CONFIG =
	hourImage : "http://s3.amazonaws.com/SAR_comic/asset_19.png"
	minImage : "http://s3.amazonaws.com/SAR_comic/asset_18.png"


$ ->
	h = setHour()
	m = setMin()
	setInterval ->
		rotateTime(h,m)
	, 1000

setHour = () ->
	hpaper = Raphael(document.getElementById("hour_hand"), 55, 52)
	$('#hour_hand').css('background','none')
	hpaper.image(CONFIG.hourImage, 0, 0, 55, 52)

setMin = () ->
	mpaper = Raphael(document.getElementById("min_hand"), 55, 52)
	$('#min_hand').css('background','none')
	mpaper.image(CONFIG.minImage, 0, 0, 55, 52)

getHdeg = () ->
	(hours = (new Date).getHours())
	hour = if hours > 12 then hours - 12 else hours
	((360/12)*hour)
	
getMdeg = () ->
	(min = (new Date).getMinutes())
	((360/60)*min)
	
rotateTime = (h,m) ->
	degH = getHdeg()
	h.rotate(degH,true)
	
	degM = getMdeg()
	console.log degM
	m.rotate(degM,true)
	
	
	
	