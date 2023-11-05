.macro input_double_number
.data
prompt: .asciz  "Введите число =  "   	# Подсказка для ввода числа
.text
      la	a0, prompt	# Подсказка для ввода числа элементов массива
      li	a7, 4           # Системный вызов №4
      ecall
      li    	a7 7          	# Системный вызов №5 — ввеcти double
      ecall     
.end_macro

.macro print_double_number(%n)
.data 
nl: .asciz "\n"
.text
	la	a0, nl	# Подсказка для ввода числа элементов массива
      	li	a7, 4   # Системный вызов №4
      	ecall
	li 	a7 3
	fmv.d 	fa0 %n
	ecall
.end_macro

.macro culc_average(%a,%b)
.data
_2: .double 2
.text
	fmv.d 	ft10 %a
	fmv.d 	ft9 %b
	fld 	ft11 _2 t0
  	fadd.d  ft0, ft10, ft9
    	fdiv.d  fa0, ft0, ft11
.end_macro

.macro build_func_a_b_x(%a,%b,%x)
.text
	fmv.d 	ft11 %a
	fmv.d 	ft10 %b
	fmv.d 	ft9 %x
	fmul.d 	ft9 ft9 ft9
	fdiv.d 	ft8 ft10 ft9
	fadd.d  ft7 ft11 ft8
	fmv.d 	fa0 ft7
.end_macro 
