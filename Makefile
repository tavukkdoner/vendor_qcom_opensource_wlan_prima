default: all

KBUILD_OPTIONS := WLAN_ROOT=$(PWD)
KBUILD_OPTIONS += MODNAME=wlan

all::
	$(MAKE) -C $(KERNEL_SOURCE) M=$(CURDIR) $(KBUILD_OPTIONS) ARCH=$(ARCH) CC=${CC} V=1 modules

modules_install:
	$(MAKE) INSTALL_MOD_STRIP=1 -C $(KERNEL_SRC) M=$(shell pwd) modules_install

clean::
	rm -f *.o *.ko *.mod.c *.mod.o *~ .*.cmd Module.symvers
	rm -rf .tmp_versions


