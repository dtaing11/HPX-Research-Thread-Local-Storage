	.file	"threadLocal.cpp"
	.text
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.type	_Z41__static_initialization_and_destruction_0ii.constprop.0, @function
_Z41__static_initialization_and_destruction_0ii.constprop.0:
.LFB2721:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	_ZStL8__ioinit(%rip), %rbx
	movq	%rbx, %rdi
	call	_ZNSt8ios_base4InitC1Ev@PLT
	movq	_ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rdi
	movq	%rbx, %rsi
	popq	%rbx
	.cfi_def_cfa_offset 8
	leaq	__dso_handle(%rip), %rdx
	jmp	__cxa_atexit@PLT
	.cfi_endproc
.LFE2721:
	.size	_Z41__static_initialization_and_destruction_0ii.constprop.0, .-_Z41__static_initialization_and_destruction_0ii.constprop.0
	.section	.rodata._ZN5ClassC2Ev.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Class constructor\n"
	.section	.text._ZN5ClassC2Ev,"axG",@progbits,_ZN5ClassC5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZN5ClassC2Ev
	.type	_ZN5ClassC2Ev, @function
_ZN5ClassC2Ev:
.LFB2060:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	.LC0(%rip), %rsi
	movq	%rdi, %rbx
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movl	$42, (%rbx)
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE2060:
	.size	_ZN5ClassC2Ev, .-_ZN5ClassC2Ev
	.weak	_ZN5ClassC1Ev
	.set	_ZN5ClassC1Ev,_ZN5ClassC2Ev
	.section	.rodata._ZN6Class2C2Ev.str1.1,"aMS",@progbits,1
.LC1:
	.string	"Class2 constructor\n"
	.section	.text._ZN6Class2C2Ev,"axG",@progbits,_ZN6Class2C5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZN6Class2C2Ev
	.type	_ZN6Class2C2Ev, @function
_ZN6Class2C2Ev:
.LFB2063:
	.cfi_startproc
	leaq	.LC1(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	jmp	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	.cfi_endproc
.LFE2063:
	.size	_ZN6Class2C2Ev, .-_ZN6Class2C2Ev
	.weak	_ZN6Class2C1Ev
	.set	_ZN6Class2C1Ev,_ZN6Class2C2Ev
	.text
	.p2align 4
	.type	__tls_init, @function
__tls_init:
.LFB2718:
	.cfi_startproc
	cmpb	$0, %fs:__tls_guard@tpoff
	je	.L12
	ret
	.p2align 4,,10
	.p2align 3
.L12:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%fs:0, %rbx
	movb	$1, %fs:__tls_guard@tpoff
	leaq	tls_with_ctor@tpoff(%rbx), %rdi
	call	_ZN5ClassC1Ev
	leaq	tls_with_ctor2@tpoff(%rbx), %rdi
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	jmp	_ZN6Class2C1Ev
	.cfi_endproc
.LFE2718:
	.size	__tls_init, .-__tls_init
	.globl	_ZTH14tls_with_ctor2
	.set	_ZTH14tls_with_ctor2,__tls_init
	.globl	_ZTH13tls_with_ctor
	.set	_ZTH13tls_with_ctor,__tls_init
	.section	.text._ZTW13tls_with_ctor,"axG",@progbits,_ZTW13tls_with_ctor,comdat
	.p2align 4
	.weak	_ZTW13tls_with_ctor
	.internal	_ZTW13tls_with_ctor
	.type	_ZTW13tls_with_ctor, @function
_ZTW13tls_with_ctor:
.LFB2719:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	_ZTH13tls_with_ctor
	movq	%fs:0, %rax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	addq	$tls_with_ctor@tpoff, %rax
	ret
	.cfi_endproc
.LFE2719:
	.size	_ZTW13tls_with_ctor, .-_ZTW13tls_with_ctor
	.text
	.p2align 4
	.globl	_Z13get_tls_valuev
	.type	_Z13get_tls_valuev, @function
_Z13get_tls_valuev:
.LFB2065:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	_ZTW13tls_with_ctor
	movl	(%rax), %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE2065:
	.size	_Z13get_tls_valuev, .-_Z13get_tls_valuev
	.section	.text.startup
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB2066:
	.cfi_startproc
	jmp	_Z13get_tls_valuev
	.cfi_endproc
.LFE2066:
	.size	main, .-main
	.p2align 4
	.type	_GLOBAL__sub_I_tls_with_ctor, @function
_GLOBAL__sub_I_tls_with_ctor:
.LFB2720:
	.cfi_startproc
	jmp	_Z41__static_initialization_and_destruction_0ii.constprop.0
	.cfi_endproc
.LFE2720:
	.size	_GLOBAL__sub_I_tls_with_ctor, .-_GLOBAL__sub_I_tls_with_ctor
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I_tls_with_ctor
	.section	.tbss,"awT",@nobits
	.type	__tls_guard, @object
	.size	__tls_guard, 1
__tls_guard:
	.zero	1
	.globl	tls_with_ctor2
	.type	tls_with_ctor2, @object
	.size	tls_with_ctor2, 1
tls_with_ctor2:
	.zero	1
	.globl	tls_with_ctor
	.align 4
	.type	tls_with_ctor, @object
	.size	tls_with_ctor, 4
tls_with_ctor:
	.zero	4
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.hidden	__dso_handle
	.ident	"GCC: (Debian 12.2.0-14+deb12u1) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
