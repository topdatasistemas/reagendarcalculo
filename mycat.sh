arquivo="$1"

while IFS= read -r linha ; do
	echo ----------------------------
	echo -e
	data=$(date +"%Y-%m-%d")
	dados='{"baseCliente":"'"$linha"'","dataProcesso":"'"$data"'","funcionarios":[],"status":"AGUARDANDO"}'
	curl -X POST -i 'http://qatopapirelatorio.azurewebsites.net/apirelatorio/background/agendarProcessoPresenca' -H 'Content-Type: application/json' --header 'User-Agent: Curl' --data-raw "$dados"
	echo dados : "$dados"	
	echo base cliente :  "$linha"
	echo -e
	sleep 1
done < "$arquivo"

