.macro input_double_number
.data
prompt: .asciz  "������� ����� =  "   	
.text
      la	a0, prompt	# ��������� ��� ����� �����
      li	a7, 4           # ��������� ����� �4
      ecall
      li    	a7 7          	# ��������� ����� �5 � ���c�� double
      ecall     
.end_macro

.macro print_double_number(%n)
.data 
nl: .asciz "\n"
.text
	la	a0, nl		# ������� ������
      	li	a7, 4   	# ��������� ����� �4
      	ecall
	li 	a7 3
	fmv.d 	fa0 %n
	ecall
	la	a0, nl		# ������� ������
      	li	a7, 4   	# ��������� ����� �4
      	ecall
.end_macro

.macro culc_average(%a,%b)
.data
_2: .double 2
.text
	fmv.d 	ft10 %a 	# ��������� �������� � � ft10
	fmv.d 	ft9 %b		# ��������� �������� b � ft9
	fld 	ft11 _2 t0	
  	fadd.d  ft0, ft10, ft9	# ��������� c���� � ft0
    	fdiv.d  fa0, ft0, ft11	# ������� ������� ��������������
.end_macro

.macro build_func_a_b_x(%a,%b,%x)
.text
	fmv.d 	ft11 %a		# ��������� �������� � � ft11
	fmv.d 	ft10 %b		# ��������� �������� b � ft10
	fmv.d 	ft9 %x		# ��������� �������� x � ft9
	fmul.d 	ft9 ft9 ft9	# ������� x^2
	fdiv.d 	ft8 ft10 ft9	# ������� b/x^2
	fadd.d  ft7 ft11 ft8	# ������� a + b/x^2
	fmv.d 	fa0 ft7		# C�������� ��������� � fa0
.end_macro 
