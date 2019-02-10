program PBarang;
uses crt, sysutils;

const 
    maks=100;
    namaFile ='dataBar.dat';

type
    TBarang=record
                  kode:string[5];
                  nama:string[20];
                  harga:integer;
                  Qty:integer;
                  subtotal:integer;
             end;
 
var
    barang : array[1..maks] of TBarang;
    banyakdata :integer;
    pilihan_menu : integer;

procedure bacaFile;  
    var
        f:file of TBarang;
    begin
        if FileExists(namafile) then 
            begin
                assign(f,namafile);
                reset(f);
                while not eof(f) do 
                    begin
                        banyakdata:=banyakdata+1;
                        read(f,barang[banyakdata]);
                    end;
                close(f);
            end;
    end;

procedure simpanFile(); 
    var
        f:file of TBarang;
        i:integer;
    begin
        assign(f,namafile);
        rewrite(f);
        for i:=1 to banyakdata do
            write(f,barang[i]);
        close(f);
    end;

procedure Lihat_data;
    var
        i:integer;
    begin
        if (banyakdata>=0) then  
            begin
                clrscr;  
            //            000000000111111111122222222223333333333444444444455555555556
            //            123456789012345678901234567890123456789012345678901234567890
            //            |-12345--|-12345678901234567890-|-123456-|-123-|-123456789-|
            //            |  KODE  |     NAMA BARANG      |  HARGA | Qty | SUB TOTAL |
                writeln ('|  KODE  |     NAMA BARANG      |  HARGA | Qty | SUB TOTAL |');
                writeln ('------------------------------------------------------------');
                for i:= 1 to banyakdata do
                begin
                        gotoxy(1,i+3);write('|        |                      |        |     |           |');
                        gotoxy(3,i+3);write(barang[i].kode);
                        gotoxy(12,i+3);write(barang[i].nama);
                        gotoxy(34,i+3);write(barang[i].harga:6);
                        gotoxy(44,i+3);write(barang[i].Qty:3);
                        gotoxy(50,i+3);writeln(barang[i].subtotal:9);
                end;
                writeln ('------------------------------------------------------------');
                write('Tekan enter untuk melanjutkan');readln();
            end
        else
            begin
                writeln('Data barang belum terisi');
            end;
    end;

procedure tambah_data;
    begin
        if banyakdata<maks then
            begin
                    banyakdata:=banyakdata+1;
                    writeln('Inputkan barang ke-',banyakdata);
                    write('kode barang : ');readln(barang[banyakdata].kode);
                    write('Nama barang : ');readln(barang[banyakdata].nama);
                    write('Harga : ');readln(barang[banyakdata].harga);
                    write('Qty   : ');readln(barang[banyakdata].Qty);
                    barang[banyakdata].subtotal:=barang[banyakdata].harga * barang[banyakdata].Qty;
            end
        else
            begin
                writeln ('Banyak data sudah mencapai batas maksimal');
            end;
    end;

procedure ubah_data;
    var 
        i:integer;
    begin
        clrscr;
        if banyakdata >= 1 then
            begin
                write('Data Nomor Berapa Yang Ingin Diubah : ');readln(i);
                write('Kode barang   : ');readln(barang[i].kode);
                write('nama barang   : ');readln(barang[i].nama);
                write('Jumlah barang : ');readln(barang[i].Qty);
                write('Harga Barang  : ');readln(barang[i].harga);
                write('Data  Berhasil Diubah');
                readln();
            end
        else
            write('Data Kosong');readln;  
    end;


//procedure hapus_data;

//procedure pengurutan;

//procedure pencarian;

//procedure filter;


begin
    banyakdata:=0;
    bacafile;
    repeat
        clrscr;
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
        write('Pilhan anda : ');readln(pilihan_menu);
        if pilihan_menu = 1 then
            Lihat_data
        else
        if pilihan_menu = 2 then
            tambah_data
        else
        if pilihan_menu = 3 then
            ubah_data
//        else 
//        if pilihan_menu = 4 then
//            Hapus_data
//        else
//        if pilihan_menu = 5 then
//            pengurutan
//       else 
//        if pilihan_menu = 6 then
//            pencarian
//        else
//       if pilihan_menu = 7 then
//          filter
    until pilihan_menu = 0;
    simpanFile;    
end.