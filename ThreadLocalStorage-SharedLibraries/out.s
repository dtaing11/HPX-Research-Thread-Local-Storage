	.file	"threadLocalSharedLibraries.cpp"
	.text
	.globl	tls_obj
	.section	.tdata,"awT",@progbits
	.align 4
	.type	tls_obj, @object
	.size	tls_obj, 4
tls_obj:
	.long	123
	.text
	.globl	_Z7get_tlsv
	.type	_Z7get_tlsv, @function
_Z7get_tlsv:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	data16	leaq	tls_obj@tlsgd(%rip), %rdi
	.value	0x6666
	rex64
	call	__tls_get_addr@PLT
	movl	(%rax), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	_Z7get_tlsv, .-_Z7get_tlsv
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	call	_Z7get_tlsv@PLT
	movl	%eax, -4(%rbp)
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Debian 12.2.0-14+deb12u1) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
