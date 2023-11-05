.global check_for_tests
.text
check_for_tests:
	mv t1 zero
	fld   ft0 zero_d t0     # ��������� ft0 = 0
	fgt.d t6 fs3 fs4 	# ��������� ��������� ��������� start � end � t6
	bgtz t6 error_t		# ��������� � ���������� ���� 1
	feq.d t6 fs3 ft0	# ��������� ��������� ��������� start � 0 � t6
	bgtz t6 error_t		# ��������� � ���������� ���� 1
	feq.d t6 fs4 ft0	# ��������� ��������� ��������� 0 � end � t6
	bgtz t6 error_t		# ��������� � ���������� ���� 1
	fadd.d ft1 fs3 fs4	# ������� ����� fs3 � fs4
	feq.d t6 ft1 ft0	# ��������� ��������� ��������� 0 � ����� ������ ������� � t6
	bgtz t6 error_t		# ��������� � ���������� ���� 1
	
end:	
	ret
	
error_t:
	la	a0, mes_error		# ��������� �� ������
      	li	a7, 4           	# ��������� ����� �4
	ecall
	addi t1 zero 1			#����� ��� �������� ������������ ������ 1 - ���� ������, 0 - ������ ���
	ret
