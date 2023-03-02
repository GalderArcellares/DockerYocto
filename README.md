# DockerYocto

source oe-init-build-env

nano conf/local.conf --> modify maquine qemux86 --> zedboard-zynq7
nano conf/bblayers.conf --> modify the layers add:
  /Yocto/poky/meta-xilinx/meta-xilinx-bsp \
  /Yocto/poky/meta-xilinx/meta-xilinx-standalone \
  /Yocto/poky/meta-openamp \
  /Yocto/poky/meta-xilinx-tools \
  /Yocto/poky/meta-openembedded/meta-oe \
  /Yocto/poky/meta-openembedded/meta-python \
  /Yocto/poky/meta-openembedded/meta-networking \
  /Yocto/poky/meta-adi/meta-adi-core \
  /Yocto/poky/meta-adi/meta-adi-xilinx \

Errors:
	Error:
		WARNING: /Yocto/poky/meta-xilinx/meta-xilinx-bsp/recipes-bsp/device-tree/device-tree.bb: KERNEL_DTB is not defined. Your build is likely to fail! Make sure to define it in a conf file...
	Solution:
		nano ../meta-xilinx/meta-xilinx-bsp/recipes-bsp/device-tree/device-tree.bb 
		KERNEL_DTB= "zynq-zed-adv7511-ad9361-fmcomms2-3"
		KERNEL_DTB= "zedboard-zynq7"
	Error:
		ERROR: ParseError at /Yocto/poky/meta-xilinx-tools/recipes-bsp/ai-engine/aiefal_1.0.bb:19: Could not inherit file classes/yocto-cmake-translation.bbclass
		
	Solution:
		include layer meta-openamp
	Error:
		ERROR: No recipes in default available for:
		/Yocto/poky/meta-xilinx-tools/recipes-bsp/embeddedsw/fsbl-firmware_git.bbapend
		/Yocto/poky/meta-xilinx-tools/recipes-bsp/embeddedsw/fsbl.bbapend
	Solution:
		Delete the files, not ideal but it worked

bitbake core-image-minimal
