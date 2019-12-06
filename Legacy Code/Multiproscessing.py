from os import getpid
from time import time, sleep
from multiprocessing import Pool, Process

def gan_gen(angka):
    if angka%2 == 0:
        print(angka, "ID Proses", getpid())
    else:
        print(angka, "ID Proses", getpid())
    sleep(1)
def gan_gen1(angka):
	if angka % 2 == 0:
		print(angka, "ID Proses", )
		print("Rahasia")
	else:
		print(angka,"ID Proses",)
		print("Rahasia")
	sleep(1)

if __name__ == '__main__':
    print("Masukan inputan : ")

    angka_awal = int(input())
    angka_akhir =int(input())
    print("\n")
    print("Output : ")
    # PEMROSESAN SEKUENSIAL
    sekuensial_awal = time()
    
    for i in range(angka_awal, angka_akhir +1):
      gan_gen(i)
    
    sekuensial_akhir= time()
    
    # PEMROSESAN PARALEL DENGAN multiprocessing.process
    print("\nPemrosesan Paralel dengan multiprocessing.process")
    kumpulan_proses = []
    
    process_awal = time()
    
    for i in range(angka_awal,angka_akhir + 1):
      p = Process(target=gan_gen1, args=(i,))
      kumpulan_proses.append(p)
      p.start()
    
    for i in kumpulan_proses:
      p.join()
    
    process_akhir = time()
    
    # PEMROSESAN PARALEL DENGAN multiprocessing.pool
    print("\nPemrosesan Paralel dengan multiprocessing.pool")
    pool_awal = time()
    
    pool = Pool()
    pool.map(gan_gen, range(angka_awal,angka_akhir +1))
    pool.close()
    
    pool_akhir = time()
  
print("\nSekuensial", sekuensial_akhir-sekuensial_awal, "detik")
print("multiprocessing.process", process_akhir-process_awal, "detik")
print("multiprocessing.pool", pool_akhir-pool_awal, "detik")





































































































