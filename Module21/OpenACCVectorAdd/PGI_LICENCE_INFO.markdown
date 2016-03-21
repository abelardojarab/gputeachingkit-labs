Follow these steps to access and activate your PGI trial software.

1.  [Create a PGI account](https://www.pgroup.com/account/register.php) (please use the same email address used for your Teaching Kit request), or [login](https://www.pgroup.com/account/login.php) if you already have one.
2.  For a new account, you will receive an account activation email that includes 30-day trial keys. Ignore these keys and use the longer-term keys provided below which expire 06-June-2016.
3.  [Download](http://www.pgroup.com/support/downloads.php) the latest software for your system.
4.  Install the software as directed in the [PGI Installation Guide](http://www.pgroup.com/doc/pgiinstall.pdf) or [PGI Visual Fortran Installation Guide](http://www.pgroup.com/doc/pvfinstall.pdf).
5.  Copy the license key text below into a file named license.dat in your PGI installation directory, which is by default /opt/pgi on linux and C:\Program Files\PGI on Windows.
6.  You may install the software and license keys on systems used for your teaching activities. Students should register on [pgroup.com](http://pgroup.com/) to download and install software, but you may distribute the license keys below to them for classroom activities.  Re-distribution of the software or license keys is prohibited except as provided herein.
7.  By using the software, you agree to be bound by the [PGI End-User License Agreement](http://www.pgroup.com/doc/LICENSE.txt).


~~~
SERVER ANY ANY
PACKAGE PGI2016-STARTER pgroupd 2016.0630 5198B317C3F0 \
   COMPONENTS="pgi-hpf-lin64 pgi-f95-lin64 pgi-f77-lin64 \
   pgi-cc-lin64 pgi-cpp-lin64 pgi-gpp-lin64 pgi-hpf-lin32 \
   pgi-f95-lin32 pgi-f77-lin32 pgi-cc-lin32 pgi-cpp-lin32 \
   pgi-gpp-lin32 pgi-f95-win64 pgi-f77-win64 pgi-cc-win64 \
   pgi-cpp-win64 pgi-gpp-win64 pgi-f95-win32 pgi-f77-win32 \
   pgi-cc-win32 pgi-cpp-win32 pgi-gpp-win32 pgi-f95-osx64 \
   pgi-f77-osx64 pgi-cc-osx64 pgi-cpp-osx64 pgi-gpp-osx64 \
   pgi-f95-osx32 pgi-f77-osx32 pgi-cc-osx32 pgi-cpp-osx32 \
   pgi-gpp-osx32 pgi-prof-lin64 pgi-prof-lin32 pgi-prof-win64 \
   pgi-prof-win32 pgi-prof-osx64 pgi-prof-osx32 pgi-dbg-lin64 \
   pgi-dbg-lin32 pgi-dbg-win64 pgi-dbg-win32 pgi-dbg-osx64 \
   pgi-dbg-osx32 pgi-pvf pghpf pgfortran pgcc pgc++ pvf pgprof \
   pgdbg" OPTIONS=SUITE SIGN="01AE D901 B5F4 EB53 BF65 BECC 00C3 \
   25FE 8F24 17ED 7474 5474 751B D2A6 D2F1 0F47 1CED 6FB0 19E1 \
   DF7C D9DD 0919 9281 7E0F E90F 03BB 62E3 12E8 5433 9E5A"
FEATURE PGI2016-STARTER pgroupd 2016.0630 30-jun-2016 uncounted \
   65EF67CD99F6 VENDOR_STRING=STARTER:16:cdk:accel HOSTID=DEMO \
   PLATFORMS="lin-acc x64_lsb i86_lsb win-acc x64_n i86_n osx-acc \
   x64_mac i86_mac cdk" SUITE_DUP_GROUP=UH TS_OK SIGN="0E20 EFD1 \
   E342 CE0E 4B1F 1226 488E 266D 05A3 B94E DBC1 59E9 55C0 A978 \
   E610 11D3 D012 B2AD CDF0 D6FD 5F5D 53C9 F527 5D39 3606 9B1C \
   ACE9 13CF 93B1 273E"
~~~