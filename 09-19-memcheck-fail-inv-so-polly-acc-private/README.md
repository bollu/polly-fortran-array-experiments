We expect that this kernel can be optimised, but it fails the inbounds check.

To compile without inbounds, use `make all-kernel-launch`.
To compile reguarly, use `make all-nokernel-launch`.

Note that this is weird behaviour, because the array definitely has sufficient
space.
