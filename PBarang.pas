program PBarang;
uses crt;

const 
    maks=100;
    namaFile ='dataBar.dat';

type
    TBarang = record 
        Kode_barang : string;
        nama_barang : string;
        harga : real;
        subtotal: real;
        Qty : integer;


var
    surat : array[1..maks] of TBarang;
    banyakdata :integer;
    pilihan_menu : integer;

begin
    banyakdata:=0;
    //bacaFile;
    writeln('Selamat datang di aplikasi penyimpan data');
    writeln('1. Lihat data');
    writeln('2. Tambah data');
    writeln('3. Ubah data');
    writeln('4. Hapus data');
    writeln('5. Pengurutan data');
    writeln('6. Pencarian data');
    writeln('7. Filter Data');
    writeln('0. Keluar');
    writeln('------------------------------------------');
    write('Pilhan anda : ');readln('pilihan_menu');
    if pilihan_menu = 1 then
         Lihat_data;
    else
    //simpanFile;    
end.