.include "double.s"  		#Импортируем данные
.include "check.s"
.include "check_for_tests.s"
.include "simpson_func.asm"
.include "tests.s"

.global main

.data
line: .asciz "\n"
mes1: .asciz "Введит числа a,b а также начало и конец интегрируемой области\n"
mes2: .asciz "Значение интеграла найденное методом Симсона"
mes3: .asciz "\nХотите ввести данные еще раз? Да - 1 Нет - 0\n"
mes4: .asciz "\nНеобходимо ли вывести тесты? Да - 1 Нет - 0\n"
.text
main:
	la	a0, mes1		# Подсказка cредностью ввода
      	li	a7, 4           	# Системный вызов №4
      	ecall
      	     	
  	input_double_number		#Ввод a. Сохраняет результат в регистр fa0
  	fmv.d 	fs1 fa0
  	
  	input_double_number		#Ввод b. Сохраняет результат в регистр fa0
  	fmv.d 	fs2 fa0
  	
  	input_double_number		#Ввод start. Сохраняет результат в регистр fa0
  	fmv.d 	fs3 fa0
  	
  	input_double_number		#Ввод end. Сохраняет результат в регистр fa0
  	fmv.d 	fs4 fa0
  	  	
  	jal check			#Строгая проверка входных данных
  				
  	jal simpson_func		#Вызываем основную функцию
  	
  	la	a0, mes2		# Сообщение о полученном результате
      	li	a7, 4           	# Системный вызов №4
      	ecall	
	print_double_number(fa0)
	
	
	la	a0, mes3		# Вопрос о повторении
      	li	a7, 4           	# Системный вызов №4
      	ecall
      	li    	a7 5           		# Системный вызов №5 — ввести десятичное число
      	ecall	
 	beqz a0, no_rec
 	j main
 	
all_end:
	li a7 10			#Завершение работы программы с кодом ноль
  	ecall
 	
no_rec:
	la	a0, mes4		# Вопрос о выводе тестов
      	li	a7, 4           	# Системный вызов №4
      	ecall
      	li    	a7 5           		# Системный вызов №5 — ввести десятичное число
      	ecall
	beqz a0, end	
	jal tests

