TOP=../..
include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

#----------------------------------------------------
#  Optimization of db files using dbst (DEFAULT: NO)
#DB_OPT = YES

#----------------------------------------------------
# Create and install (or just install)
# databases, templates, substitutions like this

# General
DB += NDArrayBase.template
DB += ADBase.template
DB += ADPrefixes.template

# Drivers
DB += pvaDriver.template

# Plugins
DB += NDAttribute.template
DB += NDAttributeN.template
DB += NDCircularBuff.template
DB += NDColorConvert.template
DB += NDFFT.template
DB += NDFile.template
DB += NDFileHDF5.template
DB += NDFileJPEG.template
DB += NDFileMagick.template
DB += NDFileNetCDF.template
DB += NDFileNexus.template
DB += NDFileTIFF.template
DB += NDOverlay.template
DB += NDOverlayN.template
DB += NDPluginBase.template
DB += NDPosPlugin.template
DB += NDProcess.template
DB += NDPva.template
DB += NDROI.template
DB += NDROIStat.template
DB += NDROIStatN.template
DB += NDROIStat8.template
DB += NDStats.template
DB += NDStdArrays.template
DB += NDTimeSeries.template
DB += NDTimeSeriesN.template
DB += NDTransform.template

#----------------------------------------------------
# If <anyname>.db template is not named <anyname>*.template add
# <anyname>_template = <templatename>

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

