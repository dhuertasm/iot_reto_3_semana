set ant 999
set ite 0
battery set 100

atget id id
getpos2 lonSen latSen

loop
inc ite
print "ite: " ite
if(ite >=1000)
	stop
end

wait 10
read mens
rdata mens tipo valor

if((tipo=="hola") && (ant == 999))
   set ant valor
   data mens tipo id
   send mens * valor
end

if(tipo=="stop")
	data mens "stop"
	send mens*valor
	cprint "Para sensor: " id
	wait 1000
	stop
end

battery bat
if(bat < 5)
	data mens "critico" IonSen latSen
	send mensa ant
end

if(tipo=="alerta")
   send mens ant
end
delay 10

areadsensor tempSen
rdata tempSen SensTipo idSens temp

if( temp>30)
   data mens "alerta" lonSen latSen
   send mens ant
end