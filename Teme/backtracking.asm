.data

	val: .long -1

	delim: .asciz " "	
	formatPrintf: .asciz "%d "
	newline: .asciz "\n"
	
	i: .space 4
	k: .space 4
	n: .space 4
	m: .space 4
	ok: .space 4
	total: .space 4
	okafis: .space 4
	
	sir: .space 380
	v: .space 364			# %esi
	contor: .space 130		# %edi
	
	
	
.text

.global main


	
afisare:               # afisare(*v, total)

	pushl %ebp
	movl %esp, %ebp

	pushl %esi
	pushl %edx
	pushl %ecx
	
	movl 8(%ebp), %esi 	# *v
	movl 12(%ebp), %edx 	# total

	xorl %ecx, %ecx 	# pe post de index in v
	pushl %eax

	jmp afisare_for


afisare_for:

	cmp %ecx, %edx
	je afisare_exit

	movl (%esi, %ecx, 4), %eax
	
	pushl %edx
	pushl %ecx
	pushl %eax
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	popl %ecx
	popl %edx
		
	incl %ecx

	jmp afisare_for
					
	
afisare_exit:

	popl %eax
	popl %ecx
	popl %edx
	popl %esi
	popl %ebp
	ret


back:					 

	pushl %ebp
	movl %esp, %ebp

	pushl %eax
	pushl %ebx
	pushl %ecx
	pushl %edx
	pushl %esi
	pushl %edi

	movl 8(%ebp), %eax  	# k
	movl $v, %esi
	movl $contor, %edi

	cmp $1, okafis
	je et_exit

	cmp %eax, total
	je ok_afisare

	movl (%esi, %eax, 4), %edx	#edx = v[i]	
	cmp $0, %edx
	jne pointer

	movl $1,%ecx
	movl %ecx, i
	jmp back_for_i


back_for_i:
	
	movl n, %ebx
	incl %ebx
	cmp %ebx, %ecx
	je end_for_i

	movl (%edi, %ecx, 4), %ebx		# ebx = contor[i]
	cmp $3, %ebx
	jne if_dif_de_3
	
	jmp continuare_back_for_i


continuare_back_for_i:

	incl %ecx
	movl %ecx, i

	jmp back_for_i	


if_dif_de_3:

	movl $1, ok
	pushl %ecx			#!! popl %ecx--facut in adaugare
	movl $1, %ecx
	jmp back_for_j	


back_for_j:			# %ecx ca j

	movl m, %ebx
	incl %ebx
	cmp %ecx, %ebx
	je adaugare
	
	movl %eax, %edx
	subl %ecx, %edx 	#edx = k-j
	cmp $0, %edx
	jge primul_if

	addl %ecx, %edx
	addl %ecx, %edx	#edx = k+j
	cmp total, %edx
	jle al_doilea_if	

	jmp continuare_back_for_j
	

continuare_back_for_j:
	
	incl %ecx		#j-ul   1<=j<=m
	jmp back_for_j


primul_if:

	movl (%esi, %edx, 4), %ebx
	cmp %ebx, i
	je if_1_interior

	addl %ecx, %edx
	addl %ecx, %edx	#edx = k+j
	cmp total, %edx
	jle al_doilea_if
	
	jmp continuare_back_for_j
	
	
if_1_interior:

	movl $0, ok
	jmp continuare_back_for_j



al_doilea_if:

	movl (%esi, %edx, 4), %ebx
	cmp %ebx, i
	je if_2_interior	

	jmp continuare_back_for_j


if_2_interior:

	movl $0, ok
	jmp continuare_back_for_j


adaugare:

	popl %ecx	# i-ul
	cmp $1, ok
	je if_adaugare
	
	jmp continuare_back_for_i
	

if_adaugare:

	movl (%edi, %ecx, 4), %ebx
	incl %ebx
	movl %ebx, (%edi, %ecx, 4)
	
	movl %ecx, (%esi, %eax, 4)
	
	pushl %ecx
	pushl %eax
	incl %eax

	pushl %eax
	call back
	popl %eax
	
	popl %eax
	popl %ecx
	
	movl %ecx, i
	
	movl $v, %esi
	movl $contor, %edi
	
	movl (%edi, %ecx, 4), %ebx
	decl %ebx
	movl %ebx, (%edi, %ecx, 4)	

	movl $0, (%esi, %eax, 4)
	
	jmp continuare_back_for_i
	

end_for_i:

	jmp back_exit


pointer:

	incl %eax
	pushl %eax
	call back
	popl %eax	
	
	
back_exit:

	popl %edi
	popl %esi
	popl %edx
	popl %ecx
	popl %ebx
	popl %eax
	
	popl %ebp
	ret


ok_afisare:

	movl $1, okafis

	pushl total
	pushl $v
	call afisare
	popl %ebx
	popl total
		
	jmp et_exit


main:
	
				  
  	pushl $sir				#citesc n,m,3*n
  	call gets
   	popl %ebx
				
	pushl $delim			
	pushl $sir
	call strtok 
	popl %ebx
	popl %ebx					

	pushl %eax			
	call atoi
	popl %ebx
	
	movl %eax, n			#am citit n


	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx 				

	pushl %eax			
	call atoi
	popl %ebx

	movl %eax, m			#am citit m
	
						# total = 3 * n (elemente in vector)
	movl $3, %eax
	movl n, %ebx
	mull %ebx
	movl %eax, total
	
	movl $v, %esi			
	movl $contor, %edi			
	xorl %ecx, %ecx
	
	jmp init_contor
	

init_contor:
	
	movl $contor, %edi
	movl n, %edx
	addl $2, %edx
	cmp %ecx, %edx
	je continua

	movl $0, (%edi, %ecx, 4)
		
	incl %ecx		
	jmp init_contor


continua:

	xorl %ecx, %ecx	
	jmp citire_v


citire_v:

	
	cmp %ecx, total	
	je et_main
	
	pushl %ecx
	
	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx 			#iau elem matricei si le pun in vector	
	
	pushl %eax			
	call atoi
	popl %ebx			# eax-> v[i]
	
	movl %eax, %ecx  		# pozitia din contor
	movl (%edi, %ecx, 4), %ebx	# contor[v[i]]
	incl %ebx			# contor[v[i]]++
	movl  %ebx, (%edi, %ecx, 4)
	
	popl %ecx
	
	movl %eax, (%esi, %ecx, 4)	#pun valoarea in v[i]
	
	incl %ecx

	jmp citire_v
					
			
et_main:			# am facut citirea si init contor
	
	pushl $0	# k=0
	call back	# back(0)
	popl %ebx
			# cazul cu -1
	cmp $0, okafis
	je et_nuexista		
			
	jmp et_exit
	
et_nuexista:

	pushl val			
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx		

et_exit:

	pushl $0
	call fflush
	popl %ebx		
	
	movl $4, %eax 		
	movl $1, %ebx 		
	movl $newline, %ecx 	
	movl $2, %edx 		
	int $0x80 
	
	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80


















