pvaDriver
=========

An areaDetector pvAccess driver

:author: Bruno Martins, Brookhaven National Laboratory

.. contents:: Contents

Introduction
------------

This is an :doc:`../index` driver for importing an EPICSv4 NTNDArray via 
pvAccess into areaDetector. It does so by creating a monitor on the specified 
PV.

This driver inherits from :doc:`../ADCore/ADDriver`. It implements some of the
parameters in `asynNDArrayDriver.h`_ and in `ADArrayDriver.h`_, namely:

+ ``ADManufacturer``
+ ``ADModel``
+ ``ADAcquire``
+ ``ADImageMode``
+ ``ADNumImages``
+ ``ADMaxSizeX`` and ``ADMaxSizeY``
+ ``ADMinX`` and ``ADMinY``
+ ``ADBinX`` and ``ADBinY``
+ ``ADReverseX`` and ``ADReverseY``
+ ``ADSizeX`` and ``ADSizeY``
+ ``ADNumImagesCounter``
+ ``NDArraySize``, ``NDArraySizeX`` and ``NDArraySizeY``
+ ``NDDataType`` and ``NDColorMode``
+ ``NDArrayCounter``

It also implements a few parameters that are specific to the pvAccess driver.


pvAccess driver specific parameters
-----------------------------------

The pvAccess driver-specific parameters are the following:

.. cssclass:: table-bordered table-striped table-hover
.. flat-table::
  :header-rows: 2
  :widths: 14 10 5 28 10 18 15

  * -
    -
    - **Parameter Definitions in pvaDriver.cpp and EPICS Record Definitions**
      **in pvaDriver.template**
  * - Parameter index variable
    - asyn interface
    - Access
    - Description
    - drvInfo string
    - EPICS record name
    - EPICS record type
  * - OverrunCounter
    - asynInt32
    - r/w
    - Number of overruns occured
    - ``OVERRUN_COUNTER``
    - ``$(P)$(R)OverrunCounter``, ``$(P)$(R)OverrunCounter_RBV``
    - longout, longin
  * - PvName
    - asynOctet
    - r/w
    - Name of the PV to monitor. This can be changed a run-time.
    - ``PV_NAME``
    - ``$(P)$(R)PvName``, ``$(P)$(R)PvName_RBV``
    - waveform, waveform
  * - PvConnectionStatus
    - asynInt32
    - r/o
    - Status of the connection to the server
    - ``PV_CONNECTION``
    - ``$(P)$(R)PvConnection_RBV``
    - bi


Configuration
-------------

The pvaDriver driver is created with the pvaDriverConfig command, either from
C/C++ or from the EPICS IOC shell. ::

    int pvaDriverConfig(const char *portName, const char *pvName,
                          int maxSizeX, int maxSizeY, int dataType,
                          int maxBuffers, size_t maxMemory,
                          int priority, int stackSize)

The pvaDriver-specific fields in this command are:

+ ``pvName`` Name of the PV to be monitored.

For details on the meaning of the other parameters to this function refer to
the detailed documentation on the ``pvaDriverConfig`` function in the
`pvaDriver.cpp documentation`_ and in the documentation for the constructor
for the `pvaDriver class`_.

There is an example IOC boot directory and startup script provided with
areaDetector: :doc:`st_cmd`.

The MEDM screen for the pvaDriver is shown below.

.. image:: ADPvaDriver.png


.. _pvaDriver.cpp documentation: ../areaDetectorDoxygenHTML/pva_driver_8cpp.html
.. _asynNDArrayDriver.h: ../areaDetectorDoxygenHTML/asyn_n_d_array_driver_8h.html
.. _ADArrayDriver.h: ../areaDetectorDoxygenHTML/_a_d_driver_8h.html
.. _pvaDriver class: ../areaDetectorDoxygenHTML/classpva_driver.html