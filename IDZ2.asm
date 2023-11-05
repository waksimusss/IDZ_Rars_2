.include "double.s"  		#����������� ������
.include "check.s"
.include "check_for_tests.s"
.include "simpson_func.asm"
.include "tests.s"

.global main

.data
line: .asciz "\n"
mes1: .asciz "������ ����� a,b � ����� ������ � ����� ������������� �������\n"
mes2: .asciz "�������� ��������� ��������� ������� �������"
mes3: .asciz "\n������ ������ ������ ��� ���? �� - 1 ��� - 0\n"
mes4: .asciz "\n���������� �� ������� �����? �� - 1 ��� - 0\n"
.text
main:
	la	a0, mes1		# ��������� c��������� �����
      	li	a7, 4           	# ��������� ����� �4
      	ecall
      	     	
  	input_double_number		#���� a. ��������� ��������� � ������� fa0
  	fmv.d 	fs1 fa0
  	
  	input_double_number		#���� b. ��������� ��������� � ������� fa0
  	fmv.d 	fs2 fa0
  	
  	input_double_number		#���� start. ��������� ��������� � ������� fa0
  	fmv.d 	fs3 fa0
  	
  	input_double_number		#���� end. ��������� ��������� � ������� fa0
  	fmv.d 	fs4 fa0
  	  	
  	jal check			#������� �������� ������� ������
  				
  	jal simpson_func		#�������� �������� �������
  	
  	la	a0, mes2		# ��������� � ���������� ����������
      	li	a7, 4           	# ��������� ����� �4
      	ecall	
	print_double_number(fa0)
	
	
	la	a0, mes3		# ������ � ����������
      	li	a7, 4           	# ��������� ����� �4
      	ecall
      	li    	a7 5           		# ��������� ����� �5 � ������ ���������� �����
      	ecall	
 	beqz a0, no_rec
 	j main
 	
all_end:
	li a7 10			#���������� ������ ��������� � ����� ����
  	ecall
 	
no_rec:
	la	a0, mes4		# ������ � ������ ������
      	li	a7, 4           	# ��������� ����� �4
      	ecall
      	li    	a7 5           		# ��������� ����� �5 � ������ ���������� �����
      	ecall
	beqz a0, end	
	jal tests

