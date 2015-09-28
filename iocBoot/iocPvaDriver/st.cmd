# Must have loaded envPaths via st.cmd.linux or st.cmd.win32

errlogInit(20000)

dbLoadDatabase("$(TOP)/dbd/pvaDriverApp.dbd")
pvaDriverApp_registerRecordDeviceDriver(pdbbase)

epicsEnvSet("PREFIX", "13PVA1:")
epicsEnvSet("PORT",   "PVA1")
epicsEnvSet("QSIZE",  "20")
epicsEnvSet("PVNAME", "13SIM1:pva1:Image")
epicsEnvSet("NELM",   "3000000")
epicsEnvSet("EPICS_DB_INCLUDE_PATH", "$(ADCORE)/db")

epicsEnvSet("EPICS_CA_MAX_ARRAY_BYTES", "4000000")

# Create a pvaDriver
# pvaDriverConfig(portName, pvName, maxBuffers, maxMemory, priority, stackSize)
pvaDriverConfig("$(PORT)", "$(PVNAME)", $(QSIZE), 0, 0)
#asynSetTraceMask $(PORT) 0 0xFF
#asynSetTraceInfoMask $(PORT) 0 0x7
dbLoadRecords("pvaDriver.template","P=$(PREFIX),R=cam1:,PORT=$(PORT),ADDR=0,TIMEOUT=1")

# Create a standard arrays plugin, set it to get data from pvaDriver
NDStdArraysConfigure("Image1", $(QSIZE), 1, "$(PORT)", 0)
dbLoadRecords("NDStdArrays.template", "P=$(PREFIX),R=image1:,PORT=Image1,ADDR=0,TIMEOUT=1,NDARRAY_PORT=$(PORT),TYPE=Int8,FTVL=UCHAR,NELEMENTS=$(NELM)")

iocInit()

# Silence a very chatty ASYN_TRACE_FLOW
# Remove this if performance testing
#dbpf 13PVA1:cam1:PoolUsedMem.SCAN Passive
