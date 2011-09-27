CONFIG =
	hourImage : "http://s3.amazonaws.com/SAR_comic/asset_19.png"
	minImage : "http://s3.amazonaws.com/SAR_comic/asset_18.png"

class Clock
	constructor: -> 
		$('#hour_hand, #min_hand').css('background','none')
		@hourhand = Raphael(document.getElementById("hour_hand"), 55, 52)
		@hourhand.image(CONFIG.hourImage, 0, 0, 55, 52)
		@minutehand = Raphael(document.getElementById("min_hand"), 55, 52)
		@minutehand.image(CONFIG.minImage, 0, 0, 55, 52)
		
		
		@start()
		
	get_time: ->
		hour = (new Date).getHours()
		hour = if hour > 12 then hour - 12 else hour
		min = (new Date).getMinutes()
		
		[hour: hour, minutes: min]
	
	iterate: ->
		positions = @hand_positions(@get_time())
		@hourhand.rotate(positions.hour)
		@minutehand.rotate(positions.minute)
		
	hand_positions: (time) ->
		[hourhand: ((360/12)*time.hour)+((360/(60*12))*time.minutes), minutehand: ((360/60)*time.minutes)]
		
	start: ->
		self = @
		self.timer = setInterval ->
			self.iterate()
		, 1000
			
	stop: ->
		@timer.clearInterval()

$ ->
	clock = new Clock