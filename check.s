.global check
.data
mes_error: .asciz "������!!! ������������ ���� ������!!!\n"
zero_d: .double 0
.text
check:
	fld   ft0 zero_d t0     # ��������� ft0 = 0
	fgt.d t6 fs3 fs4 	# ��������� ��������� ��������� start � end � t6
	bgtz t6 error		# ��������� � ���������� ���� 1
	feq.d t6 fs3 ft0	# ��������� ��������� ��������� start � 0 � t6
	bgtz t6 error		# ��������� � ���������� ���� 1
	feq.d t6 fs4 ft0	# ��������� ��������� ��������� 0 � end � t6
	bgtz t6 error		# ��������� � ���������� ���� 1
	fadd.d ft1 fs3 fs4	# ������� ����� fs3 � fs4
	feq.d t6 ft1 ft0	# ��������� ��������� ��������� 0 � ����� ������ ������� � t6
	bgtz t6 error		# ��������� � ���������� ���� 1
	
	ret
	
error:
	la	a0, mes_error		# ��������� �� ������
      	li	a7, 4           	# ��������� ����� �4
	ecall
      	li a7 10			#���������� ������ ��������� � ����� ����
      	ecall