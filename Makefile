NEPTUNE_SRC   := src
NEPTUNE_BUILD := build
NEPTUNE_OBJ   := $(NEPTUNE_BUILD)/obj
NEPTUNE_MOD   := $(NEPTUNE_BUILD)/mod
NEPTUNE_BIN   := $(NEPTUNE_BUILD)/bin

ifdef CI_SERVER
  CC  := gcc
  CXX := g++
  FC  := gfortran

  MOD_OPTION := -J$(NEPTUNE_MOD)
else
  CC  := icc
  CXX := icpc
  FC  := ifort

  MOD_OPTION := -module $(NEPTUNE_MOD)
endif

default:
	mkdir -p $(NEPTUNE_OBJ)
	mkdir -p $(NEPTUNE_MOD)
	mkdir -p $(NEPTUNE_BIN)
	$(FC) $(MOD_OPTION) -c -o $(NEPTUNE_OBJ)/a_module.o $(NEPTUNE_SRC)/a_module.F90
	$(FC) $(MOD_OPTION) -o $(NEPTUNE_BIN)/main_1 $(NEPTUNE_SRC)/main_1.F90 $(NEPTUNE_OBJ)/a_module.o

clean:
	rm -rf $(NEPTUNE_BUILD)

