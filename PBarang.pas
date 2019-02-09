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

procedure Lihat_data; //Procedure ini digunakan untuk menampilkan data tersimpan
    var
            i : integer;
        begin
            if (banyakdata>0) then
            begin
                clrscr;
                    //   000000000111111111122222222223333333333444444444455555555556666666666
                    //   123456789012345678901234567890123456789012345678901234567890123456789
                writeln('--------------------------------------------------------------------');
                writeln('| NO |  NO SURAT  |      PERIHAL     |  JENIS SURAT  |  PENGIRIM   |');
                writeln('--------------------------------------------------------------------');
                for i:= 1 to banyakdata do
                begin
                    gotoxy(2, i+3);write(i);
                    gotoxy(8, i+3);write(surat[i].no_surat);
                    gotoxy(21, i+3);write(surat[i].perihal);
                    gotoxy(40, i+3);write(surat[i].jenis_surat);
                    gotoxy(56, i+3);write(surat[i].pengirim);
                end;
                writeln();
                write('Tekan enter untuk melanjutkan.');
            end
            else
                writeln('Data pengarsipan surat masuk belum diisi.');
            readln();
        end;


//procedure tambah_data;

//procedure ubah_data;

//procedure hapus_data;

//procedure pengurutan;

//procedure pencarian;

//procedure filter;


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
    if pilihan_menu = 2 then
        tambah_data;
    else
    if pilihan_menu = 3 then
        ubah_data;
    else 
    if pilihan_menu = 4 then
        Hapus_data;
    else
    if 
    //simpanFile;    
end.