
.data
	delim: .asciz " "
	strminus: .asciz "-"
	formatScanf: .asciz "%s"
	formatPrintf: .asciz "%d\n"
	formatPrintf2: .asciz "%s\n"
	
	x: .space 4
	y: .space 4
	
	sir: .space 100
	res: .space 4 	 		
	atoiRes: .space 4
	numar: .space 4
	
	
.text

.global main

main:

  	pushl $sir
  	call gets
   	popl %ebx
 	


	pushl $delim
	pushl $sir
	call strtok 
	popl %ebx
	popl %ebx
	
	movl %eax, res

	pushl res
	call atoi
	popl %ebx
	movl %eax, numar

	pushl numar
	
	
	
et_for:

	xorl %eax, %eax

	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx 




	cmp $0, %eax
	je exit
	
	
	movl %eax, res
	
	movl res, %edi
	
	pushl res
	call atoi
	popl %ebx

	
	cmp $0, %eax		  
	je este_operatie
	
	pushl %eax
	
	
	jmp et_for
	
	
	
este_operatie:
	

	
	xorl %ecx, %ecx
	movb (%edi, %ecx, 1), %bl
	
	cmp $97, %bl		
	je add
	
	cmp $115, %bl		
	je sub
			
	cmp $109, %bl		
	je mul
	
	cmp $100, %bl		
	je div

	jmp et_for


add:

	popl x
	popl y
	movl x, %eax
	addl y, %eax
			
	pushl %eax
	
	jmp et_for

sub:

	popl x
	popl y
	movl y, %eax
	subl x, %eax
			
	pushl %eax
	
	jmp et_for
	
mul:

	popl %eax
	popl %ebx
	mull %ebx
				
	pushl %eax

	jmp et_for

div:

	movl $0, %edx
	popl %ebx		
	popl %eax		
	divl %ebx
				
	pushl %eax
	
	jmp et_for



exit:

	popl %eax
	
	pushl %eax
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx

			

	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80














