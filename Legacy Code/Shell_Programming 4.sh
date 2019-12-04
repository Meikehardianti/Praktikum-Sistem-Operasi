#!/bin/bash

declare -a array
i=0
m=0
while [ $m -ne 5 ];
do
    echo " ";
    echo " ";
    echo "      MENU PROGRAM           ";
    echo "1.Hitung Luas Permukaan Kubus ";
    echo "2.Hitung Luas Permukaan Prisma ";
    echo "3.Hitung Luas Permukaan Limas Persegi";
    echo "4.Hitung Median Dari ketiga Luas Permukaan";
    echo "5.Keluar "
    echo "==================================";
    echo -n "Masukan Pilihan Menu [1-5]: "
    read menu
    echo " "
if [ $menu -eq 1 ]
then
    echo "    Program Hitung Luas Permukaan Kubus";
    echo " "
    echo -n "Masukan sisi : ";
    read sisi;
    let luas1=6*$sisi*$sisi;
    let array[$i]=$luas1;
    echo "Luas Permukaan kubus = "${array[$i]};
    let i=$i+1;
elif [ $menu -eq 2 ]
then
    echo "    Program Hitung Luas Permukaan Prisma ";
    echo " "
    echo -n "Masukan panjang alas segitiga : ";
    read alas;
    echo -n "Masukan tinggi alas           : ";
    read tinggi;
    echo -n "Masukan luas bidang tegak     : ";
    read bidang;
    let luasalas=$alas*$tinggi/2;
    let luas2=2*$alas+3*$bidang;
    let array[$i]=$luas2;
    echo -n "Luas Permukaan prisma   = "${array[$i]}
    let i=$i+1;

elif [ $menu -eq 3 ]
then
    echo "    Program Hitung Luas Permukaan Limas Persegi";
    echo " "
    echo -n "Masukan Sisi Limas   : ";
    read sLimas;
    echo -n "Masukan Tinggi Limas : ";
    read tLimas;
    let luaslimas=$sLimas*$sLimas*$sLimas/3;
    let array[$i]=$sLimas;
    echo -n "Luas Permukaan Limas Persegi = "${array[$i]}
    let i=$i+1;

elif [ $menu -eq 4 ]
then
    echo "     Program Hitung Median Dari ketiga Luas Permukaan";
    echo " "
    echo "Data Ketiga Luas Permukaan :"${array[@]}

   for((x=0;x<i-1;x++))
   do
    let small=${array[$x]};
    let index=$x;
       for((y=x+1;y<i;y++))
       do
           if((array[$y]<small));
         then
               let small=${array[$y]};
               let index=$y;
          fi
       done
    let temp=${array[$x]};
    let array[$x]=${array[$index]};
    let array[$index]=$temp;
   done

    for ((x=0;x<$i;x++))
     do    
       echo -n ${array[$x]} " "
     done
    
   let m=$i%2
   if(($m==0))
   then 
    let x=($i/2);
    let median=(${array[$x-1]}+${array[$x]})/2;
    echo ${array[$x-1]} ${array[$x]} ;
    echo $x;
   else 
    let x=$i/2;
    let median=${array[$x]};    
   fi 
   
   echo "Median dari ketiga Luas Permukaan adalah "$median
    

elif [ $menu -eq 5 ]
then
    echo "Terimakasih Telah Menggunakan Program aquu :)"
fi
done

