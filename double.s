.macro input_double_number
.data
prompt: .asciz  "Введите число =  "   	
.text
      la	a0, prompt	# Подсказка для ввода числа
      li	a7, 4           # Системный вызов №4
      ecall
      li    	a7 7          	# Системный вызов №5 — ввеcти double
      ecall     
.end_macro

.macro print_double_number(%n)
.data 
nl: .asciz "\n"
.text
	la	a0, nl		# Перевод строки
      	li	a7, 4   	# Системный вызов №4
      	ecall
	li 	a7 3
	fmv.d 	fa0 %n
	ecall
	la	a0, nl		# Перевод строки
      	li	a7, 4   	# Системный вызов №4
      	ecall
.end_macro

.macro culc_average(%a,%b)
.data
_2: .double 2
.text
	fmv.d 	ft10 %a 	# Сохраняем значение а в ft10
	fmv.d 	ft9 %b		# Сохраняем значение b в ft9
	fld 	ft11 _2 t0	
  	fadd.d  ft0, ft10, ft9	# Сохраняем cумму в ft0
    	fdiv.d  fa0, ft0, ft11	# Находим среднее арифметическое
.end_macro

.macro build_func_a_b_x(%a,%b,%x)
.text
	fmv.d 	ft11 %a		# Сохраняем значение а в ft11
	fmv.d 	ft10 %b		# Сохраняем значение b в ft10
	fmv.d 	ft9 %x		# Сохраняем значение x в ft9
	fmul.d 	ft9 ft9 ft9	# Находим x^2
	fdiv.d 	ft8 ft10 ft9	# Находим b/x^2
	fadd.d  ft7 ft11 ft8	# Находим a + b/x^2
	fmv.d 	fa0 ft7		# Cохраняем результат в fa0
.end_macro 
