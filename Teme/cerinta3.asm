
.data
	
	val30: .long 30
	ascii: .long 0

	delim: .asciz " "
	strminus: .asciz "-\n"
	formatScanf: .asciz "%s"
	formatPrintf: .asciz "%d\n"
	
	
	x: .space 4
	y: .space 4	
	res: .space 4 	 		
	numar: .space 4
	
	sir: .space 100
	v: .space 120      
	
.text

.global main

main:
	

  	pushl $sir			
  	call gets
   	popl %ebx
 	

	movl $v, %esi			
	xorl %ecx, %ecx
	


	pushl $delim			
	pushl $sir
	call strtok 
	popl %ebx
	popl %ebx	
	
	
	movl %eax, res



	pushl res				
	call atoi
	popl %ebx
	
	cmp $0, %eax
	je este_litera
	
	pushl %eax
	
	jmp et_for



	
et_for:


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
	je este_str
	
	pushl %eax				
	
	jmp et_for
	
	
	


este_str:						 

	movl $1, %ecx
	movb (%edi, %ecx, 1), %bl			
	
	cmp $0, %bl				
	je este_litera
	
	jmp este_operatie
							
							

este_litera:			
					
	movl res, %edi
	xor %eax, %eax
	
	xor %ecx, %ecx
	movb (%edi, %ecx, 1), %al
	
	subl $97, %eax				
	movl (%esi, %eax, 4), %ebx
	
	cmp $0, %ebx
	je litera_noua
	
	pushl %ebx		
	jmp et_for



	

litera_noua:

	movl $v, %esi

	

	pushl %eax			
	jmp et_for
	
	
	
este_operatie:			
	

	xorl %ecx, %ecx
	movb (%edi, %ecx, 1), %bl
	
	cmp $108, %bl	
	je let
	
	cmp $97, %bl		
	je add
	
	cmp $115, %bl		
	je sub
			
	cmp $109, %bl		
	je mul
	
	cmp $100, %bl		
	je div

	jmp et_for


let:

	popl %ebx			
	popl %ecx			
	
	movl %ebx, (%esi, %ecx, 4)	

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







