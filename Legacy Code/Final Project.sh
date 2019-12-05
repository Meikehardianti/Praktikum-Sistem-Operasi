#!/bin/sh
clear
declare -a nama
declare -a ktp
declare -a alamat
declare -a kereta
declare -a jenis
declare -a jumlah
i=0
j=0
lagi=y

function folder(){
       echo "               MEMBUAT FOLDER BARU         ";
       echo "Masukan Nama Folder yang ingin anda buat : ";
       read folder
       mkdir $folder
       echo "Folder $folder telah berhasil dibuat      ";
       echo " "
       echo "Cek Lokasi Folder?(y/t)"
       read cek

       if [ $cek == y ]
       then
           ls -l
       fi

       if [ $cek != y ]
       then
          echo "OKELAA"
       fi
       read
}

function manipulasi(){
      ls -l
      echo "Program aplikasi ini bernama test.sh "
      echo "Ketikkan Nama program yang ingin anda rubah "
      read ubah
      echo " "
      echo "Penjelasan Tentang Manipulasi Data "
      echo "Hak akses untuk owner, group, dan other "
      echo "Untuk *r = 4(read-Berarti mengizinkan membaca berkas"
      echo "Untuk *w = 2(write0-Berarti mengizinkan mengedit berkas"
      echo "Untuk 8x = 1(excutable-Berarti mengizinkan mengeksekusi berkas binay"
      echo "Masukan angka : "
      read angka 

      echo -e "\nanda memilih $ubah"
      sudo chmod $angka $ubah
      echo -e "\n Manipulasi berkas sudah selesai"
      ls -l
      read
}

function harga(){
       clear
       echo "=====================================";
       echo "        MENU HARGA TIKET             ";
       echo "=====================================";
       echo "1. EKONOMI     RP 100.000            ";
       echo "2. BISNIS      RP 150.000            ";
       echo "3. EKSEKUTIVE  RP 300.000            ";
       echo "=====================================";
       echo " ";
}

function jadwal_keberangkatan(){
       clear;
       echo "=============================================================================";
       echo "                          JADWAL KEBERANGKATAN KERETA API                    ";
       echo "=============================================================================";
       echo " ";
       echo "----------------------------------------------------------------------------";
       echo " NO || Nama Kereta Api||   Tujuan    ||   Kelas   || Berangkat ||  Tiba  || ";
       echo "--------------------------------------------------------------------------- ";
       echo " 1  || ARGOLAWU       || Pasar Senen || Ekonomi   ||  11.00    ||  08.30 || ";
       echo " 2  || ARGOLAWU       || Pasar Senen || Bisnis    ||  13.00    ||  07.15 || ";
       echo " 3  || ARGOLAWU       || Pasar Senen || Eksekutif ||  20.00    ||  11.00 || ";
       echo " 4  || KARTAJAYA      || Pasar Senen || Eksekutif ||  08.00    ||  02.10 || ";       
       echo " 5  || KARTAJAYA      || Pasar Senen || Ekonomi   ||  12.00    ||  06.00 || ";
       echo " 6  || KARTAJAYA      || Pasar Senen || Bisnis    ||  15.00    ||  08.00 || ";
       echo " 7  || KAHUTIPAN      || Pasar Senen || Eksekutif ||  18.00    ||  07.00 || ";
       echo " 8  || KAHUTIPAN      || Pasar Senen || Ekonomi   ||  13.00    ||  04.00 || ";
       echo " 9  || KAHUTIPAN      || Pasar Senen || Bisnis    ||  09.00    ||  23.30 || ";
       echo " ";
}

function transaksi(){
      clear;
      let i=$i+1;
      echo -n "Masukan Nama anda                  : ";
      read nama[$i];
      echo -n "Masukan Nomor KTP Anda             : ";
      read ktp[$i];
      echo -n "Masukan Alamat Anda                : ";
      read alamat[$i];
      echo -n "Masukan Nama Kereta(ARGOLAWU,KARTAJAYA,KAHUTIPAN): ";
      read kereta[$i];
      echo -n "Masukan Jenis tiket yang di beli (1-3)   : "
      read jenis[$i];
      echo -n "Masukan Jumlah tiket yang dibeli   : ";
      read  jumlah[$i];
      echo " "
         if [[ ${jenis[$i]} == 1 ]];   
          then kelas="EKONOMI"
          tiket=100000
          let total=${jumlah[$i]}*$tiket
          let array[$i]=$total 
          let ${array[$i]}
          let i=$i+1;
         elif [[ ${jenis[$i]} == 2 ]];
          then kelas="BISNIS"
          tiket=150000
          let total=${jumlah[$i]}*$tiket
          let array[$i]=$total 
          let ${array[$i]}
          let i=$i+1;
         elif [[ ${jenis[$i]} == 3 ]];
          then kelas="EKSEKUTIVE"
          tiket=300000
          let total=${jumlah[$i]}*$tiket
          let array[$i]=$total 
          let ${array[$i]}
          let i=$i+1;
         else
          echo "Sorry, tidak tersedia"
         fi
}

function cetak(){
      for((a=1;a<i;a++))
       do
            echo "====================================";
            echo "        DATA PEMBELI TIKET $a       ";
            echo "====================================";
            echo "NAMA             : ${nama[$a]}";
            echo "NOMOR KTP        : ${ktp[$a]}";
            echo "ALAMAT           : ${alamat[$a]}";
            echo "NAMA KERETA      : ${kereta[$a]}";
            echo "JENIS TIKET      : $kelas";
            echo "JUMLAH TIKET     : ${jumlah[$a]}";
            echo "====================================";
            echo "TOTAL PEMBAYARAN : ${array[$a]}";
            echo "====================================";
      done
}

function search(){
    echo -n "Masukkan data tiket yang ingin dicari (Nomor KTP) : "
    read cari
    a=0
    for((c=1;c<=i;c++))
    do
        if(( $cari == ${ktp[$c]} ))
        then 
            a=1
            break
        fi
    done
    
    if(( $a == 1 ))
    then
           echo "====================================";
            echo "        DATA PEMBELI TIKET        ";
            echo "====================================";
            echo "NAMA             : ${nama[$c]}";
            echo "NOMOR KTP        : ${ktp[$c]}";
            echo "ALAMAT           : ${alamat[$c]}";
            echo "NAMA KERETA      : ${kereta[$c]}";
            echo "JENIS TIKET      : $kelas";
            echo "JUMLAH TIKET     : ${jumlah[$c]}";
            echo "====================================";
            echo "TOTAL PEMBAYARAN : ${array[$c]}";
            echo "====================================";
    else
        echo "Data tidak ditemukan"
    fi
}

function update(){
      echo -n "Masukkan Nomor KTP yang datanya ingin diupdate : ";
      read cari_ktp;
      a=0
      b=a

      for((j=1;j<i;j++))
      do
            if(( $cari_ktp == ${ktp[$j]} ));
              then
                 a=1
                 break
            fi
      done
            if(( $a == 1 ));
              then
               echo "          Data Pembeli Tiket           ";
               echo "---------------------------------------";
               echo "NAMA             : ${nama[$j]}";
               echo "NOMOR KTP        : ${ktp[$j]}";
               echo "ALAMAT           : ${alamat[$j]}";
               echo "NAMA KERETA      : ${kereta[$j]}";
               echo "JENIS TIKET      : $kelas";
               echo "JUMLAH TIKET     : ${jumlah[$j]}";
               echo "TOTAL PEMBAYARAN : ${array[$j]}";
               echo "-------------------                    ";
               echo "                 UPDATE                ";
               echo -n "Masukkan Nama       : ";
               read nama[$j];
               echo -n "Masukkan Nomor Ktp  : ";
               read ktp[$j];
               echo -n "Masukan Alamat Anda : ";
               read alamat[$j];
               echo -n "Masukan Nama Kereta(ARGOLAWU,KARTAJAYA,KAHUTIPAN,PROGO : ";
               read kereta[$j];
               echo -n "Masukan Jenis tiket yang di beli (1-3)   : "
               read jenis;
               echo -n "Masukan Jumlah tiket yang dibeli   : ";
               read jumlah[$j];
               echo " "
              if [[ ${jenis[$j]} == 1 ]]   
                    then kelas="EKONOMI"
                    tiket=100000
                    let total=${jumlah[$j]}*$tiket
                    let array[$j]=$total 
                    let ${array[$j]}
                    let i=$j+1;
              elif [[ ${jenis[$j]} == 2 ]] 
                    then kelas="BISNIS"
                    tiket=150000
                    let total=${jumlah[$j]}*$tiket
                    let array[$j]=$total 
                    let ${array[$j]}
                    let j=$j+1;
              elif [[ ${jenis[$j]} == 3 ]]
                    then kelas="EKSEKUTIVE"
                    tiket=300000
                    let total=${jumlah[$j]}*$tiket
                    let array[$j]=$total 
                    let ${array[$j]}
                    let j=$j+1;
              else
                    echo "Sorry, tidak tersedia"
         fi
     else   
        echo "Data tidak ditemukan"
        b=1;        
     fi
}

while [ $lagi == 'y' ] || [ $lagi == 'Y' ];
do
        clear
        echo "=======================================";
        echo "   PROGRAM PEMBELIAN TIKET KERETA API  ";
        echo "  JURUSAN JOMBANG-PASAR SENEN(JAKARTA) ";
        echo "=======================================";
        echo "1. MENU HARGA TIKET                    ";
        echo "2. JADWAL KEBERANGKATAN KERETA API     ";
        echo "3. TRANSAKSI PEMBELIAN TIKET           ";
        echo "4. CETAK TIKET                         ";
        echo "5. UPDATE TIKET                        ";
        echo "6. MEMBUAT FOLDER BARU                 ";
        echo "7. MANIPULASI HAK AKSES BERKAS         ";
        echo "8. KELUAR                              ";
        echo "=======================================";
        echo "Masukan Piihan Anda [1-8] :" 
        read pil

case $pil in
1)
        clear
        harga
        ;;

2)
        clear
        jadwal_keberangkatan
        ;;

3)
        clear
        transaksi
        ;;

4)
        clear
        cetak
        ;;

5)
        clear
        update
        ;;
6)
        clear
        folder
        ;;
7)
        clear
        manipulasi
        ;;
8)
        echo " "
        echo "Terimakasih Telah Menggunakan Program ini :)"
        echo " "
        exit 0
        ;;
*)
        echo " "
        echo "Maaf ,inputan salah"
        echo " "
        exit 1
;;
esac
        echo -n "Kembali ke Menu Utama (y/t) : ";
        read lagi
        echo " "
done
