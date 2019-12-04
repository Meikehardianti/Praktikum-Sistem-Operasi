#!/bin/bash

echo "Selamat datang di program FizzBuzz"
echo "Masukkan Nilai :"
read bil
echo "Mulai Menghitung"

i=1

while [ $i -le $bil ]
do
        if [[ 0 -eq "($i%3) + ($i%5)" ]]
        then
        echo "Fizz Buzz"
        elif [[ 0 -eq "($i%5)" ]]
        then
        echo "Buzz"
        elif [[ 0 -eq "($i%3)" ]]
        then
        echo "Fizz"

        else
        echo "$i"
        fi
        i=$(( $i + 1 ))
done

