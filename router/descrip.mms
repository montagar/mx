MX_FACILITY = ROUTER
.INCLUDE [-]MMSDEFS.MMS

ROUTER_OBJ = MX_ROUTER,PROCESS,FLQ_CLUP,SMTP_CLUP,ENCODE,FILTER,

FLQ_MGR_OBJ = MX_FLQ_MGR,FLQ_CLUP,SMTP_CLUP

MX_ROUTER :	$(BINDIR)MX_ROUTER.EXE,$(BINDIR)MX_FLQ_MGR.EXE
	!MX Router built

PREFETCH :

$(BINDIR)MX_ROUTER.EXE : $(BINDIR)ROUTER.OLB($(ROUTER_OBJ))
    $(LINK)$(LINKFLAGS) $(BINDIR)ROUTER.OLB/INCL=MX_ROUTER/LIB,$(STDOPTS)

$(BINDIR)MX_FLQ_MGR.EXE : $(BINDIR)FLQ_MGR.OLB($(FLQ_MGR_OBJ))
    $(LINK)$(LINKFLAGS) $(BINDIR)FLQ_MGR.OLB/INCL=MX_FLQ_MGR/LIBR,$(STDOPTS)

$(BINDIR)MX_ROUTER.OBJ,-
$(BINDIR)MX_FLQ_MGR.OBJ	: $(MX_SRC_COMMON)AGENT$(L32),$(MX_SRC_COMMON)STATUS$(L32),-
			  $(MX_SRC_COMMON)IPC$(L32)
$(BINDIR)FILTER.OBJ 	: FILTER$(L32),$(MX_SRC_COMMON)MX$(L32)
$(BINDIR)RETURN_MESSAGE.OBJ : $(MX_SRC_COMMON)ROUTER$(L32)

$(BINDIR)PROCESS.OBJ	    : FILTER$(L32), $(MX_SRC_COMMON)ROUTER$(L32), $(MX_SRC_COMMON)FLQ$(L32),-
    	    	    	      $(MX_SRC_COMMON)MX$(L32),$(MX_SRC_COMMON)AGENT$(L32),-
    	    	    	      $(MX_SRC_COMMON)MX_LCLDEFS$(L32)

$(BINDIR)FLQ_CLUP.OBJ	 : $(MX_SRC_COMMON)FLQ$(L32), $(MX_SRC_COMMON)MX$(L32),-
			   $(MX_SRC_COMMON)IPC$(L32), $(MX_SRC_COMMON)AGENT$(L32),-
			   $(MX_SRC_COMMON)FIELDS$(L32)

$(BINDIR)SMTP_CLUP.OBJ	:  $(MX_SRC_COMMON)MX$(L32)
