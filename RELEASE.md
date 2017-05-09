pvaDriver Releases
==================

The latest untagged master branch can be obtained at
https://github.com/areaDetector/pvaDriver.

Tagged source code releases can be obtained at 
https://github.com/areaDetector/pvaDriver/releases.

The versions of EPICS base, asyn, and other synApps modules used for each release can be obtained from 
the EXAMPLE_RELEASE_PATHS.local, EXAMPLE_RELEASE_LIBS.local, and EXAMPLE_RELEASE_PRODS.local
files respectively, in the configure/ directory of the appropriate release of the 
[top-level areaDetector](https://github.com/areaDetector/areaDetector) repository.


Release Notes
=============

R1-2 (May 9, 2017)
====================
* Reject invalid PV name when creating monitor.


R1-1 (February 22, 2017)
====================
* Added new parameters ADSerialNumber, ADFirmwareVersion, ADSDKVersion, NDDriverVersion. 
  Minor change to driver and medm screen.


R1-0 (November 22, 2016)
========================
* Initial release as a separate repository.  Prior to R1-0 pvaDriver was contained in the ADCore
repository (R2-5 of ADCore only).

