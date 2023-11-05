.global check
.data
mes_error: .asciz "Ошибка!!! Некорректный ввод данных!!!\n"
zero_d: .double 0
.text
check:
	fld   ft0 zero_d t0     # Назначаем ft0 = 0
	fgt.d t6 fs3 fs4 	# Сохранемя результат сравнения start и end в t6
	bgtz t6 error		# Переходим к исключению если 1
	feq.d t6 fs3 ft0	# Сохранемя результат сравнения start и 0 в t6
	bgtz t6 error		# Переходим к исключению если 1
	feq.d t6 fs4 ft0	# Сохранемя результат сравнения 0 и end в t6
	bgtz t6 error		# Переходим к исключению если 1
	fadd.d ft1 fs3 fs4	# Находим сумму fs3 и fs4
	feq.d t6 ft1 ft0	# Сохранемя результат сравнения 0 и суммы концов отрезка в t6
	bgtz t6 error		# Переходим к исключению если 1
	
	ret
	
error:
	la	a0, mes_error		# Сообщение об ошибке
      	li	a7, 4           	# Системный вызов №4
	ecall
      	li a7 10			#Завершение работы программы с кодом ноль
      	ecall