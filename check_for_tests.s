.global check_for_tests
.text
check_for_tests:
	mv t1 zero
	fld   ft0 zero_d t0     # Назначаем ft0 = 0
	fgt.d t6 fs3 fs4 	# Сохранемя результат сравнения start и end в t6
	bgtz t6 error_t		# Переходим к исключению если 1
	feq.d t6 fs3 ft0	# Сохранемя результат сравнения start и 0 в t6
	bgtz t6 error_t		# Переходим к исключению если 1
	feq.d t6 fs4 ft0	# Сохранемя результат сравнения 0 и end в t6
	bgtz t6 error_t		# Переходим к исключению если 1
	fadd.d ft1 fs3 fs4	# Находим сумму fs3 и fs4
	feq.d t6 ft1 ft0	# Сохранемя результат сравнения 0 и суммы концов отрезка в t6
	bgtz t6 error_t		# Переходим к исключению если 1
	
end:	
	ret
	
error_t:
	la	a0, mes_error		# Сообщение об ошибке
      	li	a7, 4           	# Системный вызов №4
	ecall
	addi t1 zero 1			#Метка для проверки корректности данных 1 - Была ошибка, 0 - Ошибок нет
	ret
