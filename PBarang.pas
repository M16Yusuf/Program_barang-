program PBarang;
uses crt, sysutils, strutils;

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
                writeln ('------------------------------------------------------------');
                writeln ('|  KODE  |     NAMA BARANG      |  HARGA | Qty | SUB TOTAL |');
                writeln ('------------------------------------------------------------');
                for i:= 1 to banyakdata do
                begin
                        gotoxy(1,i+3);write('|        |                      |        |     |           |');
                        gotoxy(3,i+3);write(barang[i].kode);
                        gotoxy(12,i+3);write(barang[i].nama);
                        gotoxy(34,i+3);write(barang[i].harga);
                        gotoxy(44,i+3);write(barang[i].Qty);
                        gotoxy(50,i+3);writeln(barang[i].subtotal);
                end;
                writeln ('------------------------------------------------------------');
                write('Tekan enter untuk melanjutkan');readln();
            end
        else
            begin
                writeln('Data barang belum terisi');
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


procedure hapus_data; 
    var
        i : integer;
        yakin : string;
        temp : TBarang;
    begin 
        clrscr;
        if (banyakdata <> 0) then 
        begin
            write('Data di posisi berapa yang mau Anda hapus? (1 - ', banyakdata, ')');
            readln(i);
            write('Apakah anda yakin? [Y/T]');
            readln(yakin);
            if (yakin = 'y') or (yakin = 'Y') then
            begin 
                barang[i].kode := '';
                barang[i].nama := '';
                barang[i].harga := 0;
                barang[i].Qty := 0;
                barang[i].subtotal :=0;

                while(barang[i+1].kode <> '') do
                begin
                    temp := barang[i];
                    barang[i] := barang[i+1];
                    barang[i+1] := temp;
                    i := i + 1;
                end;

                banyakdata := banyakdata - 1;

                writeln();
                writeln('Data berhasil dihapus!');
                write('Tekan enter untuk melanjutkan');
                readln;
            end
            else
            begin
                writeln();
                writeln('Penghapusan dibatalkan!');
                write('Tekan enter untuk melanjutkan');
                readln;
            end;
        end
        else
        begin
            writeln('Data kosong');readln;
        end;
    end;

procedure pengurutan_nama;// pengurutan ini menggunakan metode Bubble short Ascending (dari terkecil ke trbesar)
    var
        tahap,i: integer;
        temp:TBarang;
    begin 
        for tahap := 1 to banyakdata -1 do 
        begin
            for i:=banyakdata downto 2 do
            begin 
                if barang[i].nama < barang[i-1].nama then 
                begin
                    temp:=barang[i];
                    barang[i]:=barang[i-1];
                    barang[i-1]:=temp;
                end;
            end;
        end;
        writeln('Pengerutan berdasarkan nama(asc) selesai');readln;
    end;
    
procedure pengurutan_harga;// pengurutan ini menggunakan metode Bubble short Ascending (dari terkecil ke trbesar)
    var
        tahap,i: integer;
        temp:TBarang;
    begin 
        for tahap := 1 to banyakdata -1 do 
        begin
            for i:=banyakdata downto 2 do
            begin 
                if barang[i].harga < barang[i-1].harga then 
                begin
                    temp:=barang[i];
                    barang[i]:=barang[i-1];
                    barang[i-1]:=temp;
                end;
            end;
        end;
        writeln('Pengerutan berdasarkan harga(asc) selesai');readln;
    end;

procedure pengurutan_menu;
    var
        pilrut:integer;
    begin
        clrscr;
        writeln('Pengurutan berdasarkan : ');
        writeln('1. Berdasarkan Nama ');
        writeln('2. Berdasarkan Harga ');
        writeln('0. Kembali');
        writeln('------------------------------------------');
        write('Pilihan anda : ');read(pilrut);
        case pilrut of 
            1:pengurutan_nama;
            2:pengurutan_harga;
            0:;
            else writeln('Pilhan tidak ditemukan');readln;
        end;
    end;


//procedure pencarian;

procedure filter_nama;
    var 
        i, num : integer;
        filter : string[20];
    begin
        clrscr;
        write('Masukan nama barang yang akan di filter : ');readln(filter);
        writeln ('|  KODE  |     NAMA BARANG      |  HARGA | Qty | SUB TOTAL |');
        writeln ('------------------------------------------------------------');
        num := 1;
        for i:=1 to banyakdata do 
            begin
                if pos(filter, barang[i].nama) > 0 then 
                begin
                    gotoxy(1,num+3);write('|        |                      |        |     |           |');
                    gotoxy(3,num+3);write(barang[i].kode);
                    gotoxy(12,num+3);write(barang[i].nama);
                    gotoxy(34,num+3);write(barang[i].harga:6);
                    gotoxy(44,num+3);write(barang[i].Qty:3);
                    gotoxy(50,num+3);writeln(barang[i].subtotal:9);
                    num:=num+1;
                end;
            end; 
        writeln;
        write('Tekan untuk melanjutkan.');
        readln;
    end;


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
//        writeln('6. Pencarian data');
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
        else 
        if pilihan_menu = 4 then
            Hapus_data
        else
        if pilihan_menu = 5 then
            pengurutan_menu
//       else 
//        if pilihan_menu = 6 then
//            pencarian
        else
        if pilihan_menu = 7 then
            filter_nama
    until pilihan_menu = 0;
    simpanFile;    
end.