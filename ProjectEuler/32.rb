#! ruby -Ku
def log(s)
	p Time.now.strftime("%H:%M:%S | " + s)
end
log "start"



log "end"

