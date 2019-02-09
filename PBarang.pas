program PBarang;
uses crt;

const 
    maks=100;
    namaFile = 'dataBar.dat';

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
    writeln('apa aja weeh');
    writeln('apa ajaa weeeh');
    writeln('aapaa atuuh');    
end.