echo "Masukkan Detik"
read detik

let jam=$detik/3600
let detik=$detik-$(expr 3600*$jam)
let menit=$detik/60
let detik=$detik-$(expr 60*menit)

if [ $jam -ne 0 ]
then
       jams="$jam jam"
else
        jams=" "
fi

if [ $menit -ne 0 ]
then
        menits="$menit menit"
else
        menits=" "
fi
if [ $detik -ne 0 ]
then
           detiks="$detik detik"
else
            detiks=" "
fi
echo "$jams $menits $detiks"

