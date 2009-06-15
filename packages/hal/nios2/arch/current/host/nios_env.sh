# Set up a Cygwin enviornment to build eCos w/Quartus 8.1
#
# This needs work...
#
# You may need to run dos2unix on some of the perl scripts in Quartus since
# Quartus ships with an aging Cygwin version
# 
# See setup.sh

if [ "`uname`" != "Linux" ] then
	export CYGWIN=nontsec
fi

export NIOS_ECOS=`pwd`/../../nios2ecos/packages

if [ "`uname`" != "Linux" ] then

# DANGER!!! here we need windows-like paths for compatibility.
export QUARTUS_ROOTDIR=c:/altera/81/quartus
export SOPC_KIT_NIOS2=c:/altera/81/nios2eds
export PERL5LIB=/bin:/cygdrive/c/altera/81/quartus/sopc_builder/bin/perl_lib:/cygdrive/c/altera/81/quartus/sopc_builder/bin/europa:/cygdrive/c/altera/81/quartus/sopc_builder/bin:

# generally place the altera stuff *LAST* in the path because it contains
# lots of obsolete stuff
export PATH=$PATH:$NIOS_ECOS/hal/nios2/arch/current/host
export PATH=$PATH:/cygdrive/c/altera/81/quartus/sopc_builder/bin
export PATH=$PATH:/cygdrive/c/altera/81/quartus/bin
export PATH=$PATH:/cygdrive/c/altera/81/nios2eds/bin/nios2-gnutools/H-i686-pc-cygwin/bin

else

export QUARTUS_ROOTDIR=/opt/altera9.0/quartus
export SOPC_KIT_NIOS2=/opt/altera9.0/nios2eds
export PERL5LIB=/usr/bin:/opt/altera9.0/quartus/sopc_builder/bin/perl_lib:/opt/altera9.0/quartus/sopc_builder/bin/europa:/opt/altera9.0/quartus/sopc_builder/bin

# generally place the altera stuff *LAST* in the path because it contains
# lots of obsolete stuff
export PATH=$PATH:$NIOS_ECOS/hal/nios2/arch/current/host
export PATH=$PATH:/opt/altera9.0/quartus/sopc_builder/bin
export PATH=$PATH:/opt/altera9.0/quartus/bin

fi

# set up a list of repositories. The NIOS_ECOS repository should be first.
# where a,b,c are cygwin paths to other eCos repositories.
# export ECOS_REPOSITORY=$NIOS_ECOS:a:b:c