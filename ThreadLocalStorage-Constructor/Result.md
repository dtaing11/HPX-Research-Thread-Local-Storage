# 🧵 Thread-Local Storage Initialization: Blog vs GCC Output

## 🔗 Reference  
Source: [C++ Thread-Local Storage Performance (Yosef K)](https://yosefk.com/blog/cxx-thread-local-storage-performance.html)

---

## 📝 From the Blog (Pseudocode Summary)

```asm
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
```

---

## 🛠 From GCC-Generated Assembly (`-O0`, `-fno-inline`)

```asm
.L12:
  pushq   %rbx
  .cfi_def_cfa_offset 16
  .cfi_offset 3, -16

  movq    %fs:0, %rbx
  movb    $1, %fs:__tls_guard@tpoff

  leaq    tls_with_ctor@tpoff(%rbx), %rdi
  call    _ZN5ClassC1Ev                # Class::Class()

  leaq    tls_with_ctor2@tpoff(%rbx), %rdi
  popq    %rbx
  .cfi_restore 3
  .cfi_def_cfa_offset 8
  jmp     _ZN6Class2C1Ev               # Class2::Class2()
```

---

## ✅ Notes

- Both versions **perform identical steps**:
  - Check TLS guard and initialize if needed.
  - Construct TLS variables with placement new (`leaq + call`).
- GCC splits the final `call` to `Class2` into a `jmp`, as it’s **tail-called** — an optimization to skip reloading `ret`.

---
