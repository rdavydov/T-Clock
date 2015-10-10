#------------------------------------------------------------------------------#
# This makefile was generated by 'cbp2make' tool rev.147                       #
#------------------------------------------------------------------------------#


WORKDIR = `pwd`

CC0 = gcc
CXX0 = g++
AR0 = ar
LD0 = g++
WINDRES0 = windres

INC0 = 
CFLAGS0 = -fno-ident -Wall -std=c99 -fvisibility=hidden -D_POSIX=1 -D_POSIX_C_SOURCE=200112L -D__STDC_FORMAT_MACROS -D__USE_MINGW_ANSI_STDIO=0 -D__MINGW_USE_VC2005_COMPAT -DWINVER=0x0501 -DPSAPI_VERSION=1 -DWIN2K_COMPAT
RESINC0 = 
LIBDIR0 = 
LIB0 = -ladvapi32 -lshell32 -luser32 -lpsapi -lcomctl32
LDFLAGS0 = -static

CC1 = i686-w64-mingw32-gcc
CXX1 = i686-w64-mingw32-g++
AR1 = i686-w64-mingw32-ar
LD1 = i686-w64-mingw32-g++
WINDRES1 = i686-w64-mingw32-windres

INC1 = 
CFLAGS1 = -fno-ident -Wall -std=c99 -fvisibility=hidden -D_POSIX=1 -D_POSIX_C_SOURCE=200112L -D__STDC_FORMAT_MACROS -D__USE_MINGW_ANSI_STDIO=0 -D__MINGW_USE_VC2005_COMPAT -DWINVER=0x0501 -DPSAPI_VERSION=1 -DWIN2K_COMPAT
RESINC1 = 
LIBDIR1 = 
LIB1 = -ladvapi32 -lshell32 -luser32 -lpsapi -lcomctl32
LDFLAGS1 = -static

INC_RELEASE = $(INC1)
CFLAGS_RELEASE = $(CFLAGS1) -O3 -m32 -DNDEBUG
RESINC_RELEASE = $(RESINC1)
RCFLAGS_RELEASE = $(RCFLAGS1)
LIBDIR_RELEASE = $(LIBDIR1)
LIB_RELEASE = $(LIB1)
LDFLAGS_RELEASE = $(LDFLAGS1) -s -m32
OBJDIR_RELEASE = ../.obj/gcc
DEP_RELEASE = 
OUT_RELEASE = ../../Release/misc/XPCalendar.exe

INC_DEBUG = $(INC1)
CFLAGS_DEBUG = $(CFLAGS1) -m32 -g -fno-omit-frame-pointer -D_DEBUG
RESINC_DEBUG = $(RESINC1)
RCFLAGS_DEBUG = $(RCFLAGS1)
LIBDIR_DEBUG = $(LIBDIR1)
LIB_DEBUG = $(LIB1)
LDFLAGS_DEBUG = $(LDFLAGS1) -m32
OBJDIR_DEBUG = ../.obj/gcc/dbg
DEP_DEBUG = 
OUT_DEBUG = ../../Debug/misc/XPCalendar.exe

OBJ_RELEASE = $(OBJDIR_RELEASE)/__/Calendar/DeskCalendar.o \
	$(OBJDIR_RELEASE)/__/Calendar/resource.o \
	$(OBJDIR_RELEASE)/__/common/clock.o \
	$(OBJDIR_RELEASE)/__/common/newapi.o \
	$(OBJDIR_RELEASE)/__/common/utl.o \
	$(OBJDIR_RELEASE)/__/common/win2k_compat.o

OBJ_DEBUG = $(OBJDIR_DEBUG)/__/Calendar/DeskCalendar.o \
	$(OBJDIR_DEBUG)/__/Calendar/resource.o \
	$(OBJDIR_DEBUG)/__/common/clock.o \
	$(OBJDIR_DEBUG)/__/common/newapi.o \
	$(OBJDIR_DEBUG)/__/common/utl.o \
	$(OBJDIR_DEBUG)/__/common/win2k_compat.o

all: before_build build_release build_debug after_build

clean: clean_release clean_debug

before_build: 
	../common/AutoVersion --git . ../common/version.h

after_build: 

before_release: 
	test -d ../../Release/misc || mkdir -p ../../Release/misc
	test -d $(OBJDIR_RELEASE)/__/Calendar || mkdir -p $(OBJDIR_RELEASE)/__/Calendar
	test -d $(OBJDIR_RELEASE)/__/common || mkdir -p $(OBJDIR_RELEASE)/__/common

after_release: 

build_release: before_release out_release after_release

release: before_build build_release after_build

out_release: before_release $(OBJ_RELEASE) $(DEP_RELEASE)
	$(LD1) $(LIBDIR_RELEASE) -o $(OUT_RELEASE) $(OBJ_RELEASE)  $(LDFLAGS_RELEASE) -mwindows $(LIB_RELEASE)

$(OBJDIR_RELEASE)/__/Calendar/DeskCalendar.o: ../Calendar/DeskCalendar.c
	$(CC1) $(CFLAGS_RELEASE) $(INC_RELEASE) -c ../Calendar/DeskCalendar.c -o $(OBJDIR_RELEASE)/__/Calendar/DeskCalendar.o

$(OBJDIR_RELEASE)/__/Calendar/resource.o: ../Calendar/resource.rc
	$(WINDRES1) -i ../Calendar/resource.rc -J rc -o $(OBJDIR_RELEASE)/__/Calendar/resource.o -O coff $(INC_RELEASE)

$(OBJDIR_RELEASE)/__/common/clock.o: ../common/clock.c
	$(CC1) $(CFLAGS_RELEASE) $(INC_RELEASE) -c ../common/clock.c -o $(OBJDIR_RELEASE)/__/common/clock.o

$(OBJDIR_RELEASE)/__/common/newapi.o: ../common/newapi.c
	$(CC1) $(CFLAGS_RELEASE) $(INC_RELEASE) -c ../common/newapi.c -o $(OBJDIR_RELEASE)/__/common/newapi.o

$(OBJDIR_RELEASE)/__/common/utl.o: ../common/utl.c
	$(CC1) $(CFLAGS_RELEASE) $(INC_RELEASE) -c ../common/utl.c -o $(OBJDIR_RELEASE)/__/common/utl.o

$(OBJDIR_RELEASE)/__/common/win2k_compat.o: ../common/win2k_compat.c
	$(CC1) $(CFLAGS_RELEASE) $(INC_RELEASE) -c ../common/win2k_compat.c -o $(OBJDIR_RELEASE)/__/common/win2k_compat.o

clean_release: 
	rm -f $(OBJ_RELEASE) $(OUT_RELEASE)
	rm -rf $(OBJDIR_RELEASE)/__/Calendar
	rm -rf $(OBJDIR_RELEASE)/__/common

before_debug: 
	test -d ../../Debug/misc || mkdir -p ../../Debug/misc
	test -d $(OBJDIR_DEBUG)/__/Calendar || mkdir -p $(OBJDIR_DEBUG)/__/Calendar
	test -d $(OBJDIR_DEBUG)/__/common || mkdir -p $(OBJDIR_DEBUG)/__/common

after_debug: 
	objcopy --only-keep-debug ../../Debug/misc/XPCalendar.exe ../../Debug/misc/XPCalendar.dbg
	objcopy --strip-debug --strip-unneeded --add-gnu-debuglink=../../Debug/misc/XPCalendar.dbg ../../Debug/misc/XPCalendar.exe

build_debug: before_debug out_debug after_debug

debug: before_build build_debug after_build

out_debug: before_debug $(OBJ_DEBUG) $(DEP_DEBUG)
	$(LD1) $(LIBDIR_DEBUG) -o $(OUT_DEBUG) $(OBJ_DEBUG)  $(LDFLAGS_DEBUG) -mwindows $(LIB_DEBUG)

$(OBJDIR_DEBUG)/__/Calendar/DeskCalendar.o: ../Calendar/DeskCalendar.c
	$(CC1) $(CFLAGS_DEBUG) $(INC_DEBUG) -c ../Calendar/DeskCalendar.c -o $(OBJDIR_DEBUG)/__/Calendar/DeskCalendar.o

$(OBJDIR_DEBUG)/__/Calendar/resource.o: ../Calendar/resource.rc
	$(WINDRES1) -i ../Calendar/resource.rc -J rc -o $(OBJDIR_DEBUG)/__/Calendar/resource.o -O coff $(INC_DEBUG)

$(OBJDIR_DEBUG)/__/common/clock.o: ../common/clock.c
	$(CC1) $(CFLAGS_DEBUG) $(INC_DEBUG) -c ../common/clock.c -o $(OBJDIR_DEBUG)/__/common/clock.o

$(OBJDIR_DEBUG)/__/common/newapi.o: ../common/newapi.c
	$(CC1) $(CFLAGS_DEBUG) $(INC_DEBUG) -c ../common/newapi.c -o $(OBJDIR_DEBUG)/__/common/newapi.o

$(OBJDIR_DEBUG)/__/common/utl.o: ../common/utl.c
	$(CC1) $(CFLAGS_DEBUG) $(INC_DEBUG) -c ../common/utl.c -o $(OBJDIR_DEBUG)/__/common/utl.o

$(OBJDIR_DEBUG)/__/common/win2k_compat.o: ../common/win2k_compat.c
	$(CC1) $(CFLAGS_DEBUG) $(INC_DEBUG) -c ../common/win2k_compat.c -o $(OBJDIR_DEBUG)/__/common/win2k_compat.o

clean_debug: 
	rm -f $(OBJ_DEBUG) $(OUT_DEBUG)
	rm -rf $(OBJDIR_DEBUG)/__/Calendar
	rm -rf $(OBJDIR_DEBUG)/__/common

.PHONY: before_build after_build before_release after_release clean_release before_debug after_debug clean_debug

