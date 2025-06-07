	.file	"threadLocalSharedLibraries.cpp"
	.text
	.p2align 4
	.globl	_Z7get_tlsv
	.type	_Z7get_tlsv, @function
_Z7get_tlsv:
.LFB0:
	.cfi_startproc
	movl	%fs:tls_obj@tpoff, %eax
	ret
	.cfi_endproc
.LFE0:
	.size	_Z7get_tlsv, .-_Z7get_tlsv
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.globl	tls_obj
	.section	.tdata,"awT",@progbits
	.align 4
	.type	tls_obj, @object
	.size	tls_obj, 4
tls_obj:
	.long	123
	.ident	"GCC: (Debian 12.2.0-14+deb12u1) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
