
.data
	i: .long 0	
	nr_l: .long 0
	nr_c: .long 0	
	n: .long 0  
	t: .long 0  

	   
	v: .space 1600
	rez: .space 1600
	sir: .space 1700     
	res: .space 4 	 		

	formatPrintf: .asciz "%d "
	newline: .asciz "\n"
	delim: .asciz " "
	   
.text

.global main

main:

	
  	pushl $sir				#citesc sirul
  	call gets
   	popl %ebx
 	
				
	
					
	pushl $delim				#iau litera matricei
	pushl $sir
	call strtok 
	popl %ebx
	popl %ebx	
	
	
	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx 				

	pushl %eax			
	call atoi
	popl %ebx
	
	movl %eax, nr_l			#iau nr de linii


	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx 				

	pushl %eax			
	call atoi
	popl %ebx

	movl %eax, nr_c			#iau nr de coloane
	
						# n = nr_l * nr_c (elemente in vector)
	movl nr_l, %eax
	movl nr_c, %ebx
	mull %ebx
	movl %eax, n
	
	lea v, %esi		
	xorl %ecx, %ecx


et_loop:

	cmp %ecx, n	
	je continua
	
	pushl %ecx
	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx 			#iau elem matricei si le pun in vector	
	
	pushl %eax				#vad daca e numar sau str
	call atoi
	popl %ebx
	popl %ecx
	
	movl %eax, (%esi, %ecx, 4)
	
	incl %ecx

	jmp et_loop


continua:

	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx 			#iau let--nu fac nimic
	
	movl %eax, res
	
	jmp et_for
	
	
et_for:				# am rotire sau operatie

	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx 				#iau urmatorul cuvant--litera sau rot90d


	cmp $0, %eax				#verific daca am terminat sirul
	je exit
	
	
	movl %eax, res
	
	movl res, %edi				#cuvantul pt a fi parcurs litera cu litera
	
	pushl res
	call atoi
	popl %ebx				#apelez atoi

	
	cmp $0, %eax		  		#daca este str(litera sau instructiune)
	je este_str
	
	pushl %eax				# este nr, pun pe stiva
	
	
	jmp et_for
	
	
		
este_str:
	
	xorl %ebx, %ebx
	movl res, %edi					#este operatie/litera
	movl $1, %ecx
	movb (%edi, %ecx, 1), %bl			#iau a 2a litera din cuvant
	
	cmp $0, %bl					# daca este litera
	je et_for
	
	jmp este_operatie	

	

	
este_operatie:				# ??? este operatie numai cu numere?
	
	movl $v, %esi
	movl res, %edi
	xorl %ecx, %ecx
	xorl %ebx, %ebx
	movb (%edi, %ecx, 1), %bl
	
	cmp $114, %bl		#rot90d
	je rotire
	
	cmp $97, %bl		# add
	je add
	
	cmp $115, %bl		# sub
	je sub
			
	cmp $109, %bl		# mul
	je mul
	
	cmp $100, %bl		# div
	je div

	jmp et_for

		

add:

	popl %ebx
	xorl %ecx, %ecx
	movl $rez, %edi
	
	jmp for_add
	
	
for_add:

	cmp %ecx, n
	je exit

	movl (%esi, %ecx, 4), %eax
	addl %ebx, %eax
	movl %eax, (%edi, %ecx, 4)
	
	incl %ecx
	
	jmp for_add


sub:

 	popl %ebx
	xorl %ecx, %ecx
	movl $rez, %edi
	
	jmp for_sub
	
	
for_sub:

	cmp %ecx, n
	je exit

	movl (%esi, %ecx, 4), %eax
	subl %ebx, %eax
	movl %eax, (%edi, %ecx, 4)
	
	incl %ecx
	
	jmp for_sub
	
	
mul:

	popl %ebx
	xorl %ecx, %ecx
	movl $rez, %edi
	movl $0, %edx	
	jmp for_mul
	
	
for_mul:

	cmp %ecx, n
	je exit

	movl (%esi, %ecx, 4), %eax
	mull %ebx
	movl %eax, (%edi, %ecx, 4)
	
	incl %ecx
	
	jmp for_mul
	
	
div:

	popl %ebx
	xorl %ecx, %ecx
	movl $rez, %edi
	movl $0, %edx
	jmp for_div
	
	
for_div:						#unul e negativ, inmultesc cu -1, fac div, apoi inmultesc rez cu -1
							#ambele negative, le inmultesc cu -1 si fac div
	cmp %ecx, n
	je exit

	movl (%esi, %ecx, 4), %eax
	cdq
	idiv %ebx
	movl %eax, (%edi, %ecx, 4)
	
	incl %ecx
	
	jmp for_div
		
		
		
rotire:
					# am ecx=0	eax=nr_c      ebx= l-1   t=0
	movl nr_c, %eax
	movl nr_l, %ebx
	decl %ebx
	movl $v, %esi
	movl $rez, %edi
	
	
	jmp for_1
	
	
for_1:
	cmp %eax, t		
	je inversare			# t==c stop
			
	movl n, %edx			# edx= n-c+t=4
	subl %eax, %edx
	addl t, %edx
	
	pushl %eax
	movl (%esi, %edx, 4), %eax
	movl %eax, (%edi, %ecx, 4)
	popl %eax
	incl %ecx
	incl t	
		
	movl $0, i
	jmp for_2			#i=0
		
for_2:

	cmp %ebx, i
	je for_1
		
	subl %eax, %edx
	pushl %eax
	movl (%esi, %edx, 4), %eax
	movl %eax, (%edi, %ecx, 4)
	popl %eax
	incl %ecx
	
	incl i
	jmp for_2
			
	
inversare:

	movl nr_l, %eax
	movl nr_c, %ebx
	movl %ebx, nr_l
	movl %eax, nr_c
	
	jmp exit		


exit:	
							#afisez nr_l, nr_c, ce am in vectorul rez
	pushl nr_l
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx

	pushl nr_c
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	xor %ecx, %ecx
	movl $rez, %edi
	
	jmp for_exit


for_exit:

	cmp %ecx, n
	je et_exit

	movl (%edi, %ecx, 4), %eax
	
	pushl %ecx
	pushl %eax
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	popl %ecx
	
	incl %ecx

	jmp for_exit


et_exit:

	pushl $newline
   	call printf
   	popl %ebx
    	popl %ebx

	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80






