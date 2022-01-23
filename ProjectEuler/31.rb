#! ruby -Ku
def log(s)
	p Time.now.strftime("%H:%M:%S | " + s)
end
log "start"

MAKE_PRICE = 200

coin = [1,2,5,10,20,50,100,200]

#[1p] = 1p
#[2p] = 2p 
#	or 1p + 1p
#[5p] = 5p 
#	or 2p + 2p + 1p 
#	or 2p + 1p + 1p + 1p 
#	or 1p + 1p + 1p + 1p + 1p
#[10p] = 10p
#	or 5p + [5p]
#	or 2p + 2p + 2p + 2p + 2p
#	or 

log "end"

