.global simpson_func

.data 
_4: .double 4
_6: .double 6
.text

simpson_func:	
	fld   	ft6 _6 t0     		# Назначаем ft6 = 6
	fsub.d 	ft5 fs4 fs3   		# Назначаем ft5 = end - start
	fdiv.d 	ft1 ft5 ft6		# Назначаем ft1 = (end - start)/6
	build_func_a_b_x(fs1,fs2,fs3)	# Считаем значение функции в start
	fmv.d 	ft3 fa0			# Назначаем ft3 = f(start)
	culc_average(fs3,fs4)		# Считаем среднее между start и end		
	build_func_a_b_x(fs1,fs2,fa0)	# Считаем значение функции в (start + end)/2
	fmv.d 	ft2 fa0			# Назначаем ft2 = f((start + end)/2)
	fld   	ft4 _4 t0    		# Назначаем ft4 = 4
	fmul.d 	ft4 ft4 ft2		# Назначаем ft4 = 4*f((start + end)/2)
	build_func_a_b_x(fs1,fs2,fs4)	# Считаем значение функции в end
	fmv.d 	ft5 fa0			# Назначаем ft5 = f(end)
	fadd.d 	ft4 ft5 ft4		# Назначаем ft4 = 4*f((start + end)/2) + f(end)
	fadd.d  ft3 ft4 ft3		# Назначаем ft3 = f(start) + 4*f((start + end)/2) + f(end)
	fmul.d 	ft1 ft1 ft3		# Назначаем ft1 = ((end - start)/6)*(f(start) + 4*f((start + end)/2) + f(end))
	
	fmv.d 	fa0 ft1			#Сохранем результат работы функции
	
	ret 
