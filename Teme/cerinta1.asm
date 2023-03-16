
.data

    t: .long 0
    i: .long 0
    val12: .long 12
    indexSb2: .long 0
    
    strminus: .asciz "-"
    strlet: .asciz "let "
    stradd: .asciz "add "
    strsub: .asciz "sub "
    strmul: .asciz "mul "
    strdiv: .asciz "div "
    newline: .asciz "\n"
    
    formatPrintZecimal: .asciz "%d "
    formatPrintLitera: .asciz "%c "
    formatScanf: .asciz "%s"
    formatPrintf: .asciz "%s"
    	
    lit: .space 1
    sirb16: .space 100
    sirb2: .space 400
     
.text

.global main

main:

    pushl $sirb16
    pushl $formatScanf
    call scanf 
    popl %ebx
    popl %ebx
    
    movl $sirb16, %edi
    movl $sirb2, %esi 
    xorl %ecx, %ecx
    
  
    
    
et_for_sirb16:
	
    
    pushl %ecx
    movl %ecx, %eax
    mov $4, %edx
    mull %edx
    movl %eax, indexSb2 			

    popl %ecx

    movb (%edi, %ecx, 1), %al 
    cmp $0, %al 
    je et_reinit
 
    
    cmp $48, %al 
    je cif0
    cmp $49, %al
    je cif1
    cmp $50, %al 
    je cif2
    cmp $51, %al
    je cif3
    cmp $52, %al 
    je cif4
    cmp $53, %al
    je cif5
    cmp $54, %al 
    je cif6
    cmp $55, %al
    je cif7
    cmp $56, %al 
    je cif8
    cmp $57, %al
    je cif9
    cmp $65, %al 
    je lit_A
    cmp $66, %al
    je lit_B
    cmp $67, %al 
    je lit_C
    cmp $68, %al
    je lit_D
    cmp $69, %al 
    je lit_E    
    cmp $70, %al
    je lit_F
    
    
continua:
    incl %ecx
    jmp et_for_sirb16

cif0:


    pushl %ecx

    movl indexSb2, %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx

    addl $4, indexSb2

    popl %ecx
    jmp continua

cif1:
    pushl %ecx

    movl indexSb2, %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx

    addl $4, indexSb2

    popl %ecx
    jmp continua

cif2:
    pushl %ecx

    movl indexSb2, %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx

    addl $4, indexSb2

    popl %ecx
    jmp continua
 
cif3:
    pushl %ecx

    movl indexSb2, %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx

    addl $4, indexSb2

    popl %ecx
    jmp continua
   
cif4:
    pushl %ecx

    movl indexSb2, %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx

    addl $4, indexSb2

    popl %ecx
    jmp continua
 
cif5:
    pushl %ecx

    movl indexSb2, %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx

    addl $4, indexSb2

    popl %ecx
    jmp continua
  
cif6:
    pushl %ecx

    movl indexSb2, %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx

    addl $4, indexSb2

    popl %ecx
    jmp continua

cif7:
    pushl %ecx

    movl indexSb2, %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx

    addl $4, indexSb2

    popl %ecx
    jmp continua
  
cif8:
    pushl %ecx

    movl indexSb2, %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx

    addl $4, indexSb2

    popl %ecx
    jmp continua
 
cif9:
    pushl %ecx

    movl indexSb2, %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx

    addl $4, indexSb2

    popl %ecx
    jmp continua
  
lit_A:


    pushl %ecx

    movl indexSb2, %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx

    addl $4, indexSb2

    popl %ecx
    jmp continua
   
lit_B:
    pushl %ecx

    movl indexSb2, %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx

    addl $4, indexSb2

    popl %ecx
    jmp continua

lit_C:
    pushl %ecx

    movl indexSb2, %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx

    addl $4, indexSb2

    popl %ecx
    jmp continua
   
lit_D:
    pushl %ecx

    movl indexSb2, %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx

    addl $4, indexSb2

    popl %ecx
    jmp continua
   
lit_E:   
    pushl %ecx

    movl indexSb2, %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $48, (%esi, %ecx, 1)
    incl %ecx

    addl $4, indexSb2

    popl %ecx
    jmp continua

lit_F:  
    pushl %ecx

    movl indexSb2, %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx
    movb $49, (%esi, %ecx, 1)
    incl %ecx

    addl $4, indexSb2

    popl %ecx
    jmp continua





et_reinit:

	incl indexSb2
    	xorl %ecx, %ecx
    	
    	jmp et_for_sirb2


et_for_sirb2:

	movb (%esi, %ecx, 1), %al 
  	cmp $0, %al 
    	je et_exit


	movl t, %eax
 	mull val12		
 	addl $1, %eax			
 
  	movl %eax, %ecx
 			         	 
    	jmp identificator1
    	
    	
cont:

	movl t, %eax
 	mull val12		
 	addl $2, %eax			
 
  	movl %eax, %ecx

	jmp identificator2
	
  
  
identificator1:
      
	     
        movb (%esi, %ecx, 1), %al
        
    	cmp $49, %al         
    	je operatie
    
    	cmp $48, %al 
    	je cont			


identificator2:

	movb (%esi, %ecx, 1), %al

    	cmp $48, %al 
    	je semn
    
    	cmp $49, %al         
    	je zecimal1_var 		
    
 
	
semn:

	
	movl t, %eax
 	mull val12		
 	addl $3, %eax			
 	
 	movl %eax, %ecx
 	
 	movb (%esi, %ecx, 1), %al		
    						
    	cmp $49, %al
    	je af_minus					
    						
   	jmp zecimal1      			

af_minus:

	pushl %ecx

	pushl $strminus
	pushl $formatPrintf
   	call printf
   	popl %ebx
    	popl %ebx

	#movl $4, %eax 	
	#movl $1, %ebx 		
	#movl $strminus, %ecx 					# !!!!!!!!!
	#movl $2, %edx 		
	#int $0x80
	
	popl %ecx
	
	jmp zecimal1
  
  
zecimal1:  
 	
    	#pushl %ecx
 	

 	xorl %ebx, %ebx				
 
 	
 	movl t, %eax
 	mull val12			
 	addl $4, %eax			
 		
 	movl %eax, %ecx				
 	
 	xorl %eax, %eax			      
 	
 	movb (%esi, %ecx, 1), %bl		
 	cmp $49, %bl
 	je suma_zecimal1	
 		
	jmp zecimal2 													


suma_zecimal1:
	
	addl $128, %eax		
	jmp zecimal2 
	

zecimal2:

	incl %ecx
	movb (%esi, %ecx,1), %bl
	cmp $49, %bl
 	je suma_zecimal2	
 		
 	jmp zecimal3
	
	
suma_zecimal2:

	addl $64, %eax			
	jmp zecimal3


zecimal3:	

	incl %ecx
	movb (%esi, %ecx,1), %bl
	cmp $49, %bl
 	je suma_zecimal3	
 				
	jmp zecimal4

	
suma_zecimal3:

	addl $32, %eax			
	jmp zecimal4 


zecimal4:

	incl %ecx
	movb (%esi, %ecx,1), %bl
	cmp $49, %bl
 	je suma_zecimal4	
 					
	jmp zecimal5


suma_zecimal4:

	addl $16, %eax			
	jmp zecimal5


zecimal5:

	incl %ecx
	movb (%esi, %ecx,1), %bl
	cmp $49, %bl
 	je suma_zecimal5	
 				
	jmp zecimal6
	

suma_zecimal5:

	addl $8, %eax			
	jmp zecimal6

	
zecimal6:

	incl %ecx
	movb (%esi, %ecx,1), %bl
	cmp $49, %bl
 	je suma_zecimal6	
 					
	jmp zecimal7


suma_zecimal6:

	addl $4, %eax			
	jmp zecimal7


zecimal7:

	incl %ecx
	movb (%esi, %ecx,1), %bl
	cmp $49, %bl
 	je suma_zecimal7	
 					
	jmp zecimal8


suma_zecimal7:

	addl $2, %eax			
	jmp zecimal8


zecimal8:

	incl %ecx
	movb (%esi, %ecx,1), %bl
	cmp $49, %bl
 	je suma_zecimal8	
 					
	jmp segment_nou


suma_zecimal8:

	addl $1, %eax			
	
	jmp segment_nou
	
		

segment_nou:  
	
	
  	pushl %ecx
  					
  	pushl %eax			
  	pushl $formatPrintZecimal				# !!!!!
  	call printf
  	popl %ebx
  	popl %ebx
  							# elimin fflush
  	
  	popl %ecx
  	
  	incl %ecx
  	
  	incl t
  	
  	jmp et_for_sirb2
    
  
 
zecimal1_var:  
 	
 	

 	xorl %ebx, %ebx				
 
 	
 	movl t, %eax
 	mull val12			
 	addl $4, %eax			
 		
 	movl %eax, %ecx			
 	
 	xor %eax, %eax			     
 	
 	movb (%esi, %ecx, 1), %bl	
 	cmp $49, %bl
 	je suma_zecimal1_var	
 		
	jmp zecimal2_var 													


suma_zecimal1_var:
	
	add $128, %eax			
					
	jmp zecimal2_var 
	

zecimal2_var:

	incl %ecx
	movb (%esi, %ecx,1), %bl
	cmp $49, %bl
 	je suma_zecimal2_var	
 		
 	jmp zecimal3_var
	
	
suma_zecimal2_var:

	add $64, %eax			
	jmp zecimal3_var


zecimal3_var:	

	incl %ecx
	movb (%esi, %ecx,1), %bl
	cmp $49, %bl
 	je suma_zecimal3_var	
 				
	jmp zecimal4_var

	
suma_zecimal3_var:

	add $32, %eax			
	jmp zecimal4_var


zecimal4_var:

	incl %ecx
	movb (%esi, %ecx,1), %bl
	cmp $49, %bl
 	je suma_zecimal4_var	
 					
	jmp zecimal5_var


suma_zecimal4_var:

	add $16, %eax			
	jmp zecimal5_var


zecimal5_var:

	incl %ecx
	movb (%esi, %ecx,1), %bl
	cmp $49, %bl
 	je suma_zecimal5_var	
 				
	jmp zecimal6_var
	

suma_zecimal5_var:

	add $8, %eax			
	jmp zecimal6_var

	
zecimal6_var:

	incl %ecx
	movb (%esi, %ecx,1), %bl
	cmp $49, %bl
 	je suma_zecimal6_var	
 					
	jmp zecimal7_var


suma_zecimal6_var:

	add $4, %eax			
	jmp zecimal7_var


zecimal7_var:

	incl %ecx
	movb (%esi, %ecx,1), %bl
	cmp $49, %bl
 	je suma_zecimal7_var	
 					
	jmp zecimal8_var


suma_zecimal7_var:

	add $2, %eax			
	jmp zecimal8_var


zecimal8_var:

	incl %ecx
	movb (%esi, %ecx,1), %bl
	cmp $49, %bl
 	je suma_zecimal8_var	
 					
	jmp segment_nou_var


suma_zecimal8_var:

	add $1, %eax			
	
	jmp segment_nou_var
	
		

segment_nou_var:  
  
  	pushl %ecx
  
  	pushl %eax				
  	pushl $formatPrintLitera
  	call printf
  	popl %ebx
  	popl %ebx
  	
  	
  	popl %ecx
  	
  	incl %ecx
  	
  	incl t
  	
  	jmp et_for_sirb2
    
 
  
operatie:      				
	
	movl t, %eax
 	mull val12			
 	addl $9, %eax			
 		
 	movl %eax, %ecx
	
  	movb (%esi, %ecx, 1), %ah		
	
	cmp $49, %ah
	je este_div
	
	cmp $48, %ah
	je b10
	
b10:

	incl %ecx
	movb (%esi, %ecx, 1), %ah		
	
	cmp $49, %ah
	je b11_1
	
	cmp $48, %ah
	je b11_0

b11_1:

	incl %ecx
	movb (%esi, %ecx, 1), %ah		
	
	cmp $49, %ah
	je este_mul
	
	cmp $48, %ah
	je este_sub

b11_0:

	incl %ecx
	movb (%esi, %ecx, 1), %ah		
	
	cmp $49, %ah
	je este_add
	
	cmp $48, %ah
	je este_let
		
este_let:
	
	pushl %ecx
	
	pushl $strlet
	pushl $formatPrintf
   	call printf
   	popl %ebx
    	popl %ebx
	
	popl %ecx
	
	jmp segment_nou_operatie

este_add:
	
	pushl %ecx
	
	pushl $stradd
	pushl $formatPrintf
   	call printf
   	popl %ebx
    	popl %ebx
	
	popl %ecx
	
	jmp segment_nou_operatie


este_sub:
	
	pushl %ecx
	
	pushl $strsub
	pushl $formatPrintf
   	call printf
   	popl %ebx
    	popl %ebx
	
	popl %ecx
	
	jmp segment_nou_operatie


este_mul:
	
	pushl %ecx
	
	pushl $strmul
	pushl $formatPrintf
   	call printf
   	popl %ebx
    	popl %ebx
	
	popl %ecx
	
	jmp segment_nou_operatie


este_div:	
	
	pushl %ecx
	
	pushl $strdiv
	pushl $formatPrintf
   	call printf
   	popl %ebx
    	popl %ebx
	
	popl %ecx
	
	addl $2, %ecx
	
	jmp segment_nou_operatie

	
segment_nou_operatie:
	
	incl %ecx
  	
  	incl t
  	
  	jmp et_for_sirb2
    


  
et_exit:
	
	pushl $newline
   	call printf
   	popl %ebx
    	popl %ebx
	
	
	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80			
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


