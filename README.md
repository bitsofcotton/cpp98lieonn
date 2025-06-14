# cpp98lieonn
A lieonn.hh compile target to one variant of C++98 compiler to test the conclusion seems correct or not on old and reliable compiler chain possible we have.

# Description
Since we rewrote lieonn.hh into gcc2.95.3 variant be able to be compiled, some variant of C++98 compiler isn't.
So we target one variant of the such compiler we have binary to test is it a reliable result or not.

# Tips
In old netbsd, limit d 1048575; limit s 32767; is needed but not the all of the .cc is compiled.

In old openbsd, ulimit -d 1048575; ulimit -s 32767; is also needed but they excluded some of the gcc2953 memory usage but so we can test them all.

In haiku-R1alpha3, the memory usage endurance causes kernel crash with MemoryManager's getChunk fault backtrack.

The huge memory usage we need is from the gcc 2.95.3 variants' implementation so we should use #if !defined... directive to exclude some amount of the non-used code bases on the certain compilers (however, some test isn't improves by this).

Some msvcc option needs /Zm200 or so, however, our template depth is too deep to compile in some of the cases we target, instead of them, we target this condition with lieonn-target.hpp.

We'll test in another system next but it's on qemu-system-i386 on our machine...

# Binary we test on qemu-system-i386
However, if our machine is infected, this either isn't reliable.
* 1.6.2
* "netbsd-GENERIC.gz" : md5:932cf3d8532376e801d7191ca73cebf0
* "base.tgz" : md5:24f387621d3c7545acf25ea07d5ebdd8
* "comp.tgz" : md5:58c9587115138e4a5a3798a9a8ce5e76
* "kern-GENERIC.tgz" : md5:9376507bdd3ba2b3ef488cee6119abb7
* 3.4
* "cd34.iso" : md5:1fef05528db284e118b50851c394acb2
* "base34.tgz" : md5:59208903e52c885d7d100ee281797de5
* "comp34.tgz" : md5:01097b8d49b7ec50037164f333322c9b
* 98
* "Win98 SE.iso"   : md5:8f145dd1e2d673377dc8b0a8a251eee0
* "VCL600JPN1.cdr" : md5:e468083cf19363d729f9726f2e527ca0

# scp option
ssh option with modern ssh in dangerous but connectable option perplexity suggested:
* #HostKeyAlgorithms ssh-rsa
* #PubkeyAcceptedAlgorithms ssh-rsa
* #KexAlgorithms +diffie-hellman-group-exchange-sha1
* #Ciphers aes128-cbc,3des-cbc

# qemu option
perplexity suggested:
* qemu-system-i386 -m 128M -hda ... -cdrom ... -boot d -device e1000,netdev=user.0 -netdev user,id=user.0,hostfwd=tcp::10022-:22
* * 128M for installation to avoid swap -1 size.
* * 2048M for normal use.
* qemu-system-i386 -M pc -m 256M -device sb16,audiodev=audio0 -audiodev ...,id=audio0 -cdrom ... -vga cirrus -rtc base=localtime,clock=host -parallel none -serial none -drive file=...,media=disk,cache=writeback -netdev user,id=user.0 -device ne2k_pci,netdev=user.0 -boot d -usb -cpu pentium
* * -m 1024M -cpu pentium3 for normal use.

* avoiding recursive reference in source code
struct ..., typedef chain is suggested by perplexity.
