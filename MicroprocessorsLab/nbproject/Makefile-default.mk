#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=cof
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/MicroprocessorsLab.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/MicroprocessorsLab.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=config.asm UART.asm ADC.asm "LCD - Copy.asm" Simple1.asm

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/config.o ${OBJECTDIR}/UART.o ${OBJECTDIR}/ADC.o "${OBJECTDIR}/LCD - Copy.o" ${OBJECTDIR}/Simple1.o
POSSIBLE_DEPFILES=${OBJECTDIR}/config.o.d ${OBJECTDIR}/UART.o.d ${OBJECTDIR}/ADC.o.d "${OBJECTDIR}/LCD - Copy.o.d" ${OBJECTDIR}/Simple1.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/config.o ${OBJECTDIR}/UART.o ${OBJECTDIR}/ADC.o ${OBJECTDIR}/LCD\ -\ Copy.o ${OBJECTDIR}/Simple1.o

# Source Files
SOURCEFILES=config.asm UART.asm ADC.asm LCD - Copy.asm Simple1.asm


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/MicroprocessorsLab.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=18f87k22
MP_LINKER_DEBUG_OPTION= 
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/config.o: config.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/config.o.d 
	@${RM} ${OBJECTDIR}/config.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/config.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_ICD3=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/config.lst\" -e\"${OBJECTDIR}/config.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/config.o\" \"config.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/config.o"
	@${FIXDEPS} "${OBJECTDIR}/config.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/UART.o: UART.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/UART.o.d 
	@${RM} ${OBJECTDIR}/UART.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/UART.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_ICD3=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/UART.lst\" -e\"${OBJECTDIR}/UART.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/UART.o\" \"UART.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/UART.o"
	@${FIXDEPS} "${OBJECTDIR}/UART.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/ADC.o: ADC.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ADC.o.d 
	@${RM} ${OBJECTDIR}/ADC.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/ADC.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_ICD3=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/ADC.lst\" -e\"${OBJECTDIR}/ADC.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/ADC.o\" \"ADC.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/ADC.o"
	@${FIXDEPS} "${OBJECTDIR}/ADC.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/LCD\ -\ Copy.o: LCD\ -\ Copy.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} "${OBJECTDIR}/LCD - Copy.o".d 
	@${RM} "${OBJECTDIR}/LCD - Copy.o" 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/LCD - Copy.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_ICD3=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/LCD - Copy.lst\" -e\"${OBJECTDIR}/LCD - Copy.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/LCD - Copy.o\" \"LCD - Copy.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/LCD - Copy.o"
	@${FIXDEPS} "${OBJECTDIR}/LCD - Copy.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Simple1.o: Simple1.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Simple1.o.d 
	@${RM} ${OBJECTDIR}/Simple1.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Simple1.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_ICD3=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Simple1.lst\" -e\"${OBJECTDIR}/Simple1.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Simple1.o\" \"Simple1.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Simple1.o"
	@${FIXDEPS} "${OBJECTDIR}/Simple1.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
else
${OBJECTDIR}/config.o: config.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/config.o.d 
	@${RM} ${OBJECTDIR}/config.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/config.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/config.lst\" -e\"${OBJECTDIR}/config.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/config.o\" \"config.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/config.o"
	@${FIXDEPS} "${OBJECTDIR}/config.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/UART.o: UART.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/UART.o.d 
	@${RM} ${OBJECTDIR}/UART.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/UART.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/UART.lst\" -e\"${OBJECTDIR}/UART.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/UART.o\" \"UART.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/UART.o"
	@${FIXDEPS} "${OBJECTDIR}/UART.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/ADC.o: ADC.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ADC.o.d 
	@${RM} ${OBJECTDIR}/ADC.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/ADC.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/ADC.lst\" -e\"${OBJECTDIR}/ADC.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/ADC.o\" \"ADC.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/ADC.o"
	@${FIXDEPS} "${OBJECTDIR}/ADC.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/LCD\ -\ Copy.o: LCD\ -\ Copy.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} "${OBJECTDIR}/LCD - Copy.o".d 
	@${RM} "${OBJECTDIR}/LCD - Copy.o" 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/LCD - Copy.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/LCD - Copy.lst\" -e\"${OBJECTDIR}/LCD - Copy.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/LCD - Copy.o\" \"LCD - Copy.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/LCD - Copy.o"
	@${FIXDEPS} "${OBJECTDIR}/LCD - Copy.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Simple1.o: Simple1.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Simple1.o.d 
	@${RM} ${OBJECTDIR}/Simple1.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Simple1.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Simple1.lst\" -e\"${OBJECTDIR}/Simple1.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Simple1.o\" \"Simple1.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Simple1.o"
	@${FIXDEPS} "${OBJECTDIR}/Simple1.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/MicroprocessorsLab.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE)   -p$(MP_PROCESSOR_OPTION)  -w -x -u_DEBUG -z__ICD2RAM=1 -m"${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"   -z__MPLAB_BUILD=1  -z__MPLAB_DEBUG=1 -z__MPLAB_DEBUGGER_ICD3=1 $(MP_LINKER_DEBUG_OPTION) -odist/${CND_CONF}/${IMAGE_TYPE}/MicroprocessorsLab.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
else
dist/${CND_CONF}/${IMAGE_TYPE}/MicroprocessorsLab.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE)   -p$(MP_PROCESSOR_OPTION)  -w  -m"${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"   -z__MPLAB_BUILD=1  -odist/${CND_CONF}/${IMAGE_TYPE}/MicroprocessorsLab.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
