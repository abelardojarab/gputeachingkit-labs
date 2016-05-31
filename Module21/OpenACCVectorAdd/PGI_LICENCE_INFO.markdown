Follow these steps to access and activate your PGI trial software.

1.  [Create a PGI account](https://www.pgroup.com/account/register.php) (please use the same email address used for your Teaching Kit request), or [login](https://www.pgroup.com/account/login.php) if you already have one.
2.  For a new account, you will receive an account activation email that includes 30-day trial keys. Ignore these keys and use the longer-term keys provided below which expire 31-December-2016.
3.  [Download](http://www.pgroup.com/support/downloads.php) the latest software for your system.
4.  Install the software as directed in the [PGI Installation Guide](http://www.pgroup.com/doc/pgiinstall.pdf) or [PGI Visual Fortran Installation Guide](http://www.pgroup.com/doc/pvfinstall.pdf).
5.  Copy the license key text below into a file named license.dat in your PGI installation directory, which is by default /opt/pgi on linux and C:\Program Files\PGI on Windows.
6.  You may install the software and license keys on systems used for your teaching activities. Students should register on [pgroup.com](http://pgroup.com/) to download and install software, but you may distribute the license keys below to them for classroom activities.  Re-distribution of the software or license keys is prohibited except as provided herein.
7.  By using the software, you agree to be bound by the [PGI End-User License Agreement](http://www.pgroup.com/doc/LICENSE.txt).


~~~
SERVER ANY ANY
PACKAGE PGI2016-STARTER pgroupd 2016.1231 COMPONENTS="pgi-hpf-lin64 \
   pgi-f95-lin64 pgi-f77-lin64 pgi-cc-lin64 pgi-cpp-lin64 \
   pgi-gpp-lin64 pgi-hpf-lin32 pgi-f95-lin32 pgi-f77-lin32 \
   pgi-cc-lin32 pgi-cpp-lin32 pgi-gpp-lin32 pgi-f95-win64 \
   pgi-f77-win64 pgi-cc-win64 pgi-cpp-win64 pgi-gpp-win64 \
   pgi-f95-win32 pgi-f77-win32 pgi-cc-win32 pgi-cpp-win32 \
   pgi-gpp-win32 pgi-f95-osx64 pgi-f77-osx64 pgi-cc-osx64 \
   pgi-cpp-osx64 pgi-gpp-osx64 pgi-f95-osx32 pgi-f77-osx32 \
   pgi-cc-osx32 pgi-cpp-osx32 pgi-gpp-osx32 pgi-prof-lin64 \
   pgi-prof-lin32 pgi-prof-win64 pgi-prof-win32 pgi-prof-osx64 \
   pgi-prof-osx32 pgi-dbg-lin64 pgi-dbg-lin32 pgi-dbg-win64 \
   pgi-dbg-win32 pgi-dbg-osx64 pgi-dbg-osx32 pgi-pvf pghpf \
   pgfortran pgcc pgc++ pvf pgprof pgdbg" OPTIONS=SUITE \
   SIGN="1FBB BBBB 2CE9 DC89 8D58 68A6 0B48 0E5A FEBC 35C4 CE3B \
   AEAD 68A4 C13E 9DF0 0A4E 0BC4 73C6 9481 DB94 BE8B 0958 4604 \
   51E8 F1D0 B3F7 4697 4EC7 BF34 FA88"
FEATURE PGI2016-STARTER pgroupd 2016.1231 31-dec-2016 uncounted \
   VENDOR_STRING=STARTER:16:cdk:accel HOSTID=DEMO \
   PLATFORMS="accel nv lin-acc x64_lsb x64_re x64_se i86_lsb \
   i86_re i86_se win-acc x64_n i86_n osx-acc x64_mac i86_mac cdk" \
   SUITE_DUP_GROUP=UH TS_OK SIGN="0F7A 4B13 9CD0 985E 19F8 8C76 \
   387E E345 2D06 2A1F A026 D17E 6A42 F615 210B 0C60 5874 A34F \
   2C00 D98E 2EB7 DCC8 B838 44B5 274D 0DEB BA2A 4A86 31FA 9F96"
~~~