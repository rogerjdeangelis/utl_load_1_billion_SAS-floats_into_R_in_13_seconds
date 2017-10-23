Loading 1 billion 8 byte SAS floats into R in 13 seconds. Sum product of 1 billon x 1 billion floats in 12 seconds

   These timiings are on a 2008 Dell $600 T7400 workstation with slow DDR2 ram.
   Have been watching the off lease market on ebay to update my workstation.
   Expect the AMD Ryzen to depress workstation prices. $300 Ryzen outperforms $1000 Intel chips.

   WORKING CODE

      read.from <- file("d:/bin/binmat.bin", "rb");
      vector.doubles <- readBin(read.from, n=1000000000, "double");
      format(sum(vector.doubles/vector.doubles),scientific=FALSE);

      [1] "1000000000"

 HAVE
 ====

    one billion SAS floats

    Var
   ===
    1
    2
    3
   ...
   1,000,000,000

 WANT
 ====
   SUM(Var/Var)

   [1] "1,000,000,000"

*                _               _       _
 _ __ ___   __ _| | _____     __| | __ _| |_ __ _
| '_ ` _ \ / _` | |/ / _ \   / _` |/ _` | __/ _` |
| | | | | | (_| |   <  __/  | (_| | (_| | || (_| |
|_| |_| |_|\__,_|_|\_\___|   \__,_|\__,_|\__\__,_|

;

filename bin "d:/bin/binmat.bin" lrecl=32000 recfm=f;
data _null_ bin;
  file bin ;
   do i=1 to 1000000000;
    put i rb8. @ ;
    output;
  end;
run;quit;

NOTE: DATA statement used (Total process time):
      real time           1:36.22

*          _       _   _
 ___  ___ | |_   _| |_(_) ___  _ __
/ __|/ _ \| | | | | __| |/ _ \| '_ \
\__ \ (_) | | |_| | |_| | (_) | | | |
|___/\___/|_|\__,_|\__|_|\___/|_| |_|

;

%utl_submit_r64('
read.from <- file("d:/bin/binmat.bin", "rb");
vector.doubles <- readBin(read.from, n=1000000000, "double");
close(read.from);
format(sum(vector.doubles/vector.doubles),scientific=FALSE);
');

NOTE: 5 lines were written to file PRINT.
NOTE: 4 records were read from the infile RUT.
      The minimum record length was 2.
      The maximum record length was 205.
NOTE: DATA statement used (Total process time):
      real time           25.91 seconds


