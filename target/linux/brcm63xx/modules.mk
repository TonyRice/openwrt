#
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define KernelPackage/bcm63xx-spi
  SUBMENU:=$(SPI_MENU)
  TITLE:=Broadcom BCM63xx SPI driver
  DEPENDS:=@TARGET_brcm63xx +kmod-spi-bitbang
  KCONFIG:=CONFIG_SPI_BCM63XX
  ifeq ($(strip $(call CompareKernelPatchVer,$(KERNEL_PATCHVER),ge,3.3)),1)
    FILES:=$(LINUX_DIR)/drivers/spi/spi-bcm63xx.ko
    AUTOLOAD:=$(call AutoLoad,92,spi-bcm63xx)
  else
    FILES:=$(LINUX_DIR)/drivers/spi/bcm63xx_spi.ko
    AUTOLOAD:=$(call AutoLoad,92,bcm63xx_spi)
  endif
endef

define KernelPackage/bcm63xx-spi/description
  This package contains the Broadcom BCM63xx SPI Master driver
endef

$(eval $(call KernelPackage,bcm63xx-spi))


define KernelPackage/pcmcia-bcm63xx
  SUBMENU:=$(PCMCIA_MENU)
  TITLE:=Broadcom BCM63xx PCMCIA support
  DEPENDS:=@TARGET_brcm63xx +kmod-pcmcia-rsrc
  KCONFIG:=CONFIG_PCMCIA_BCM63XX
  FILES:=$(LINUX_DIR)/drivers/pcmcia/bcm63xx_pcmcia.ko
  AUTOLOAD:=$(call AutoLoad,41,bcm63xx_pcmcia)
endef

define KernelPackage/pcmcia-bcm63xx/description
  Kernel support for PCMCIA/CardBus controller on the BCM63xx SoC
endef

$(eval $(call KernelPackage,pcmcia-bcm63xx))
