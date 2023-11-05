import math

def f(a,b,x):
    return a + b * (math.pow(x,-2))

def SimpsonFunc(a,b,start,end):
    if start>end or start==0 or end==0: return 'Ошибка входных данных' #Целочисленный ноль возвращается при неккоректном вводе данных
    res = ((end-start)/6 * (f(a,b,start) + 4*f(a,b,(start+end)/2) + f(a,b,end)))
    return round(res,4)

a = float(input())
b = float(input())
start = float(input())
end = float(input())
tests = [1,2,0,54,   #Тест 1 Ошибка, т.к x = 0
         1.3,1,4,3,  #Тест 2 Ошибка, т.к a>b
         2,3,4,5,    #Тест 3 Ожидаемый результат 2.15
         2.2, 1.2, -0.1, 0.2, #Тест 4 Ожидаемый результат 104.16
         -1,1,4,5,
         ] 
print(f'Результат работы функции с выходными данными {SimpsonFunc(a,b,start,end)}')
n=0
print('Результат работы функции с тестовыми данными:')
for i in range(0,len(tests),4):
    n+=1
    print(f'Тест №{n} {tests[i],tests[i+1],tests[i+2],tests[i+3]}: {SimpsonFunc(tests[i],tests[i+1],tests[i+2],tests[i+3])}')