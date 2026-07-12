# to run just type make run in the terminal

# here you write the name of the top module (not the file) you need to run
TOP ?= arb_top

# here you write the name of the folder that has the files you need to run
# if the files are in the same path as the makefile just write .
# the . works for all files meaning you dont need to write each file's path,
# verilator will search everywhere for *.sv files under SRC_DIR
SRC_DIR ?= .

export PATH := /c/msys64/ucrt64/bin:$(PATH)

# Find every .sv file under SRC_DIR (used only to build -I search paths,
# so `include "file.sv"` can find files sitting in other lab folders).
ALL_SV_FILES := $(shell find $(SRC_DIR) -name "*.sv")
INC_DIRS      := $(sort $(dir $(ALL_SV_FILES)))
INC_FLAGS     := $(addprefix -I,$(INC_DIRS))

# The top-level tb file itself, e.g. "Lab_six_tb.sv" for TOP=Lab_six_tb.
# Because that file uses `include to pull in the DUT and stimulus class,
# we must hand Verilator ONLY this one file, not every .sv file we found
# above -- otherwise the included files get compiled twice (once standalone,
# once pasted into the tb) and Verilator reports duplicate definitions.
#
# TOP_FILE_MATCHES may contain more than one path if a duplicate/backup
# folder exists somewhere under SRC_DIR (e.g. "Lab_six copy"). Rather than
# silently feeding all matches to Verilator (which breaks the build, or
# worse, mangles paths that contain spaces), we pick the first match and
# warn loudly if there's more than one so it doesn't go unnoticed.
TOP_FILE_MATCHES := $(shell find $(SRC_DIR) -name "$(TOP).sv")
TOP_FILE := $(firstword $(TOP_FILE_MATCHES))

run:
ifeq ($(words $(TOP_FILE_MATCHES)),0)
	$(error No file named $(TOP).sv found under $(SRC_DIR))
endif
ifneq ($(words $(TOP_FILE_MATCHES)),1)
	$(warning Multiple files named $(TOP).sv found: $(TOP_FILE_MATCHES) -- using $(TOP_FILE). Consider removing the duplicate(s).)
endif
	rm -rf obj_dir
	verilator --binary --timing --assert -CFLAGS "-std=gnu++17" \
		-Wno-fatal \
		-Wno-WIDTHTRUNC \
		$(INC_FLAGS) \
		--top-module $(TOP) \
		$(TOP_FILE)
	./obj_dir/V$(TOP)

clean:
	rm -rf obj_dir