Using Optimized G++ 
g++ -std=c++20 -fno-inline -O0 -S threadLocal.cpp -o threadLocal.s

## from the Blog 

[Blog](https://yosefk.com/blog/cxx-thread-local-storage-performance.html)

.slow_path:
  // inlined call to __tls_init, which constructs
  // all the TLS variables in this translation unit…
  pushq %rbx
  movq  %fs:0, %rbx
  movb  $1, %fs:__tls_guard@tpoff
  leaq  tls_with_ctor@tpoff(%rbx), %rdi
  call  Class::Class()
  leaq  tls_with_ctor2@tpoff(%rbx), %rdi
  call  Class2::Class2()


## from generated assembly

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